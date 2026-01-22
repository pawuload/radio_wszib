import 'package:project/app/state/audio/audio_state.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_connectivity/utopia_connectivity.dart';
import 'package:project/app/state/precache/image_precache_state.dart';

class InitializationState extends HasInitialized {
  const InitializationState({required super.isInitialized});
}

InitializationState useInitializationState() {
  final states = [
    useProvided<ConnectivityState>(),
    useProvided<AudioState>(),
    useProvided<ImagePrecacheState>(),
  ];

  return InitializationState(isInitialized: HasInitialized.all(states));
}
