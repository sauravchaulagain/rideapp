import 'package:flutter/material.dart';
import 'package:portfolioapp/common/theme.dart';
import 'package:portfolioapp/common/utils/size_utils.dart';
import 'package:portfolioapp/common/widget/common_container.dart';
import 'package:portfolioapp/common/widget/common_dropdown_box.dart';
import 'package:portfolioapp/common/widget/custom_button.dart';
import 'package:portfolioapp/common/widget/custom_text_field.dart';
import 'package:portfolioapp/common/widget/otp/otp_verification_screen.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      appBarTitle: "Sign Up",
      title: "Sign up with your email or phone number",
      body: Column(
        children: [
          ReusableTextField(
            controller: nameController,
            hintText: "Name",
          ),
          ReusableTextField(
            controller: emailController,
            hintText: "Email",
          ),
          ReusableTextField(
            controller: phoneNumberController,
            hintText: "Phone Number",
          ),
          ReusableTextField(
            suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
            controller: genderController,
            hintText: "Gender",
            readOnly: true,
            onTap: () {
              showPopUpMenuWithItems(
                context: context,
                title: "Select",
                onItemPressed: (p0) {
                  genderController.text = p0;
                  setState(() {});
                },
                dataItems: gederList,
              );
            },
          ),
          CustomRoundedButtom(title: "Sign Up", onPressed: () {}),
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
                    builder: (context) => OTPWidget(
                      onValueCallback: (p0) {},
                    ),
                  ),
                );
              },
              child: RichText(
                text: const TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign in',
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
