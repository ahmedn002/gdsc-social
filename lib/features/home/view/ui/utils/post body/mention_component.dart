import 'package:flutter/material.dart';
import 'package:gdsc_social/core/extensions/text_styles.dart';

import '../../../../../../core/constants/colors.dart';
import 'body_component.dart';

class MentionComponent extends BodyComponent {
  MentionComponent({required super.rawText});

  @override
  InlineSpan getDisplaySpan(BuildContext context) {
    return TextSpan(
      text: displayText,
      style: context.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w900,
        color: AppColors.green,
      ),
    );
  }
}
