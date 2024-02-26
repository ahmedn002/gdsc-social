import 'package:flutter/material.dart';

import 'components/body_scroll_view.dart';

class MobileSkeleton extends StatelessWidget {
  final Widget upperBody;
  final Widget lowerBody;
  final bool enableUpperBodyPadding;
  final bool enableLowerBodyPadding;
  const MobileSkeleton({
    super.key,
    required this.upperBody,
    required this.lowerBody,
    this.enableUpperBodyPadding = true,
    this.enableLowerBodyPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyScrollView(
        enableUpperBodyPadding: enableUpperBodyPadding,
        upperBody: upperBody,
        enableLowerBodyPadding: enableLowerBodyPadding,
        lowerBody: lowerBody,
      ),
    );
  }
}
