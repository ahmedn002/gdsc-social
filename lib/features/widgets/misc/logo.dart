import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdsc_social/core/constants/assets.dart';
import 'package:gdsc_social/core/constants/colors.dart';

class Logo extends StatelessWidget {
  final bool shrink;
  const Logo({super.key, this.shrink = false});

  @override
  Widget build(BuildContext context) {
    if (shrink) {
      return SvgPicture.asset(AssetData.logoSvg);
    }
    return Row(
      children: [
        SvgPicture.asset(AssetData.logoSvg),
        const SizedBox(width: 8),
        Text(
          'Social',
          style: Theme.of(context).textTheme.titleLarge?.apply(fontWeightDelta: 4, fontSizeFactor: 1.2, color: AppColors.tertiaryText),
        ),
      ],
    );
  }
}
