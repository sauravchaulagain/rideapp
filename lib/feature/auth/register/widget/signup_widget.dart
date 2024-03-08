import 'package:flutter/material.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/common/utils/size_utils.dart';
import 'package:ridesharing/common/utils/snackbar_utils.dart';
import 'package:ridesharing/common/widget/common_container.dart';
import 'package:ridesharing/common/widget/common_dropdown_box.dart';
import 'package:ridesharing/common/widget/custom_button.dart';
import 'package:ridesharing/common/widget/custom_text_field.dart';
import 'package:ridesharing/common/widget/form_validator.dart';
import 'package:ridesharing/feature/auth/login/login_page.dart';

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
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      appBarTitle: "Sign Up",
      title: "Sign up with your email or phone number",
      body: Form(
        key: _fromKey,
        child: Column(
          children: [
            ReusableTextField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: nameController,
              hintText: "Name",
              validator: (value) =>
                  FormValidator.validateFieldNotEmpty(value, "Name"),
            ),
            ReusableTextField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: emailController,
              hintText: "Email",
              validator: (value) => FormValidator.validateEmail(value),
            ),
            ReusableTextField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: phoneNumberController,
              hintText: "Phone Number",
              validator: (value) => FormValidator.validatePhoneNumber(value),
            ),
            ReusableTextField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
              controller: genderController,
              hintText: "Gender",
              validator: (value) =>
                  FormValidator.validateFieldNotEmpty(value, "Gender"),
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
            CustomRoundedButtom(
                title: "Sign Up",
                onPressed: () {
                  if (_fromKey.currentState!.validate()) {
                    SnackBarUtils.showErrorBar(
                        context: context,
                        message: "This feature is still in progress.");
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginWidget(),
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
      ),
    );
  }

  final gederList = ["Male", "Female", "Other"];
}
