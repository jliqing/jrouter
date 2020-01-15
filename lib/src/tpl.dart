const String clazzTpl = """
import 'package:flutter/material.dart' show BuildContext, WidgetBuilder;
{{#refs}}
import '{{{path}}}';
{{/refs}}

class JRouterInternalImpl {

  JRouterInternalImpl();

  final Map<String, WidgetBuilder> innerRouterMap = <String, WidgetBuilder>{{{routerMap}}};

}
""";

