import 'package:flutter/material.dart';
import 'package:gdsc_social/features/skeleton/view/ui/components/body_scroll_view.dart';
import 'package:gdsc_social/features/skeleton/view/ui/components/side_bar.dart';

import '../../../../core/constants/colors.dart';

class TabletSkeleton extends StatelessWidget {
  final Widget upperBody;
  final Widget lowerBody;
  final bool enableUpperBodyPadding;
  final bool enableLowerBodyPadding;
  const TabletSkeleton({
    super.key,
    required this.upperBody,
    required this.lowerBody,
    this.enableUpperBodyPadding = true,
    this.enableLowerBodyPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        final bool shrinkSidebar = constraints.maxWidth < 755;
        return Row(
          children: [
            Expanded(
              flex: shrinkSidebar ? 1 : 3,
              child: SideBar(shrink: shrinkSidebar),
            ),
            Expanded(
              flex: shrinkSidebar ? 7 : 8,
              child: BodyScrollView(
                enableUpperBodyPadding: enableUpperBodyPadding,
                upperBody: upperBody,
                enableLowerBodyPadding: enableLowerBodyPadding,
                lowerBody: lowerBody,
                enablePersistentHeader: false,
              ),
            ),
          ],
        );
      }),
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
