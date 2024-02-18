import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/measurements.dart';
import 'package:gdsc_social/core/utils/hero_tag.dart';
import 'package:gdsc_social/features/story/domain/entities/story_entity.dart';
import 'package:gdsc_social/features/widgets/misc/custom_circle_avatar.dart';

class StoryCircleHero extends StatelessWidget {
  final StoryEntity story;
  const StoryCircleHero({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: HeroTagUtils.generateStoryTag(story.storyId),
      child: CustomCircleAvatar(
        imageUrl: story.userImageUrl,
        radius: Measurements.storyAvatarRadius,
      ),
    );
  }
}
