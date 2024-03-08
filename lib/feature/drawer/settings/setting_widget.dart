import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ridesharing/common/constant/assets.dart';
import 'package:ridesharing/common/widget/common_container.dart';
import 'package:ridesharing/common/widget/common_list_tile.dart';
import 'package:ridesharing/common/widget/common_popup_box.dart';
import 'package:ridesharing/feature/auth/login/login_page.dart';
import 'package:ridesharing/feature/drawer/settings/change_password_widget.dart';
import 'package:ridesharing/feature/drawer/settings/contact_us_widget.dart';
import 'package:ridesharing/feature/drawer/settings/delete_account_widget.dart';
import 'package:ridesharing/feature/drawer/settings/privacy_policy_widget.dart';

class SettingWidget extends StatelessWidget {
  SettingWidget({super.key});
  final List<SettingItem> items = [
    SettingItem(
        title: "Change Password",
        onTap: (BuildContext context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChangePasswordWidget(),
              ));
        }),
    SettingItem(
        title: "Privacy Policy",
        onTap: (BuildContext context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PrivacyPolicyWidget(),
              ));
        }),
    SettingItem(
        title: "Contact Us",
        onTap: (BuildContext context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactUsWidget(),
              ));
        }),
    SettingItem(
        title: "Delete Account",
        onTap: (BuildContext context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DeleteAccountWidget(),
              ));
        }),
    SettingItem(
        title: "Logout",
        onTap: (BuildContext context) {
          showCommonPopUpDialog(
              context: context,
              message: "Are you sure you want to logout?",
              title: "Alert",
              onEnablePressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginWidget(),
                  ),
                  (route) => false,
                );
              },
              imageUrl: Assets.successAlertImage,
              disableButtonName: "Cancel",
              onDisablePressed: () {
                Navigator.of(context).pop();
              },
              enableButtonName: "Logout");
        })
  ];

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
        appBarTitle: "Settings",
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => CustomListTile(
              trailing: SvgPicture.asset(Assets.rightArrowIcon),
              onTap: () {
                items[index].onTap(context);
              },
              title: items[index].title),
        ));
  }
}

class SettingItem {
  final String title;
  final Function onTap;

  SettingItem({required this.title, required this.onTap});
}
