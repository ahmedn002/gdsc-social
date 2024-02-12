import 'package:flutter/cupertino.dart';

class ParsedBody {
  final List<BodyComponent> components;

  const ParsedBody({required this.components});
}

abstract class BodyComponent {
  final String rawText;
  const BodyComponent(this.rawText);

  String getDisplayText();
  InlineSpan getDisplaySpan(BuildContext context) {
    return TextSpan(text: getDisplayText());
  }
}

class TextComponent extends BodyComponent {
  const TextComponent({required String rawText}) : super(rawText);

  @override
  String getDisplayText() => rawText;
}

class LinkComponent extends BodyComponent {
  LinkComponent({required String rawText}) : super(rawText);

  @override
  String getDisplayText() {
    // We want to return the name of the domain;
    // e.g. "https://www.google.com" -> "Google Link"
    final RegExp regExp = RegExp(r'^(?:https?:\/\/)?(?:[^@\n]+@)?(?:www\.)?([^:\/\n?]+)');
    final domain = regExp.firstMatch(rawText)?.group(1);
    return domain ?? rawText;
  }

  @override
  InlineSpan getDisplaySpan(BuildContext context) {
    return TextSpan(
      text: getDisplayText(),
      style: TextStyle(
        color: CupertinoColors.link,
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class HashtagComponent extends BodyComponent {
  HashtagComponent({required String rawText}) : super(rawText);

  @override
  String getDisplayText() => rawText;
}

class MentionComponent extends BodyComponent {
  MentionComponent({required String rawText}) : super(rawText);

  @override
  String getDisplayText() => rawText;
}
