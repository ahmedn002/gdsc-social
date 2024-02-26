import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';
import 'package:gdsc_social/core/extensions/text_styles.dart';
import 'package:gdsc_social/core/utils/stub.dart';
import 'package:gdsc_social/features/widgets/misc/custom_circle_avatar.dart';

class UserProfile extends StatelessWidget {
  final bool shrink;
  const UserProfile({super.key, this.shrink = false});

  @override
  Widget build(BuildContext context) {
    if (shrink) {
      return const CustomCircleAvatar(imageUrl: 'https://avatar.iran.liara.run/public/boy?username=Ahmed');
    }
    return Row(
      children: [
        CustomCircleAvatar(imageUrl: StubUtils.getRandomAvatar(id: 1)),
        10.hs,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Name',
                style: context.textTheme.titleSmall,
              ),
              Text(
                'email@gmail.com',
                style: context.textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
