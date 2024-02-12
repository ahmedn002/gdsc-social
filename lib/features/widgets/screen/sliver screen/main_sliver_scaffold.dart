import 'package:flutter/material.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/measurements.dart';
import '../main_scaffold.dart';

class MainSliverScaffold extends StatelessWidget {
  final Widget persistentHeader;
  final Widget upperBody;
  final Widget lowerBody;
  final bool enableUpperBodyPadding;
  final bool enableLowerBodyPadding;
  const MainSliverScaffold({
    super.key,
    required this.persistentHeader,
    required this.upperBody,
    required this.lowerBody,
    this.enableUpperBodyPadding = true,
    this.enableLowerBodyPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            delegate: PersistentHeader(
              widget: persistentHeader,
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
