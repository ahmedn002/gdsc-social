import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../widgets/actions/main_icon_button.dart';
import '../../../../domain/entities/post_entity.dart';

class PostCardTopSection extends StatelessWidget {
  const PostCardTopSection({
    super.key,
    required this.post,
  });

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(post.userImageUrl),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.username,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Text(
                  '@${post.userTag}',
                  style: textTheme.labelSmall,
                ),
                const SizedBox(width: 4),
                const CircleAvatar(
                  radius: 2,
                  backgroundColor: AppColors.secondaryText,
                ),
                const SizedBox(width: 4),
                Text(
                  post.timeAgo,
                  style: textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        MainIconButton(
          icon: const Icon(Icons.more_vert_rounded),
          onPressed: () {},
          filled: false,
        )
      ],
    );
  }
}
