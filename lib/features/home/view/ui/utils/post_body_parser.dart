import 'package:collection/collection.dart';
import 'package:gdsc_social/core/extensions/insert_between_each_element.dart';
import 'package:gdsc_social/features/home/view/ui/utils/parsed_body.dart';
import 'package:gdsc_social/features/home/view/ui/utils/post%20body/body_component.dart';
import 'package:gdsc_social/features/home/view/ui/utils/post%20body/hashtag_component.dart';
import 'package:gdsc_social/features/home/view/ui/utils/post%20body/link_component.dart';
import 'package:gdsc_social/features/home/view/ui/utils/post%20body/mention_component.dart';
import 'package:gdsc_social/features/home/view/ui/utils/post%20body/text_component.dart';

class PostBodyParser {
  final String body;

  const PostBodyParser(this.body);

  ParsedBody parse() {
    // The text body may contain a combination of 4 things:
    // 1. Normal text "Lorem ipsum"
    // 2. Links "https://www.google.com"
    // 3. Hashtags "#flutter"
    // 4. Mentions "@flutter"

    // We need to preserve whitespace and new lines, so we can't just split by spaces.

    // Step 1: Tokenize the body by splitting it by lines (\n) and subsequently by spaces.
    final List<List<String>> tokenLines = _tokenize(body);

    // Step 2: Parse the lines to get a list of the overall components.
    final List<BodyComponent> components = _parseLines(tokenLines);

    // Step 3: Since we parsed each line separately, and each line was split by spaces
    // We have a lot of TextComponents that are separated by space TextComponents, so we merge them.
    final List<BodyComponent> finalComponents = _mergeTextComponents(components);

    return ParsedBody(components: finalComponents);
  }

  List<List<String>> _tokenize(String body) {
    final List<String> lines = body.split('\n');
    return [
      for (String line in lines) line.split(' '),
    ];
  }

  Iterable<BodyComponent> _parseLine(List<String> tokens) {
    final List<BodyComponent> lineComponents = _parseTokens(tokens);
    // Return parsed tokens with a white space TextComponent between each token
    return lineComponents.insertBetweenEachElement(const TextComponent(rawText: ' '));
  }

  List<BodyComponent> _parseLines(List<List<String>> tokenLines) {
    final List<Iterable<BodyComponent>> components = []; // Outer list to be able to add (Iterables immutable)
    for (List<String> tokenLine in tokenLines) {
      components.add(_parseLine(tokenLine));
    }
    final Iterable<Iterable<BodyComponent>> newLineSeparatedComponents = components.insertBetweenEachElement([const TextComponent(rawText: '\n')]);
    return newLineSeparatedComponents.flattened.toList();
  }

  List<BodyComponent> _parseTokens(List<String> tokens) {
    final RegExp linkRegExp = RegExp(r'https?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*(),]|%[0-9a-fA-F][0-9a-fA-F])+');
    final RegExp hashtagRegExp = RegExp(r'^#\w+');
    final RegExp mentionRegExp = RegExp(r'^@\w+');

    return tokens.map((token) {
      if (linkRegExp.hasMatch(token)) {
        return LinkComponent(rawText: token);
      } else if (hashtagRegExp.hasMatch(token)) {
        return HashtagComponent(rawText: token);
      } else if (mentionRegExp.hasMatch(token)) {
        return MentionComponent(rawText: token);
      } else {
        return TextComponent(rawText: token);
      }
    }).toList();
  }

  static List<BodyComponent> _mergeTextComponents(List<BodyComponent> components) {
    final List<BodyComponent> mergedComponents = [];
    for (int i = 0; i < components.length; i++) {
      if (!(components[i] is TextComponent && i + 1 < components.length && components[i + 1] is TextComponent)) {
        // Slight optimization to avoid creating a new list if we don't need to merge.
        mergedComponents.add(components[i]);
        continue;
      }
      final List<String> textTokens = [components[i].rawText, components[i + 1].rawText];
      for (int j = i + 2; j < components.length; j++) {
        if (components[j] is TextComponent) {
          textTokens.add(components[j].rawText);
        } else {
          break;
        }
      }
      mergedComponents.add(TextComponent(rawText: textTokens.join('')));
      i += textTokens.length - 1;
    }
    return mergedComponents;
  }
}
