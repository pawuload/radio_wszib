import 'package:project/app/app_config.dart';
import 'package:project/service/api/api_service.dart';
import 'package:project/service/audio/background_audio_service.dart';
import 'package:utopia_arch/utopia_arch.dart';

class AppInjector {
  const AppInjector._();

  static Injector use() => useMemoized(() => Injector.build(_setup));

  static void _setup(InjectorRegister register) {
    register.instance(AppConfig.current);
    register.noarg(RadioApiService.new);
    register.noarg(BackgroundAudioService.new);
  }
}
