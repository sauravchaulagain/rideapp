import 'package:flutter/material.dart';
import 'package:ridesharing/app/text_style.dart';
import 'package:ridesharing/common/constant/assets.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/common/utils/size_utils.dart';
import 'package:ridesharing/common/widget/custom_button.dart';
import 'package:ridesharing/common/widget/page_wrapper.dart';
import 'package:ridesharing/feature/auth/login/login_page.dart';
import 'package:ridesharing/feature/auth/register/screen/signup_page.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      padding: const EdgeInsets.all(22),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _buildPage(
                imageAsset: Assets.welcomeScreenImage,
                title: "Welcome",
                description: "Have a better sharing experience",
              ),
            ),
            CustomRoundedButtom(
              title: "Create an account",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    ));
              },
            ),
            CustomRoundedButtom(
              color: Colors.transparent,
              title: "Login",
              textColor: CustomTheme.primaryColor,
              borderColor: CustomTheme.primaryColor,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginWidget(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(
      {required String imageAsset,
      required String title,
      required String description}) {
    return Column(
      children: [
        Image.asset(imageAsset),
        Padding(
          padding: const EdgeInsets.all(56.0),
          child: Column(
            children: [
              Text(
                title,
                style: PoppinsTextStyles.titleMediumRegular
                    .copyWith(color: CustomTheme.darkerBlack),
              ),
              SizedBox(height: 10.hp),
              Text(
                description,
                style: PoppinsTextStyles.subheadSmallRegular,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
