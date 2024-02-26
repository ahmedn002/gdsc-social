import 'package:flutter/material.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/measurements.dart';
import '../../../../widgets/screen/main_scaffold.dart';
import 'app_bar.dart';

class BodyScrollView extends StatelessWidget {
  final bool enableUpperBodyPadding;
  final Widget upperBody;
  final bool enableLowerBodyPadding;
  final Widget lowerBody;
  final bool enablePersistentHeader;

  const BodyScrollView({
    super.key,
    required this.enableUpperBodyPadding,
    required this.upperBody,
    required this.enableLowerBodyPadding,
    required this.lowerBody,
    this.enablePersistentHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        if (enablePersistentHeader)
          SliverPersistentHeader(
            delegate: PersistentHeader(
              widget: const Padding(
                padding: EdgeInsets.symmetric(horizontal: Measurements.pageHorizontalPadding),
                child: MainAppBar(),
              ),
            ),
            pinned: true,
          ),
        SliverToBoxAdapter(
          child: ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              padding: EdgeInsets.only(
                left: enableUpperBodyPadding ? Measurements.pageHorizontalPadding : 0,
                right: enableUpperBodyPadding ? Measurements.pageHorizontalPadding : 0,
                top: enableUpperBodyPadding ? Measurements.pageVerticalPadding : 0,
              ),
              color: AppColors.darkerBackground,
              child: upperBody,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            left: enableLowerBodyPadding ? Measurements.pageHorizontalPadding : 0,
            right: enableLowerBodyPadding ? Measurements.pageHorizontalPadding : 0,
            top: enableLowerBodyPadding ? Measurements.pageVerticalPadding : 0,
          ),
          sliver: lowerBody,
        ),
        SliverToBoxAdapter(
          child: 16.vs,
        ),
      ],
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;
  final double _height = 60;

  PersistentHeader({required this.widget});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: _height,
      color: AppColors.darkerBackground,
      child: widget,
    );
  }

  @override
  double get maxExtent => _height;

  @override
  double get minExtent => _height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
