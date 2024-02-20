import 'package:flutter/material.dart';

class InvisibleNextAndPreviousButtons extends StatelessWidget {
  final void Function()? onNext;
  final void Function()? onPrevious;
  const InvisibleNextAndPreviousButtons({super.key, this.onNext, this.onPrevious});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onPrevious,
            child: Container(
              color: Colors.transparent,
              child: const SizedBox.expand(),
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          child: GestureDetector(
            onTap: onNext,
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
