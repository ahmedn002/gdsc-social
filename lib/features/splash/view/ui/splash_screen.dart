import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdsc_social/core/constants/assets.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';
import 'package:gdsc_social/core/routes/route_manager.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(3.seconds, () {
      if (mounted) {
        setState(() {
          _isLoaded = true;
        });
      }
    });

    Future.delayed(4.seconds, () {
      context.go(Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkerBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetData.logoSvg,
              width: 150,
            )
                .animate(
                  onComplete: (controller) {},
                )
                .then(
                  delay: 1.seconds,
                )
                .scale(
                  curve: Curves.easeOutExpo,
                  duration: 1.seconds,
                )
                .fadeIn(
                  curve: Curves.easeOutExpo,
                  duration: 1.seconds,
                )
                .slideY(
                  curve: Curves.easeOutExpo,
                  begin: -1,
                  end: 0,
                  duration: 1.seconds,
                ),
            16.vs,
            SizedBox(
              width: 200,
              child: AnimatedTextKit(
                isRepeatingAnimation: !_isLoaded,
                repeatForever: !_isLoaded,
                pause: 350.ms,
                animatedTexts: [
                  TyperAnimatedText(
                    'Social',
                    textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 55,
                          color: AppColors.tertiaryText,
                        ),
                    speed: const Duration(milliseconds: 100),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
                  .animate()
                  .then(
                    delay: 2.seconds,
                  )
                  .fadeIn(),
            ),
          ],
        ),
      ),
    );
  }
}
