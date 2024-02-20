import 'package:flutter/material.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/features/widgets/actions/main_icon_button.dart';

class UserStoryCircle extends StatelessWidget {
  const UserStoryCircle({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme styles = Theme.of(context).textTheme;
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 80,
        maxWidth: 80,
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                const Positioned.fill(
                  child: CircleAvatar(
                    backgroundColor: AppColors.elevation,
                    backgroundImage: NetworkImage('https://avatar.iran.liara.run/public/boy?username=Ahmed'),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.darkerBackground,
                      shape: BoxShape.circle,
                    ),
                    child: MainIconButton(
                      icon: const Icon(Icons.add_rounded, size: 20),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Your Story',
            style: styles.labelSmall,
          ),
        ],
      ),
    );
  }
}
