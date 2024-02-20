import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdsc_social/core/constants/assets.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';
import 'package:gdsc_social/features/home/domain/entities/post_entity.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/posts/post_card_bottom_section_toolbox_component.dart';
import 'package:gdsc_social/features/widgets/actions/main_icon_button.dart';

class PostCardBottomSection extends StatelessWidget {
  final PostEntity post;
  const PostCardBottomSection({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.elevation,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              PostCardBottomSectionToolboxComponent(
                count: post.likes,
                onPressed: () {},
                child: SvgPicture.asset(AssetData.heartSvg),
              ),
              16.hs,
              PostCardBottomSectionToolboxComponent(
                count: post.comments,
                onPressed: () {},
                child: SvgPicture.asset(AssetData.commentSvg),
              ),
              16.hs,
              PostCardBottomSectionToolboxComponent(
                count: post.shares,
                onPressed: () {},
                child: SvgPicture.asset(AssetData.shareSvg),
              ),
            ],
          ),
        ),
        const Spacer(),
        MainIconButton(
          icon: SvgPicture.asset(AssetData.saveSvg),
          onPressed: () {},
          filled: false,
        ),
      ],
    );
  }
}
