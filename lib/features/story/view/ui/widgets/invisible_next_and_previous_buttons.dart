import 'package:flutter/material.dart';

class InvisibleGestureDetectors extends StatelessWidget {
  final void Function()? onPrevious;

  final void Function()? onHoldDown;
  final void Function()? onRelease;
  final void Function()? onNext;
  const InvisibleGestureDetectors({super.key, this.onPrevious, this.onHoldDown, this.onRelease, this.onNext});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onPrevious,
            onTapDown: (details) {
              onHoldDown?.call();
            },
            onTapUp: (details) {
              onRelease?.call();
            },
            child: Container(
              color: Colors.transparent,
              child: const SizedBox.expand(),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTapDown: (details) {
              onHoldDown?.call();
            },
            onTapUp: (details) {
              onRelease?.call();
            },
            child: Container(
              color: Colors.transparent,
              child: const SizedBox.expand(),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: onNext,
            onTapDown: (details) {
              onHoldDown?.call();
            },
            onTapUp: (details) {
              onRelease?.call();
            },
            child: Container(
              color: Colors.transparent,
              child: const SizedBox.expand(),
            ),
          ),
        ),
      ],
    );
  }
}
