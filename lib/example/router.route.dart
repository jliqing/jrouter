import 'package:flutter/material.dart';
import 'package:jrouter/example/router.route.internal.dart';
import 'package:jrouter/jrouter.dart';

@JRouteRoot()
class Router extends NavigatorObserver {
  Router._();

  static Router _instance;

  static Router _getInstance() {
    if (_instance == null) {
      _instance = Router._();
    }
    return _instance;
  }

  static Router get instance => _getInstance();

  JRouterInternalImpl _routes = JRouterInternalImpl();

  getRoutes() {
    return _routes.innerRouterMap;
  }
}
