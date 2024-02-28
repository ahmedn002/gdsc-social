import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/measurements.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';
import 'package:gdsc_social/core/extensions/text_styles.dart';
import 'package:gdsc_social/features/home/domain/entities/hashtag_entity.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/hashtags/hashtags_card.dart';

import '../../../../../core/constants/colors.dart';

class HomeRightSideBar extends StatelessWidget {
  final List<HashTagEntity> popularHashtags;
  const HomeRightSideBar({super.key, required this.popularHashtags});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.darkerBackground,
        border: Border(
          left: BorderSide(
            width: 2,
            color: AppColors.elevation,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Measurements.pageHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Measurements.pageVerticalPadding.vs,
              Text(
                'Popular hashtags',
                style: context.textTheme.titleMedium,
              ),
              10.vs,
              HashTagsCard(hashtags: popularHashtags),
            ],
          ),
        ),
      ),
    );
  }
}
