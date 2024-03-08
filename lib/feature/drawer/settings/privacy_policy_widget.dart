import 'package:flutter/material.dart';
import 'package:ridesharing/app/text_style.dart';
import 'package:ridesharing/common/widget/common_container.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
        appBarTitle: "Privacy Policy",
        body: Column(
          children: [
            Text(
              "At Rideshare, accessible from rideshare.com, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by rideshare and how we use it. \nIf you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in rideshare. This policy is not applicable to any information collected offline or via channels other than this website. Our Privacy Policy was created with the help of the Free Privacy Policy Generator.",
              style: PoppinsTextStyles.bodyMediumRegular,
              textAlign: TextAlign.justify,
            )
          ],
        ));
  }
}
