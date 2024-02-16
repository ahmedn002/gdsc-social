import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gdsc_social/core/constants/colors.dart';

class CustomCircleAvatar extends StatelessWidget {
  final double radius;
  final String imageUrl;
  const CustomCircleAvatar({super.key, required this.radius, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // Shimmer using flutter_animate
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          radius: radius,
          backgroundImage: imageProvider,
        );
      },
      placeholder: (context, url) {
        return _buildLoadingShimmerAvatar();
      },
      errorWidget: (context, url, error) {
        return CircleAvatar(
          radius: radius,
          backgroundColor: AppColors.elevation,
        );
      },
    );
  }

  Widget _buildLoadingShimmerAvatar() {
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
        child: CircleAvatar(
          radius: radius,
          backgroundColor: AppColors.elevation,
        ),
      ),
    );
  }
}
