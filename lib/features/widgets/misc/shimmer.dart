import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/colors.dart';

class Shimmer extends StatelessWidget {
  final Widget child;
  const Shimmer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Animate(
      onComplete: (AnimationController controller) {
        controller.repeat(reverse: true);
      },
      effects: [
        ShimmerEffect(
          duration: 1.seconds,
          curve: Curves.easeInOut,
          delay: 100.ms,
          color: AppColors.background,
          blendMode: BlendMode.srcATop,
          angle: 0,
          size: 8,
        )
      ],
      child: Animate(
        effects: [
          FadeEffect(
            delay: 1.seconds,
            duration: 2.seconds,
            curve: Curves.easeOutExpo,
          ),
        ],
        child: child,
      ),
    );
  }
}
