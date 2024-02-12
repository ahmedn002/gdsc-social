import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/features/home/domain/entities/story_entity.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/stories/story_border_custom_painter.dart';

class StoryCircle extends StatelessWidget {
  final StoryEntity story;
  const StoryCircle({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
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
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(story.userImageUrl),
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
          ),
          const SizedBox(height: 4),
          Text(
            '@${story.userTag}',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.secondaryText),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
