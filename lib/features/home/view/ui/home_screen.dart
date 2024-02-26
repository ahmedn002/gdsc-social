import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/measurements.dart';
import 'package:gdsc_social/features/home/view/ui/components/posts_section_bloc_builder.dart';
import 'package:gdsc_social/features/home/view/ui/components/stories_section_bloc_builder.dart';
import 'package:gdsc_social/features/skeleton/view/ui/mobile_skeleton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileSkeleton(
      enableUpperBodyPadding: false,
      upperBody: Padding(
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
      lowerBody: PostsSectionBlocBuilder(),
    );
  }
}
