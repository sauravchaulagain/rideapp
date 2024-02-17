import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:portfolioapp/common/constant/assets.dart';
import 'package:portfolioapp/common/widget/common_popup_box.dart';
import 'package:portfolioapp/common/widget/page_wrapper.dart';
import 'package:portfolioapp/feature/auth/welcomeScreen/screen/welcome_page.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      padding: EdgeInsets.zero,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.mapImage),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.srcATop)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerWidget(
              title: "Enable your location",
              description:
                  "Choose your location to start find the request around you",
              disableButtonName: "Skip for now",
              onDisablePressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomePage(),
                    ));
              },
              onEnablePressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomePage(),
                    ));
              },
              enableButtonName: "Enable",
              imageUrl: Assets.locationImage,
            ),
          ],
        ),
      ),
    );
  }
}
