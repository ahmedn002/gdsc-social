import 'package:flutter/material.dart';
import 'package:gdsc_social/features/home/view/ui/utils/parsed_body.dart';

import '../../utils/post body/body_component.dart';

class PostCardBodySection extends StatelessWidget {
  final ParsedBody body;
  const PostCardBodySection({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        children: [
          for (final BodyComponent component in body.components) component.getDisplaySpan(context),
        ],
      ),
    );
  }
}
