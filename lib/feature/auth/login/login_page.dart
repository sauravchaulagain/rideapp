import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:portfolioapp/common/constant/assets.dart';
import 'package:portfolioapp/common/widget/common_popup_box.dart';
import 'package:portfolioapp/common/widget/page_wrapper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              onDisablePressed: () {},
              onEnablePressed: () {},
              enableButtonName: "Enable",
              imageUrl: Assets.locationImage,
            ),
          ],
        ),
      ),
    );
  }
}
