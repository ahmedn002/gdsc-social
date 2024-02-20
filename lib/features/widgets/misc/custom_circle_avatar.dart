import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/core/constants/measurements.dart';
import 'package:gdsc_social/features/widgets/misc/shimmer.dart';

class CustomCircleAvatar extends StatelessWidget {
  final double radius;
  final String imageUrl;
  const CustomCircleAvatar({super.key, this.radius = Measurements.postAvatarRadius, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          radius: radius,
          backgroundImage: imageProvider,
        );
      },
      placeholder: (context, url) {
        return Shimmer(
          child: CircleAvatar(
            radius: radius,
            backgroundColor: AppColors.elevation,
          ),
        );
      },
      errorWidget: (context, url, error) {
        return CircleAvatar(
          radius: radius,
          backgroundColor: AppColors.elevation,
        );
      },
    );
  }
}
