import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/core/utils/hero_tag.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/stories/story_border_custom_painter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../story/domain/entities/story_entity.dart';
import '../../../../../widgets/misc/custom_circle_avatar.dart';

class StoryCircle extends StatelessWidget {
  final StoryEntity story;
  const StoryCircle({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Go to story page and pass story as parameter
        context.push('/story', extra: story);
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 80,
          maxWidth: 80,
        ),
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1, // Square
                child: Padding(
                  padding: const EdgeInsets.all(2), // Because the custom painter gets slightly cut off
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(2), // Padding between the circle and the border
                          child: Hero(
                            tag: HeroTagUtils.generateStoryTag(story.storyId),
                            child: CustomCircleAvatar(
                              imageUrl: story.userImageUrl,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: CustomPaint(
                          painter: StoryBorderPainter(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
                .animate()
                .then(delay: 200.ms)
                .slideY(curve: Curves.easeOutExpo, duration: 1.seconds)
                .fade(curve: Curves.easeOutExpo, duration: 1.seconds)
                .rotate(curve: Curves.easeOutExpo, begin: 0.1, end: 0, duration: 2.seconds),
            const SizedBox(height: 4),
            Text(
              '@${story.userTag}',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.secondaryText),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
