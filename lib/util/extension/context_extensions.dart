import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/app/app_localizations.dart';
import 'package:utopia_localization_utils/utopia_localization_utils.dart';

extension AppContextExtensions on BuildContext {
  AppLocalizationsData get strings => localizations();

  NavigatorState get navigator => Navigator.of(this);
}
