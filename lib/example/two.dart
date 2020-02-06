import 'package:flutter/material.dart';
import 'package:jrouter/jrouter.dart';

@JRoute(alias: [
  JRouteAlias(url: "myapp://two"),
  JRouteAlias(url: "myapp://two_alias")
])
class Two extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
