import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';
import 'body_component.dart';

class HashtagComponent extends BodyComponent {
  HashtagComponent({required String rawText}) : super(rawText);

  @override
  String getDisplayText() => rawText;

  @override
  InlineSpan getDisplaySpan(BuildContext context) {
    return TextSpan(
      text: getDisplayText(),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w900,
            color: AppColors.green,
          ),
    );
  }
}
