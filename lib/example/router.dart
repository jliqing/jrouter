import 'package:flutter/material.dart';
import 'package:jrouter/jrouter.dart';
import './router.internal.dart';

@JRouteRoot()
class Router extends NavigatorObserver {
  
  final JRouterInternalImpl _internalImpl;

  Router._(this._internalImpl);

  static Router _instance;

  static Router _getInstance() {
    if (_instance == null) {
      _instance = Router._(JRouterInternalImpl());
    }
    return _instance;
  }

  static Router get instance => _getInstance();

  Map<String, WidgetBuilder> get routes => _internalImpl.innerRouterMap;
}
