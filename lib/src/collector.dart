import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class Collector {
  Collector();

  /**
   * 
   * ```Dart
   * <String, WidgetBuilder>{
   *  "url": (BuildContext context) => A(),
   * }
   * ```
   */

  Map<String, dynamic> routerMap = <String, dynamic>{};
  List<String> importList = <String>[];

  Map<String, DartObject> toStringDartObjectMap(
    Map<DartObject, DartObject> map,
  ) {
    return map.map((DartObject k, DartObject v) {
      return MapEntry<String, DartObject>(k.toStringValue(), v);
    });
  }

  Map<String, String> toStringStringMap(Map<DartObject, DartObject> map) {
    return map.map((DartObject k, DartObject v) {
      return MapEntry<String, String>(k.toStringValue(), v.toStringValue());
    });
  }

  void collector(
    ClassElement element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final String className = element.name;
    final String url = annotation.peek('url')?.stringValue;
    if (url != null) {
      addEntryFromPageConfig(annotation, className);
    }
    final ConstantReader alias = annotation.peek('alias');
    if (alias != null) {
      final List<DartObject> aliasList = alias.listValue;
      final Function addEntry = (DartObject one) {
        final ConstantReader oneObj = ConstantReader(one);
        addEntryFromPageConfig(oneObj, className);
      };
      aliasList.forEach(addEntry);
    }

    if (buildStep.inputId.path.contains('lib/')) {
      importList.add("package:${buildStep.inputId.package}/${buildStep.inputId.path.replaceFirst('lib/', '')}");
    } else {
      importList.add("${buildStep.inputId.path}");
    }
  }

  void addEntryFromPageConfig(ConstantReader reader, String className) {
    final String url = reader.peek('url')?.stringValue;
    if (url != null) {
      routerMap["'$url'"] = "(BuildContext context) => $className()";
    }
  }

}
