import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';
import 'package:gdsc_social/features/home/domain/entities/post_entity.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/posts/post_card_bottom_section.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/posts/post_card_top_section.dart';

class PostCard extends StatelessWidget {
  final PostEntity post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkerBackground,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        children: [
          PostCardTopSection(post: post),
          16.vs,
          PostCardBottomSection(post: post),
        ],
      ),
    );
  }
}
