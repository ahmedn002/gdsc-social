import 'package:flutter/material.dart';

abstract class BodyComponent {
  final String rawText;
  const BodyComponent(this.rawText);

  String getDisplayText();
  InlineSpan getDisplaySpan(BuildContext context) {
    return TextSpan(
      text: getDisplayText(),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
    );
  }
}
