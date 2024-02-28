import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';
import 'package:gdsc_social/core/extensions/text_styles.dart';
import 'package:gdsc_social/features/home/domain/entities/hashtag_entity.dart';

class HashTagTile extends StatelessWidget {
  final HashTagEntity hashtag;
  const HashTagTile({super.key, required this.hashtag});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '#${hashtag.name}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
        5.vs,
        Text(
          '${hashtag.count} posts',
          style: context.textTheme.labelSmall,
        ),
      ],
    );
  }
}
