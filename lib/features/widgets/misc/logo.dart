import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdsc_social/core/constants/assets.dart';
import 'package:gdsc_social/core/constants/colors.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
