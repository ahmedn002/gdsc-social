import 'package:flutter/material.dart';
import 'package:gdsc_social/core/extensions/text_styles.dart';

abstract class BodyComponent {
  final String rawText;
  const BodyComponent({required this.rawText});

  String get displayText => rawText;

  InlineSpan getDisplaySpan(BuildContext context) {
    return TextSpan(
      text: displayText,
      style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
    );
  }
}
