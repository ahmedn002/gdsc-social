import 'package:flutter/material.dart';
import 'package:gdsc_social/features/skeleton/view/ui/widgets/tool_bar.dart';
import 'package:gdsc_social/features/widgets/misc/logo.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Logo(),
        Spacer(),
        ToolBar(),
      ],
    );
  }
}
