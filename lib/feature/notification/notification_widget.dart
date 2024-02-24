import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolioapp/common/constant/assets.dart';
import 'package:portfolioapp/common/theme.dart';
import 'package:portfolioapp/common/utils/size_utils.dart';
import 'package:portfolioapp/common/widget/common_container.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
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
              color: CustomTheme.white,
            ),
            child: Column(
              children: [
                Row(children: [
                  SvgPicture.asset(Assets.notificationIcon, height: 20.hp),
                  SizedBox(width: 15.wp),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "data.title",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 14),
                        ),
                        Text(
                          "data.date",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ]),
                SizedBox(height: 10.hp),
                Text(
                  "test data",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
