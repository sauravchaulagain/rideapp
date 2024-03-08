import 'package:flutter/material.dart';
import 'package:ridesharing/app/text_style.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/common/utils/size_utils.dart';
import 'package:ridesharing/common/widget/common_container.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      appBarTitle: "Notification",
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: CustomTheme.appColor.withOpacity(0.08),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment confirm",
                  style: PoppinsTextStyles.labelMediumRegular
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10.hp),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae",
                  style: PoppinsTextStyles.captionRegular,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
