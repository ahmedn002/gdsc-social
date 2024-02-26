import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/core/extensions/text_styles.dart';

class SideBarItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool shrink;

  const SideBarItem({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    required this.onTap,
    this.shrink = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: shrink ? _buildShrunkChild() : _buildExpandedChild(context),
      ),
    );
  }

  Widget _buildShrunkChild() {
    return CircleAvatar(
      radius: 20,
      backgroundColor: isSelected ? AppColors.darkerAccent : Colors.transparent,
      child: icon,
    );
  }

  Widget _buildExpandedChild(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          icon,
          const SizedBox(width: 16),
          Text(
            label,
            style: context.textTheme.labelMedium?.copyWith(color: AppColors.secondaryText),
          ),
          const Spacer(),
          if (isSelected)
            Container(
              width: 4,
              decoration: const BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
              ),
            ),
        ],
      ),
    );
  }
}
