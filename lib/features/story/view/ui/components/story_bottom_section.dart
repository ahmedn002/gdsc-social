import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';
import 'package:gdsc_social/features/story/view/ui/widgets/story_quick_reply_button.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/measurements.dart';
import '../../../../widgets/input/text_input.dart';

class StoryBottomSection extends StatelessWidget {
  final TextEditingController controller;
  final String userTag;
  const StoryBottomSection({super.key, required this.controller, required this.userTag});

  final List<String> _reactions = const <String>[
    '💖',
    '🔥',
    '😂',
    '😢',
    '😲',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Measurements.pageHorizontalPadding),
      child: Column(
        children: [
          Row(
            children: [
              for (var reaction in _reactions) ...[
                Expanded(child: StoryQuickReplyButton(text: reaction)),
                if (reaction != _reactions.last) 10.hs,
              ],
            ],
          ),
          20.vs,
          TextInput(
            controller: controller,
            hintText: 'Message @$userTag',
            borderColor: AppColors.elevation,
            fillColor: AppColors.darkerBackground,
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
        ],
      ),
    );
  }
}
