import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ridesharing/common/constant/assets.dart';
import 'package:ridesharing/common/widget/common_container.dart';
import 'package:ridesharing/common/widget/common_popup_box.dart';
import 'package:ridesharing/common/widget/custom_text_field.dart';
import 'package:ridesharing/common/widget/form_validator.dart';
import 'package:ridesharing/feature/auth/login/login_page.dart';

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({super.key});

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  bool showOldPassword = true;

  bool showNewPassword = true;

  bool showConfirmPassword = true;
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
        onButtonPressed: () {
          if (_formKey.currentState!.validate()) {
            showCommonPopUpDialog(
                context: context,
                message: "Password change successful.",
                title: "Success",
                onEnablePressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginWidget(),
                      ),
                      (route) => false);
                },
                imageUrl: Assets.successAlertImage,
                enableButtonName: "Back to Login");
          }
        },
        buttonName: "Save",
        appBarTitle: "Change Password",
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              ReusableTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _oldPasswordController,
                validator: (value) =>
                    FormValidator.validateFieldNotEmpty(value, "Old Password"),
                showSurfixIcon: true,
                onSuffixPressed: () {
                  setState(() {
                    showOldPassword = !showOldPassword;
                  });
                },
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset(
                      showOldPassword ? Assets.eyeIcon : Assets.eyeOffIcon),
                ),
                hintText: "Old Password",
                obscureText: showOldPassword,
              ),
              ReusableTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _newPasswordController,
                validator: (value) =>
                    FormValidator.validateFieldNotEmpty(value, "New Password"),
                showSurfixIcon: true,
                onSuffixPressed: () {
                  setState(() {
                    showNewPassword = !showNewPassword;
                  });
                },
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset(
                      showNewPassword ? Assets.eyeIcon : Assets.eyeOffIcon),
                ),
                hintText: "New Password",
                obscureText: showNewPassword,
              ),
              ReusableTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (_newPasswordController.text !=
                      _confirmPasswordController.text) {
                    return "Password doesnot match";
                  }
                  return null;
                },
                controller: _confirmPasswordController,
                showSurfixIcon: true,
                onSuffixPressed: () {
                  setState(() {
                    showConfirmPassword = !showConfirmPassword;
                  });
                },
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset(
                      showConfirmPassword ? Assets.eyeIcon : Assets.eyeOffIcon),
                ),
                hintText: "Confirm Password",
                obscureText: showConfirmPassword,
              ),
            ],
          ),
        ));
  }
}
