import 'package:flutter/material.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/measurements.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        4.vs,
        Expanded(
          child: SizedBox(
            width: Measurements.threadLineThickness,
            child: Container(
              width: Measurements.threadLineThickness,
              decoration: BoxDecoration(
                color: AppColors.elevation,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        4.vs,
        const CircleAvatar(
          radius: Measurements.threadLineCircleRadius,
          backgroundColor: AppColors.elevation,
        )
      ],
    );
  }
}
