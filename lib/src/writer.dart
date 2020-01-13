import 'package:mustache4dart/mustache4dart.dart';

import 'collector.dart';
import 'tpl.dart';

class Writer {
  Collector collector;
  Writer(this.collector);

  String write() {
    final List<Map<String, String>> refs = <Map<String, String>>[];
    final Function addRef = (String path) {
      refs.add(<String, String>{'path': path});
    };
    collector.importList.forEach(addRef);
    return render(clazzTpl, <String, dynamic>{
      'refs': refs,
      'routerMap': collector.routerMap.toString(),
    });
  }
}
