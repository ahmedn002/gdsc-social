import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/colors.dart';

class StoryQuickReplyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const StoryQuickReplyButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.darkerBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.elevation, width: 2),
      ),
      child: FittedBox(child: Text(text)),
    );
  }
}
