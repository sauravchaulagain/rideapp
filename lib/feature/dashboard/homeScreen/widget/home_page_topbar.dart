import 'package:flutter/material.dart';
import 'package:portfolioapp/common/theme.dart';
import 'package:portfolioapp/feature/notification/notification_widget.dart';

class HomePageTopBar extends StatelessWidget {
  const HomePageTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: CustomTheme.appColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(4)),
              child: const Icon(
                Icons.menu,
                color: CustomTheme.darkColor,
              )),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationWidget(),
                  ));
            },
            child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: CustomTheme.lightColor,
                    borderRadius: BorderRadius.circular(4)),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: CustomTheme.darkColor,
                )),
          ),
        ],
      ),
    );
  }
}
