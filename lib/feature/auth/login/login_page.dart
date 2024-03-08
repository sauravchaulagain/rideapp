import 'package:flutter/material.dart';
import 'package:portfolioapp/common/theme.dart';
import 'package:portfolioapp/common/utils/size_utils.dart';
import 'package:portfolioapp/common/widget/common_container.dart';
import 'package:portfolioapp/common/widget/custom_button.dart';
import 'package:portfolioapp/common/widget/custom_text_field.dart';
import 'package:portfolioapp/feature/auth/register/screen/signup_page.dart';
import 'package:portfolioapp/feature/dashboard/dashboard_widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LopginWidget();
}

class _LopginWidget extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      appBarTitle: "Sign Up",
      title: "Sign in with your email or phone number",
      body: Column(
        children: [
          ReusableTextField(
            controller: emailController,
            hintText: "Email or Phone Number",
          ),
          ReusableTextField(
            controller: passwordController,
            hintText: "Password",
          ),
          CustomRoundedButtom(
              title: "Sign Up",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardWidget(),
                    ));
              }),
          Stack(
            alignment: Alignment.center,
            children: [
              const Divider(
                thickness: 2,
              ),
              Container(
                color: CustomTheme.lightColor,
                width: 30.wp,
                child: const Text(
                  "or",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          CustomRoundedButtom(
            onPressed: () {},
            title: "Sign up with Gmail",
            color: Colors.transparent,
            textColor: CustomTheme.darkColor.withOpacity(0.6),
            borderColor: CustomTheme.appColor,
          ),
          CustomRoundedButtom(
            onPressed: () {},
            title: "Sign up with Facebook",
            color: Colors.transparent,
            borderColor: CustomTheme.appColor,
            textColor: CustomTheme.darkColor.withOpacity(0.6),
          ),
          CustomRoundedButtom(
            onPressed: () {},
            title: "Sign up with Apple",
            textColor: CustomTheme.darkColor.withOpacity(0.6),
            color: Colors.transparent,
            borderColor: CustomTheme.appColor,
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  ),
                );
              },
              child: RichText(
                text: const TextSpan(
                  text: 'Don’t have an account? ',
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(color: CustomTheme.appColor),
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

  final gederList = ["Male", "Female", "Other"];
}
