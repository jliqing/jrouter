const String clazzTpl = """
import 'package:flutter/material.dart' show BuildContext;
{{#refs}}
import '{{{path}}}';
{{/refs}}

class JRouterInternalImpl {

  JRouterInternalImpl();

  final Map<String, dynamic> innerRouterMap = <String, dynamic>{{{routerMap}}};

}
""";

