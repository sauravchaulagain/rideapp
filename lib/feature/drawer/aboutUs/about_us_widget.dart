import 'package:flutter/material.dart';
import 'package:ridesharing/app/text_style.dart';
import 'package:ridesharing/common/widget/common_container.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
        appBarTitle: "About Us",
        body: Column(
          children: [
            Text(
              "Professional Rideshare Platform. Here we will provide you only interesting content, which you will like very much. We're dedicated to providing you the best of Rideshare, with a focus on dependability and Earning. We're working to turn our passion for Rideshare into a booming online website. We hope you enjoy our Rideshare as much as we enjoy offering them to you. I will keep posting more important posts on my Website for all of you. Please give your support and love.Professional Rideshare Platform. Here we will provide you only interesting content, which you will like very much. We're dedicated to providing you the best of Rideshare, with a focus on dependability and Earning. We're working to turn our passion for Rideshare into a booming online website. We hope you enjoy our Rideshare as much as we enjoy offering them to you. I will keep posting more important posts on my Website for all of you. Please give your support and love.",
              style: PoppinsTextStyles.bodyMediumRegular,
              textAlign: TextAlign.justify,
            )
          ],
        ));
  }
}
