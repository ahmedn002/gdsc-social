import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/measurements.dart';
import '../../../../widgets/input/text_input.dart';

class StoryBottomSection extends StatelessWidget {
  final TextEditingController controller;
  final String userTag;
  const StoryBottomSection({super.key, required this.controller, required this.userTag});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Measurements.pageHorizontalPadding),
      child: TextInput(
        controller: controller,
        hintText: 'Message @$userTag',
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AssetData.paperClipSvg, height: 20),
            10.hs,
            CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.darkerAccent,
              child: SvgPicture.asset(AssetData.paperPlaneSvg, height: 15),
            ),
            10.hs,
          ],
        ),
      ),
    );
  }
}
