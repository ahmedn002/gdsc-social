import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/colors.dart';

class MainIconButton extends StatelessWidget {
  final Widget icon;
  final void Function() onPressed;
  const MainIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: AppColors.darkerAccent,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: icon,
          ),
        ),
      ),
    );
  }
}
