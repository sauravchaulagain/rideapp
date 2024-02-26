import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolioapp/app/text_style.dart';
import 'package:portfolioapp/common/constant/assets.dart';
import 'package:portfolioapp/common/utils/size_utils.dart';
import 'package:portfolioapp/feature/drawer/aboutUs/about_us_widget.dart';
import 'package:portfolioapp/feature/drawer/complain/complain_widget.dart';
import 'package:portfolioapp/feature/drawer/helpSupport/help_support_widget.dart';
import 'package:portfolioapp/feature/drawer/history/history_widget.dart';
import 'package:portfolioapp/feature/drawer/referral/referral_widget.dart';

import '../common/theme.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: SizeUtils.width / 1.5,
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(80), bottomRight: Radius.circular(80)),
          borderSide: BorderSide(color: Colors.transparent)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          Container(
            margin: const EdgeInsets.only(left: 12),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.profileImage),
                    fit: BoxFit.contain),
                shape: BoxShape.circle,
                color: CustomTheme.secondaryColor),
            width: 80.wp,
            height: 80.hp,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Nate Samson",
              style: PoppinsTextStyles.titleMediumRegular
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: drawerItems.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => screens[index],
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CustomTheme.darkColor.withOpacity(0.2),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      drawerItemIcons[index],
                      height: 25.hp,
                    ),
                    SizedBox(width: 10.wp),
                    Text(
                      drawerItems[index],
                      style: PoppinsTextStyles.labelMediumRegular
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  final List drawerItems = [
    "History",
    "Complain",
    "Referral",
    "About Us",
    "Settings",
    "Help & Suport",
    "Logout"
  ];
  final List drawerItemIcons = [
    Assets.historyIcon,
    Assets.complainIcon,
    Assets.referralIcon,
    Assets.aboutUsIcon,
    Assets.settingsIcon,
    Assets.helpAndSupportIcon,
    Assets.logoutIcon,
  ];
  final List screens = [
    const HistoryWidget(),
    const ComplainWidget(),
    ReferralWidget(),
    const AboutUsWidget(),
    const HelpSupportWidget(),
  ];
}
