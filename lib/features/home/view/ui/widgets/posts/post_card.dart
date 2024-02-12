import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/features/home/domain/entities/post_entity.dart';
import 'package:gdsc_social/features/home/view/ui/utils/post_body_parser.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/posts/post_card_body_section.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/posts/post_card_top_section.dart';

class PostCard extends StatelessWidget {
  final PostEntity post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkerBackground,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          PostCardTopSection(post: post),
          const SizedBox(height: 16),
          PostCardBodySection(body: PostBodyParser.parse(post.body)),
        ],
      ),
    );
  }
}
