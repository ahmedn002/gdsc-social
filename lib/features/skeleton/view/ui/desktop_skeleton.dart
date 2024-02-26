import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import 'components/body_scroll_view.dart';

class DesktopSkeleton extends StatelessWidget {
  final Widget upperBody;
  final Widget lowerBody;
  final Widget? rightSideBar;
  final bool enableUpperBodyPadding;
  final bool enableLowerBodyPadding;
  final bool enableRightSideBarPadding;
  const DesktopSkeleton({
    super.key,
    required this.upperBody,
    required this.lowerBody,
    this.rightSideBar,
    this.enableUpperBodyPadding = true,
    this.enableLowerBodyPadding = true,
    this.enableRightSideBarPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: BodyScrollView(
              enableUpperBodyPadding: enableUpperBodyPadding,
              upperBody: upperBody,
              enableLowerBodyPadding: enableLowerBodyPadding,
              lowerBody: lowerBody,
              enablePersistentHeader: false,
            ),
          ),
        ],
      ),
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
