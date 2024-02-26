import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gdsc_social/features/skeleton/view/ui/mobile_skeleton.dart';

import '../tablet_skeleton.dart';

class AdaptiveScreen extends StatelessWidget {
  final WidgetBuilder mobileBuilder;
  final WidgetBuilder tabletBuilder;
  final WidgetBuilder desktopBuilder;

  const AdaptiveScreen({super.key, required this.mobileBuilder, required this.tabletBuilder, required this.desktopBuilder});

  factory AdaptiveScreen.fromUpperAndLowerSection({
    required final Widget upperBody,
    required final Widget lowerBody,
    required final bool enableUpperBodyPadding,
    required final bool enableLowerBodyPadding,
  }) {
    return AdaptiveScreen(
      mobileBuilder: (context) => MobileSkeleton(
        enableUpperBodyPadding: enableUpperBodyPadding,
        enableLowerBodyPadding: enableLowerBodyPadding,
        upperBody: upperBody,
        lowerBody: lowerBody,
      ),
      tabletBuilder: (context) => TabletSkeleton(
        enableUpperBodyPadding: enableUpperBodyPadding,
        enableLowerBodyPadding: enableLowerBodyPadding,
        upperBody: upperBody,
        lowerBody: lowerBody,
      ),
      desktopBuilder: (context) => TabletSkeleton(
        enableUpperBodyPadding: enableUpperBodyPadding,
        enableLowerBodyPadding: enableLowerBodyPadding,
        upperBody: upperBody,
        lowerBody: lowerBody,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileBuilder(context);
        } else if (constraints.maxWidth < 900) {
          return tabletBuilder(context);
        } else {
          return desktopBuilder(context);
        }
      },
    );
  }
}
