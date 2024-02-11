import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/core/utils/general.dart';
import 'package:gdsc_social/features/home/presentation/view/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: AppColors.background,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: GeneralUtils.createMaterialColor(AppColors.accent),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
