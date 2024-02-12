import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/core/constants/measurements.dart';

class MainScaffold extends StatelessWidget {
  final Widget upperBody;
  final Widget lowerBody;
  final bool enableUpperBodyPadding;
  final bool enableLowerBodyPadding;
  const MainScaffold({
    super.key,
    required this.upperBody,
    required this.lowerBody,
    this.enableUpperBodyPadding = true,
    this.enableLowerBodyPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            // A container that is a box on all sides except the bottom, which is an arc (not a circle).
            child: ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                padding: EdgeInsets.only(
                  left: enableUpperBodyPadding ? Measurements.pageHorizontalPadding : 0,
                  right: enableUpperBodyPadding ? Measurements.pageHorizontalPadding : 0,
                  top: enableUpperBodyPadding ? Measurements.pageVerticalPadding : 0,
                ),
                color: AppColors.darkerBackground,
                child: upperBody,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.only(
                left: enableLowerBodyPadding ? Measurements.pageHorizontalPadding : 0,
                right: enableLowerBodyPadding ? Measurements.pageHorizontalPadding : 0,
                top: enableLowerBodyPadding ? Measurements.pageVerticalPadding : 0,
              ),
              child: lowerBody,
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path(); // Start from (0,0), which is the top-left corner
    path.lineTo(0, size.height - 25); // Line to the bottom left corner
    path.quadraticBezierTo(size.width / 2, size.height + 25, size.width, size.height - 25); // Draw the arc, now we are at the bottom-right corner
    path.lineTo(size.width, 0); // Draw the right edge
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(MyCustomClipper oldClipper) => true;
}
