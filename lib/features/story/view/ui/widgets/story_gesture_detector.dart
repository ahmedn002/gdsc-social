import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class StoryGestureDetector extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final GestureLongPressStartCallback onLongPressStart;
  final GestureLongPressEndCallback onLongPressEnd;
  final VoidCallback? onLongPress;

  const StoryGestureDetector({
    super.key,
    this.child,
    required this.duration,
    required this.onLongPressStart,
    required this.onLongPressEnd,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      behavior: HitTestBehavior.translucent,
      gestures: <Type, GestureRecognizerFactory>{
        LongPressGestureRecognizer: GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
          () => LongPressGestureRecognizer(duration: duration),
          (instance) {
            instance.onLongPress = () {
              print("Parent onLongPress");
              onLongPress?.call();
            };
            instance.onLongPressStart = (details) {
              print("Parent onLongPressStart");
              onLongPressStart.call(details);
            };
            instance.onLongPressEnd = (details) {
              print("Parent onLongPressEnd");
              onLongPressEnd.call(details);
            };
          },
        ),
      },
      child: child,
    );
  }
}
