import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/app/state/initialization/initialization_state.dart';
import 'package:project/common/constant/app_colors.dart';
import 'package:project/common/constant/app_images.dart';
import 'package:project/screen/radio/radio_screen.dart';
import 'package:utopia_arch/utopia_arch.dart';

class SplashScreen extends HookWidget {
  static const route = '/splash';
  static final routeConfig = RouteConfig.material(
    SplashScreen.new,
    orientation: RouteConfigOrientation.portrait,
  );

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final initializationState = useProvided<InitializationState>();
    final navigator = context.navigator;

    useEffect(() async {
      if (initializationState.isInitialized) {
        unawaited(navigator.pushReplacementNamed(RadioScreen.route));
      }
    }, [initializationState.isInitialized]);

    return ColoredBox(
      color: AppColors.primary,
      child: Center(
        child: SizedBox.square(
          dimension: 100,
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
