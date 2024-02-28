import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdsc_social/core/constants/assets.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/core/constants/measurements.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';
import 'package:gdsc_social/features/skeleton/view/ui/widgets/side_bar_item.dart';
import 'package:gdsc_social/features/skeleton/view/ui/widgets/user_profile.dart';
import 'package:gdsc_social/features/widgets/misc/logo.dart';

class SideBar extends StatelessWidget {
  final bool shrink;
  const SideBar({super.key, this.shrink = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.darkerBackground,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Measurements.pageHorizontalPadding / 2,
          vertical: Measurements.pageVerticalPadding,
        ),
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              width: 2,
              color: AppColors.elevation,
            ),
          ),
        ),
        child: Column(
          children: [
            UserProfile(shrink: shrink),
            Divider(
              color: AppColors.elevation,
              thickness: 2,
              height: Measurements.pageVerticalPadding * 2,
            ),
            SideBarItem(
              label: 'Home',
              icon: SvgPicture.asset(AssetData.homeSvg),
              isSelected: true,
              onTap: () {},
              shrink: shrink,
            ),
            10.vs,
            SideBarItem(
              label: 'Explore',
              icon: SvgPicture.asset(AssetData.searchSvg),
              onTap: () {},
              shrink: shrink,
            ),
            10.vs,
            SideBarItem(
              label: 'Notifications',
              icon: SvgPicture.asset(AssetData.notificationsSvg),
              onTap: () {},
              shrink: shrink,
            ),
            10.vs,
            SideBarItem(
              label: 'Messages',
              icon: SvgPicture.asset(AssetData.chatSvg),
              onTap: () {},
              shrink: shrink,
            ),
            10.vs,
            SideBarItem(
              label: 'Profile',
              icon: SvgPicture.asset(AssetData.profileSvg),
              onTap: () {},
              shrink: shrink,
            ),
            10.vs,
            SideBarItem(
              label: 'Settings',
              icon: SvgPicture.asset(AssetData.settingsSvg),
              onTap: () {},
              shrink: shrink,
            ),
            const Spacer(),
            Logo(shrink: shrink),
          ],
        ),
      ),
    );
  }
}
