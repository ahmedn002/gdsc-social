import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdsc_social/core/constants/assets.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/core/constants/measurements.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';
import 'package:gdsc_social/features/story/domain/entities/story_entity.dart';
import 'package:gdsc_social/features/story/view/ui/widgets/loading_bar.dart';
import 'package:gdsc_social/features/story/view/ui/widgets/story_circle_hero.dart';
import 'package:gdsc_social/features/widgets/input/text_input.dart';

class StoryHeaderSection extends StatefulWidget {
  final StoryEntity story;
  const StoryHeaderSection({super.key, required this.story});

  @override
  State<StoryHeaderSection> createState() => _StoryHeaderSectionState();
}

class _StoryHeaderSectionState extends State<StoryHeaderSection> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            for (var image in widget.story.storyImages) ...[
              Expanded(
                child: LoadingBar(),
              ),
              if (image != widget.story.storyImages.last) 5.hs,
            ]
          ],
        ),
        20.vs,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              StoryCircleHero(story: widget.story),
              10.hs,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.story.userName, style: Theme.of(context).textTheme.titleMedium),
                  5.vs,
                  Text('@${widget.story.userTag}', style: Theme.of(context).textTheme.labelSmall),
                ],
              ),
              const Spacer(),
              Text(widget.story.storyImages[0].timeAgo, style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Measurements.pageHorizontalPadding),
          child: TextInput(
            controller: _textEditingController,
            hintText: 'Message @${widget.story.userTag}',
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
        ),
        Measurements.pageVerticalPadding.vs,
      ],
    );
  }
}
