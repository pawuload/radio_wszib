import 'package:flutter/cupertino.dart';

extension NavigatorStateExtension on NavigatorState {
  String? get currentRoute {
    String? name;
    popUntil((route) {
      name = route.settings.name;
      return true;
    });
    return name;
  }
}
