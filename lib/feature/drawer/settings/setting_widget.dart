import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolioapp/common/constant/assets.dart';
import 'package:portfolioapp/common/widget/common_container.dart';
import 'package:portfolioapp/common/widget/common_list_tile.dart';
import 'package:portfolioapp/feature/drawer/settings/change_password_widget.dart';

class SettingWidget extends StatelessWidget {
  SettingWidget({super.key});
  final List<SettingItem> items = [
    SettingItem(
        title: "Change Password",
        onTap: (BuildContext context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangePasswordWidget(),
              ));
        }),
    SettingItem(
        title: "Privacy Policy",
        onTap: (BuildContext context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingWidget(),
              ));
        }),
    SettingItem(
        title: "Contact Us",
        onTap: (BuildContext context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingWidget(),
              ));
        }),
    SettingItem(
        title: "Delete Account",
        onTap: (BuildContext context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingWidget(),
              ));
        }),
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