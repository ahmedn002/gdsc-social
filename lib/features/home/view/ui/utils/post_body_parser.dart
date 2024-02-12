import 'package:gdsc_social/features/home/view/ui/utils/parsed_body.dart';
import 'package:gdsc_social/features/home/view/ui/utils/post%20body/body_component.dart';
import 'package:gdsc_social/features/home/view/ui/utils/post%20body/hashtag_component.dart';
import 'package:gdsc_social/features/home/view/ui/utils/post%20body/link_component.dart';
import 'package:gdsc_social/features/home/view/ui/utils/post%20body/mention_component.dart';
import 'package:gdsc_social/features/home/view/ui/utils/post%20body/text_component.dart';

class PostBodyParser {
  static ParsedBody parse(String body) {
    // The text body may contain a combination of 4 things:
    // 1. Normal text "Lorem ipsum"
    // 2. Links "https://www.google.com"
    // 3. Hashtags "#flutter"
    // 4. Mentions "@flutter"

    // Check and parse each of these cases and return an object that contains the parsed text and the type of the parsed text.

    // Step 1: Tokenize the body by splitting it by spaces.
    final List<String> tokens = _tokenize(body);

    // Step 2: Create RegExp patterns for links, hashtags, and mentions.
    final List<BodyComponent> components = _parseTokens(tokens);

    // Step 3: Merge consecutive text components.
    final List<BodyComponent> mergedComponents = _mergeTextComponents(components);

    // Step 4: Add spaces between components.
    final List<BodyComponent> componentsWithSpaces = _addSpacesBetweenComponents(mergedComponents);

    // Step 5: Re-merge consecutive text components. (TODO: Optimize this step by single-pass merging.)
    final List<BodyComponent> finalComponents = _mergeTextComponents(componentsWithSpaces);

    return ParsedBody(components: finalComponents);
  }

  static List<String> _tokenize(String body) {
    return body.split(' ');
  }

  static List<BodyComponent> _parseTokens(List<String> tokens) {
    final RegExp linkRegExp = RegExp(r'http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+');
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
      mergedComponents.add(TextComponent(rawText: textTokens.join(' ')));
      i += textTokens.length - 1;
    }
    return mergedComponents;
  }

  static List<BodyComponent> _addSpacesBetweenComponents(List<BodyComponent> components) {
    final List<BodyComponent> componentsWithSpaces = [];
    for (int i = 0; i < components.length; i++) {
      componentsWithSpaces.add(components[i]);
      if (i + 1 < components.length) {
        componentsWithSpaces.add(const TextComponent(rawText: ' '));
      }
    }
    return componentsWithSpaces;
  }
}
