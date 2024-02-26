import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social/core/extensions/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/constants/colors.dart';
import 'body_component.dart';

class LinkComponent extends BodyComponent {
  LinkComponent({required super.rawText});

  @override
  String get displayText {
    // We want to return the name of the domain;
    // e.g. "https://www.google.com" -> "google.com link"
    final RegExp regExp = RegExp(r'^(?:https?://)?(?:[^@\n]+@)?(?:www\.)?([^:/\n?]+)');
    final String? domain = regExp.firstMatch(rawText)?.group(1);
    return domain != null ? '$domain link' : rawText;
  }

  @override
  InlineSpan getDisplaySpan(BuildContext context) {
    return TextSpan(
      text: displayText,
      style: context.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w900,
        color: AppColors.accent,
        decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()..onTap = () => _launchUrl(rawText),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
