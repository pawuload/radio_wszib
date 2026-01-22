import 'package:flutter/cupertino.dart';
import 'package:project/screen/connectivity/connectivity_screen.dart';
import 'package:project/screen/splash/splash_screen.dart';
import 'package:project/util/extension/navigator_extensions.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_connectivity/utopia_connectivity.dart';

import '../../app_reporter.dart';

final _reporter = PrefixedReporter(appReporter, "[RouterState] ");

class RouterState {
  RouterState();
}

RouterState useRouterState() {
  final connectivityState = useProvided<ConnectivityState>();
  final navigatorKey = useProvided<GlobalKey<NavigatorState>>();

  useAutoComputedState(
    shouldCompute: connectivityState.isInitialized,
        () async {


      final currentRoute = navigatorKey.currentState?.currentRoute;

      _reporter.info("Connections: ${connectivityState.result}, currentRoute=$currentRoute");

      if (connectivityState.hasConnection && currentRoute == ConnectivityScreen.route) {
        await navigatorKey.currentState?.pushNamedAndReset(SplashScreen.route);
      }

      if (!connectivityState.hasConnection && currentRoute != ConnectivityScreen.route) {
        await navigatorKey.currentState?.pushNamedAndReset(ConnectivityScreen.route);
      }
    },
    keys: [connectivityState.result],
  );

  return RouterState();
}
