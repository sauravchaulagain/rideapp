import 'package:flutter/material.dart';
import 'package:ridesharing/app/text_style.dart';
import 'package:ridesharing/common/widget/common_container.dart';

class HelpSupportWidget extends StatelessWidget {
  const HelpSupportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
        title: "Help And Support",
        appBarTitle: "Help and Support",
        body: Column(
          children: [
            Text(
              "Lorem ipsum dolor sit amet consectetur. Sit pulvinar mauris mauris eu nibh semper nisl pretium laoreet. Sed non faucibus ac lectus eu arcu. Nulla sit congue facilisis vestibulum egestas nisl feugiat pharetra. Odio sit tortor morbi at orci ipsum dapibus interdum. Lorem felis est aliquet arcu nullam pellentesque. Et habitasse ac arcu et nunc euismod rhoncus facilisis sollicitudin.",
              style: PoppinsTextStyles.bodyMediumRegular,
              textAlign: TextAlign.justify,
            )
          ],
        ));
  }
}
