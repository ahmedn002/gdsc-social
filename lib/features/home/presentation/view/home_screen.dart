import 'package:flutter/material.dart';
import 'package:gdsc_social/features/widgets/screen/app_bar.dart';
import 'package:gdsc_social/features/widgets/screen/main_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
      upperBody: Column(children: [
        MainAppBar(),
      ]),
      lowerBody: Placeholder(),
    );
  }
}
