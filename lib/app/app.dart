import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/app/app_injector.dart';
import 'package:project/app/app_localizations.dart';
import 'package:project/app/app_reporter.dart';
import 'package:project/app/app_routing.dart';
import 'package:project/app/state/audio/audio_state.dart';
import 'package:project/app/state/initialization/initialization_state.dart';
import 'package:project/app/state/precache/image_precache_state.dart';
import 'package:project/app/state/router/router_state.dart';
import 'package:project/app/widget/app_global_error_dialog.dart';
import 'package:project/common/constant/app_theme.dart';
import 'package:rive/rive.dart' show RiveFile;
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_connectivity/utopia_connectivity.dart';
import 'package:utopia_localization_utils/utopia_localization_utils.dart';
import 'package:project/util/hook/use_async_stream_subscription.dart';

typedef NavigatorKey = GlobalKey<NavigatorState>;

class App extends HookWidget {
  static void run() {
    unawaited(RiveFile.initialize());

    runWithReporterAndUiErrors(appReporter, (uiErrors) async {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(App(uiErrors: uiErrors));
    });
  }

  final Stream<UiGlobalError> uiErrors;

  const App({super.key, required this.uiErrors});

  @override
  Widget build(BuildContext context) {
    final navigatorKey = useMemoized(GlobalKey<NavigatorState>.new);

    return _buildApp(
      navigatorKey: navigatorKey,
      builder: (context, child) => HookProviderContainerWidget(
        _buildProviders(navigatorKey),
        child: HookBuilder(
          builder: (context) {
            useAsyncStreamSubscription<UiGlobalError>(
              uiErrors,
              (error) async =>
                  _handleUiError(context, error, navigatorKey.currentState!),
            );
            return child;
          },
        ),
      ),
    );
  }

  Widget _buildApp({
    required GlobalKey<NavigatorState> navigatorKey,
    required Widget Function(BuildContext context, Widget child) builder,
  }) {
    return MaterialApp(
      // theming
      theme: appTheme,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
      ),
      // navigation
      navigatorKey: navigatorKey,
      onGenerateInitialRoutes: (name) => [
        RouteConfig.generateInitialRoute(AppRouting.routes, name),
      ],
      onGenerateRoute: (settings) =>
          RouteConfig.generateRoute(AppRouting.routes, settings),
      navigatorObservers: [
        RouteConfig.createNavigationObserver(AppRouting.routes),
      ],
      initialRoute: AppRouting.initialRoute,
      // localization
      localizationsDelegates: const [
        UtopiaLocalizationsDelegate<AppLocalizationsData>(appLocalizationsData),
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      supportedLocales: appLocalizationsData.supportedLocales,
      // other
      debugShowCheckedModeBanner: false,
      builder: (context, child) => builder(context, child!),
    );
  }

  Map<Type, Object? Function()> _buildProviders(NavigatorKey navigatorKey) {
    return {
      NavigatorKey: () => navigatorKey,
      // Injector: () => useMemoized(() => Injector.build(AppInjector.setup)),
      Injector: AppInjector.use,
      ConnectivityState: useConnectivityState,
      RouterState: useRouterState,
      AudioState: useAudioState,
      ImagePrecacheState: useImagePrecacheState,
      InitializationState: useInitializationState, // leave at the end
    };
  }

  Future<void> _handleUiError(
    BuildContext context,
    UiGlobalError error,
    NavigatorState navigator,
  ) async {
    final exception = error.error;

    /// Handle case when project is playing and suddenly internet connection is interrupted
    /// Don't show the dialog error box cause this case is handled by routing
    if (exception is PlatformException) {
      if (exception.message == "Source error") {
        appReporter.info("radio chce grać a nie ma jak");
        return;
      }
    }

    // skip debug-time assertion errors
    if (error.error is! AssertionError) {
      final route = DialogRoute<void>(
        context: context,
        builder: (context) => AppGlobalErrorDialog(error: error),
      );
      await navigator.push(route);
    }
  }
}
