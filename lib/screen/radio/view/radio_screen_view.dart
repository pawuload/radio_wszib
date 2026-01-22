import 'package:flutter/material.dart';
import 'package:project/common/constant/app_images.dart';
import 'package:project/screen/radio/state/radio_screen_state.dart';
import 'package:project/screen/radio/widget/radio_screen_live_title.dart';
import 'package:rive/rive.dart' hide Image, LinearGradient;
import 'package:utopia_arch/utopia_arch.dart';

class RadioScreenView extends StatelessWidget {
  final RadioScreenState state;

  const RadioScreenView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !state.isRadioInitialized
          ? _buildError()
          : SafeArea(
              child: GestureDetector(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(-0.5, -0.9),
                      child: Text(
                        "Radio Slav\nRuny, biesy i bóstwa",
                        // style: TealText.smallHeader.copyWith(fontSize: 22),
                      ),
                    ),
                    _buildVinyl(),
                    _buildPlay(context),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildVinyl() {
    return Center(
      child: HookBuilder(
        builder: (context) {
          final arm = useState<SMIInput<bool>?>(null);
          final isOn = useState<SMIInput<bool>?>(null);
          final record = useState<SMIInput<bool>?>(null);

          void onRiveInit(Artboard artboard) {
            final controller = StateMachineController.fromArtboard(
              artboard,
              'Vinyl State', // Replace with your state machine's name
            );
            if (controller != null) {
              artboard.addController(controller);

              isOn.value = controller.findInput<bool>('Spin Record')!;
              arm.value = controller.findInput<bool>('On / Off');
              record.value = controller.findInput<bool>('Move Needle');
            }
          }

          useEffect(() {
            print(arm.value != null);
            if (arm.value != null) {
              arm.value!.value = state.hasAudioStarted;
              isOn.value!.value = state.hasAudioStarted;
              record.value!.value = state.hasAudioStarted;
            }
          }, [state.hasAudioStarted]);

          return GestureDetector(
            onTap: state.onPlayPressed,
            child: RiveAnimation.asset(AppImages.vinylRive, onInit: onRiveInit),
          );
        },
      ),
    );
  }

  Widget _buildPlay(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: state.hasAudioStarted ? 12 : 0),
      child: GestureDetector(
        onTap: state.onPlayPressed.takeIf((_) => !state.hasAudioStarted),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: state.hasAudioStarted
              ? Alignment(0, -0.7)
              : Alignment.center,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: state.hasAudioStarted ? 400 : 110,
            height: state.hasAudioStarted ? 50 : 110,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1,
              ).takeIf((_) => !state.hasAudioStarted),
              gradient: LinearGradient(
                colors: [
                  Color(0xff046408),
                  Color(0xff015604),
                  Color(0xff046408),
                ],
              ),

              borderRadius: BorderRadius.circular(
                state.hasAudioStarted ? 16 : 250,
              ),
            ),
            child: _buildButton(context),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(scale: animation, child: child),
          );
        },
        child: state.hasAudioStarted
            ? Row(
                children: [
                  Expanded(
                    child: RadioScreenLiveTitle(song: state.currentSong),
                  ),
                ],
              )
            : const Icon(
                Icons.play_arrow_sharp,
                key: ValueKey('icon'),
                // color: TealColors.text,
                size: 50,
              ),
      ),
    );
  }

  Widget _buildError() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.warning_amber_rounded,
              size: 64,
              // color: TealColors.text,
            ),
            const SizedBox(height: 16),
            Text(
              "Radio jest offline",
              // style: TealText.header,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              "Idź poskacz po lesie, póki nie wrócimy!",
              // style: TealText.text.copyWith(fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
