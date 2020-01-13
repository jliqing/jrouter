import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:jrouter/jrouter.dart';
import 'package:jrouter/src/collector.dart';
import 'package:jrouter/src/writer.dart';
import 'package:source_gen/source_gen.dart';

class RouteRootGenerator extends GeneratorForAnnotation<JRouteRoot> {
  Collector collector() {
    return RouteGenerator.collector;
  }

  @override
  dynamic generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    return Writer(collector()).write();
  }
}

class RouteGenerator extends GeneratorForAnnotation<JRoute> {
  static Collector collector = Collector();

  @override
  dynamic generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    collector.collector(element, annotation, buildStep);
    return null;
  }
}
