import 'body_component.dart';

class TextComponent extends BodyComponent {
  const TextComponent({required String rawText}) : super(rawText);

  @override
  String getDisplayText() => rawText;
}
