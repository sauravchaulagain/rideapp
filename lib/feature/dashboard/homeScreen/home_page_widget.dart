import 'package:flutter/material.dart';
import 'package:portfolioapp/common/constant/assets.dart';
import 'package:portfolioapp/common/theme.dart';
import 'package:portfolioapp/common/widget/custom_button.dart';
import 'package:portfolioapp/common/widget/page_wrapper.dart';
import 'package:portfolioapp/feature/dashboard/homeScreen/widget/home_page_topbar.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  bool isTransport = true;

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      padding: EdgeInsets.zero,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.mapImage), fit: BoxFit.cover),
        ),
        child: Column(children: [
          const HomePageTopBar(),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: CustomTheme.appColor),
                color: CustomTheme.appColor.withOpacity(0.3)),
            child: Column(children: [
              CustomRoundedButtom(
                icon: Icons.search_sharp,
                iconColor: CustomTheme.darkColor,
                title: "Where would you go?",
                onPressed: () {},
                textColor: CustomTheme.darkColor.withOpacity(0.4),
                color: CustomTheme.lightColor.withOpacity(0.7),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: CustomTheme.lightColor),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomRoundedButtom(
                        verticalMargin: 0,
                        textColor: isTransport
                            ? CustomTheme.lightColor
                            : CustomTheme.darkColor,
                        title: "Transport",
                        onPressed: () {
                          setState(() {
                            isTransport = true;
                          });
                        },
                        color: isTransport
                            ? CustomTheme.appColor
                            : CustomTheme.white,
                      ),
                    ),
                    Expanded(
                      child: CustomRoundedButtom(
                        verticalMargin: 0,
                        textColor: !isTransport
                            ? CustomTheme.lightColor
                            : CustomTheme.darkColor,
                        title: "Delivery",
                        onPressed: () {
                          setState(() {
                            isTransport = false;
                          });
                        },
                        color: !isTransport
                            ? CustomTheme.appColor
                            : CustomTheme.white,
                      ),
                    ),
                  ],
                ),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
