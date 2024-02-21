import 'package:flutter/material.dart';

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
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: widget.onPrevious,
            onTapDown: (details) {
              widget.onHoldDown?.call();
            },
            onTapUp: (details) {
              widget.onRelease?.call();
            },
            child: Container(
              color: Colors.transparent,
              child: const SizedBox.expand(),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: GestureDetector(
            onTap: widget.onNext,
            onTapDown: (details) {
              widget.onHoldDown?.call();
            },
            onTapUp: (details) {
              widget.onRelease?.call();
            },
            child: Container(
              color: Colors.transparent,
              child: const SizedBox.expand(),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: widget.onNext,
            onTapDown: (details) {
              widget.onHoldDown?.call();
            },
            onTapUp: (details) {
              widget.onRelease?.call();
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
