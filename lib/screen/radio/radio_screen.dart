import 'package:flutter/widgets.dart';
import 'package:project/screen/radio/view/radio_screen_view.dart';
import 'package:project/screen/radio/state/radio_screen_state.dart';
import 'package:utopia_arch/utopia_arch.dart';

class RadioScreen extends HookWidget {
  static const route = '/radio';
  static final routeConfig = RouteConfig.material(RadioScreen.new);

  @override
  Widget build(BuildContext context) {
    final state = useRadioScreenState();
    return RadioScreenView(state: state);
  }
}
