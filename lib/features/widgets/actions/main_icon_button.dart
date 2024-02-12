import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/colors.dart';

class MainIconButton extends StatelessWidget {
  final Widget icon;
  final void Function() onPressed;
  final bool filled;
  const MainIconButton({super.key, required this.icon, required this.onPressed, this.filled = true});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: filled ? AppColors.darkerAccent : Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          splashColor: filled ? AppColors.elevation : AppColors.darkerAccent,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: icon,
          ),
        ),
      ),
    );
  }
}
