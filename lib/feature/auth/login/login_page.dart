import 'package:flutter/material.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/common/utils/size_utils.dart';
import 'package:ridesharing/common/widget/common_container.dart';
import 'package:ridesharing/common/widget/custom_button.dart';
import 'package:ridesharing/common/widget/custom_text_field.dart';
import 'package:ridesharing/common/widget/form_validator.dart';
import 'package:ridesharing/feature/auth/register/screen/signup_page.dart';
import 'package:ridesharing/feature/dashboard/dashboard_widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LopginWidget();
}

class _LopginWidget extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      appBarTitle: "Sign Up",
      title: "Sign in with your email or phone number",
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            ReusableTextField(
              validator: (value) =>
                  FormValidator.validateFieldNotEmpty(value, "Field"),
              controller: emailController,
              hintText: "Email or Phone Number",
            ),
            ReusableTextField(
              validator: (value) =>
                  FormValidator.validateFieldNotEmpty(value, "Password"),
              controller: passwordController,
              hintText: "Password",
            ),
            CustomRoundedButtom(
                title: "Sign Up",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardWidget(),
                      ),
                      (route) => false,
                    );
                  }
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
      ),
    );
  }

  final gederList = ["Male", "Female", "Other"];
}
