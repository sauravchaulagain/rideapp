import 'package:flutter/material.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/feature/notification/notification_widget.dart';

class HomePageTopBar extends StatelessWidget {
  final Function() onTap;
  const HomePageTopBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: CustomTheme.appColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4)),
                child: const Icon(
                  Icons.menu,
                  color: CustomTheme.darkColor,
                )),
          ),
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
