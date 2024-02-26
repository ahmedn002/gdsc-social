import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdsc_social/core/constants/assets.dart';
import 'package:gdsc_social/core/constants/colors.dart';

class ToolBar extends StatelessWidget {
  const ToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.elevation,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AssetData.searchSvg),
          const SizedBox(width: 24),
          SvgPicture.asset(AssetData.notificationsSvg),
          const SizedBox(width: 24),
          SvgPicture.asset(AssetData.chatSvg),
        ],
      ),
    );
  }
}
