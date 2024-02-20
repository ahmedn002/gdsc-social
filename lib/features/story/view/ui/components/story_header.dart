import 'package:flutter/material.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';
import 'package:gdsc_social/features/story/domain/entities/story_entity.dart';
import 'package:gdsc_social/features/story/view/ui/widgets/loading_bar.dart';
import 'package:gdsc_social/features/story/view/ui/widgets/story_circle_hero.dart';

class StoryHeaderSection extends StatefulWidget {
  final StoryEntity story;
  final int currentIndex;
  final bool shouldLoadViewTime;
  final void Function(int completedIndex, bool isLastIndex)? onLoadingComplete;
  const StoryHeaderSection({super.key, required this.story, required this.currentIndex, required this.shouldLoadViewTime, this.onLoadingComplete});

  @override
  State<StoryHeaderSection> createState() => _StoryHeaderSectionState();
}

class _StoryHeaderSectionState extends State<StoryHeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            for (var image in widget.story.storyImages) ...[
              Expanded(
                child: LoadingBar(
                  fillProgress: widget.story.storyImages.indexOf(image) < widget.currentIndex,
                  shouldLoad: widget.story.storyImages.indexOf(image) == widget.currentIndex && widget.shouldLoadViewTime,
                  onLoadingComplete: () {
                    final int completedIndex = widget.story.storyImages.indexOf(image);
                    final bool isLastIndex = completedIndex == widget.story.storyImages.length - 1;
                    widget.onLoadingComplete?.call(completedIndex, isLastIndex);
                  },
                ),
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
      ],
    );
  }
}
