import 'package:flutter/material.dart';
import 'package:ridesharing/app/text_style.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/common/utils/size_utils.dart';
import 'package:ridesharing/common/widget/common_container.dart';
import 'package:ridesharing/common/widget/common_dropdown_box.dart';
import 'package:ridesharing/common/widget/custom_button.dart';
import 'package:ridesharing/common/widget/custom_text_field.dart';
import 'package:ridesharing/feature/auth/login/login_page.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      appBarTitle: "Profile",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 18),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: CustomTheme.secondaryColor),
            height: 130.hp,
          ),
          Text(
            "Nate Samson",
            style: PoppinsTextStyles.titleMediumRegular
                .copyWith(fontWeight: FontWeight.w500),
          ),
          ReusableTextField(
            controller: emailController..text = "nate@email.con",
            hintText: "Email",
          ),
          ReusableTextField(
            controller: phoneNumberController..text = "9803435443",
            hintText: "Mobile Number",
          ),
          ReusableTextField(
            suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
            controller: genderController..text = genderList.first,
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
                dataItems: genderList,
              );
            },
          ),
          ReusableTextField(
            hintText: "Address",
          ),
          CustomRoundedButtom(
            title: "Logout",
            color: Colors.transparent,
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginWidget(),
                  ));
            },
            textColor: CustomTheme.appColor,
            borderColor: CustomTheme.appColor,
          ),
        ],
      ),
    );
  }

  final genderList = ["Male", "Female", "Other"];
}
