import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/features/home/domain/entities/hashtag_entity.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/hashtags/hashtag_tile.dart';

class HashTagsCard extends StatelessWidget {
  final List<HashTagEntity> hashtags;
  const HashTagsCard({super.key, required this.hashtags});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.elevation,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final hashtag in hashtags) ...[
            HashTagTile(hashtag: hashtag),
            if (hashtags.last != hashtag)
              Divider(
                color: AppColors.tertiaryText.withOpacity(0.33),
                thickness: 1,
                height: 30,
              ),
          ],
        ],
      ),
    );
  }
}
