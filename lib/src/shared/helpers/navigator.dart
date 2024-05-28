import 'package:flutter/material.dart';

class NavigatorCustom {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get currentState {
    return navigatorKey.currentState ?? NavigatorState();
  }

  Future<void> pushNamed(String path) async => currentState.pushNamed(path);
  Future<void> pushReplacementNamed(String path) async =>
      currentState.pushReplacementNamed(path);
}
