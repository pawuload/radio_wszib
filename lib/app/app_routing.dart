import 'package:project/screen/splash/splash_screen.dart';
import 'package:project/screen/radio/radio_screen.dart';
import 'package:utopia_arch/utopia_arch.dart';

class AppRouting {
  static final routes = <String, RouteConfig>{
    SplashScreen.route: SplashScreen.routeConfig,
    RadioScreen.route: RadioScreen.routeConfig,

  };

  static const initialRoute = SplashScreen.route;
}
