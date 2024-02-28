import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/measurements.dart';
import 'package:gdsc_social/features/home/view/ui/components/posts_section_bloc_builder.dart';
import 'package:gdsc_social/features/home/view/ui/components/right_side_bar_bloc_builder.dart';
import 'package:gdsc_social/features/home/view/ui/components/stories_section_bloc_builder.dart';
import 'package:gdsc_social/features/skeleton/view/ui/components/adaptive_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print('Width: ${size.width}, Height: ${size.height}');
    return AdaptiveScreen.fromUpperLowerSideSections(
      enableUpperBodyPadding: false,
      enableLowerBodyPadding: true,
      enableRightSideBarPadding: true,
      upperBody: const Padding(
        padding: EdgeInsets.only(
          top: Measurements.pageVerticalPadding,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: StoriesSectionBlocBuilder(),
            ),
            SizedBox(height: 35),
          ],
        ),
      ),
      lowerBody: const PostsSectionBlocBuilder(),
      rightSideBar: const RightSideBarSectionBlocBuilder(),
    );
  }
}
