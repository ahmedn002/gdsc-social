import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/measurements.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/story_circle.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/user_story_circle.dart';

import '../../../domain/entities/story_entity.dart';

class StoriesSection extends StatelessWidget {
  final List<StoryEntity> stories;
  const StoriesSection({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: stories.length + 1,
      itemBuilder: (context, index) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(left: Measurements.pageHorizontalPadding),
            child: index == 0 ? const UserStoryCircle() : StoryCircle(story: stories[index - 1]),
          ),
        );
      },
    );
  }
}
