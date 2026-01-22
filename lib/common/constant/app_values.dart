import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AppValues {
  AppValues._();

  static const screenPaddingValue = 24.0;
  static const screenPaddingHorizontal = EdgeInsets.symmetric(horizontal: screenPaddingValue);
  static const screenPadding = EdgeInsets.all(screenPaddingValue);

  static final bigBorderRadius = BorderRadius.circular(30);
  static const Radius bigRadius = Radius.circular(30);
  static final midBorderRadius = BorderRadius.circular(24);
  static const Radius midRadius = Radius.circular(24);
  static final smallBorderRadius = BorderRadius.circular(14);
  static const Radius smallRadius = Radius.circular(14);

  static final dateFormat = DateFormat('dd-MM-yyyy');

  static const activeNpcModePassword = 'dupa321';
  static const animationCurve = Curves.easeInOutCubicEmphasized;
}
