import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/measurements.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';
import 'package:gdsc_social/features/home/view/ui/utils/post_body_parser.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/posts/post_card_body_section.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/posts/post_header.dart';
import 'package:gdsc_social/features/widgets/misc/dashed_line.dart';

import '../../../../domain/entities/post_entity.dart';

class PostCardTopSection extends StatelessWidget {
  final PostEntity post;
  const PostCardTopSection({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostHeader(post: post),
        IntrinsicHeight(
          child: Row(
            children: [
              (Measurements.postAvatarRadius - Measurements.threadLineCircleRadius).hs,
              const DashedLine(),
              (Measurements.postAvatarRadius + 8).hs,
              Expanded(
                child: PostCardBodySection(body: PostBodyParser.parse(post.body)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
