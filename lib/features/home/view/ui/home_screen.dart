import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/measurements.dart';
import 'package:gdsc_social/features/home/view/ui/components/posts_section_bloc_builder.dart';
import 'package:gdsc_social/features/home/view/ui/components/stories_section_bloc_builder.dart';
import 'package:gdsc_social/features/widgets/screen/app_bar.dart';
import 'package:gdsc_social/features/widgets/screen/main_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
      enableUpperBodyPadding: false,
      upperBody: Padding(
        padding: EdgeInsets.only(
          top: Measurements.pageVerticalPadding,
        ),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(
              right: Measurements.pageHorizontalPadding,
              left: Measurements.pageHorizontalPadding,
            ),
            child: MainAppBar(),
          ),
          SizedBox(height: 20),
          Expanded(child: StoriesSectionBlocBuilder()),
          SizedBox(height: 35),
        ]),
      ),
      lowerBody: PostsSectionBlocBuilder(),
    );
  }
}
