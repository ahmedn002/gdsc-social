import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gdsc_social/features/story/view/ui/widgets/story_gesture_detector.dart';

class InvisibleGestureDetectors extends StatefulWidget {
  final void Function()? onPrevious;

  final void Function()? onHoldDown;
  final void Function()? onRelease;
  final void Function()? onNext;
  const InvisibleGestureDetectors({super.key, this.onPrevious, this.onHoldDown, this.onRelease, this.onNext});

  @override
  State<InvisibleGestureDetectors> createState() => _InvisibleGestureDetectorsState();
}

class _InvisibleGestureDetectorsState extends State<InvisibleGestureDetectors> {
  @override
  Widget build(BuildContext context) {
    return StoryGestureDetector(
      duration: 400.ms,
      onLongPressStart: (LongPressStartDetails details) {
        widget.onHoldDown?.call();
      },
      onLongPressEnd: (LongPressEndDetails details) {
        widget.onRelease?.call();
      },
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: widget.onPrevious,
              supportedDevices: const {PointerDeviceKind.mouse, PointerDeviceKind.touch},
              child: Container(
                color: Colors.transparent,
                child: const SizedBox.expand(),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: widget.onNext,
              child: Container(
                color: Colors.transparent,
                child: const SizedBox.expand(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
