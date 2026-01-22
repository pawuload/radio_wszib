import 'package:flutter/material.dart';
import 'package:project/model/song/song.dart';
import 'package:utopia_arch/utopia_arch.dart';

class RadioScreenLiveTitle extends HookWidget {
  final SongModel? song;

  const RadioScreenLiveTitle({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    final songTitle = song?.title ?? 'Radio Slav';
    final displayText = "$songTitle  •  Radio Slav 24/7 - Twój Słowiański Kącik";

    final textLengthFactor = (displayText.length / 40).clamp(1, 4);
    final endOffset = -textLengthFactor.toDouble();

    final songTitleAnimation = useAnimationController(duration: Duration(seconds: 10));
    useEffect(songTitleAnimation.repeat);

    final animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset(endOffset, 0.0),
    ).animate(CurvedAnimation(
      parent: songTitleAnimation,
      curve: Curves.linear,
    ));

    return ClipRect(
      child: SizedBox(
        width: double.infinity,
        child: SlideTransition(
          position: animation,
          child: Text(
            displayText,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ),
      ),
    );
  }
}
