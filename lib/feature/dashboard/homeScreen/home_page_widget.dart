import 'package:flutter/material.dart';
import 'package:ridesharing/app/app_drawer.dart';
import 'package:ridesharing/common/constant/assets.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/common/widget/common_dialogue_box.dart';
import 'package:ridesharing/common/widget/custom_button.dart';
import 'package:ridesharing/common/widget/custom_text_field.dart';
import 'package:ridesharing/common/widget/page_wrapper.dart';
import 'package:ridesharing/feature/dashboard/homeScreen/widget/home_page_topbar.dart';
import 'package:ridesharing/feature/rideFlow/selectTransport/select_transport_widget.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  bool isTransport = true;
  // bool isDrawerOpen = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      padding: EdgeInsets.zero,
      body: SafeArea(
        child: Scaffold(
          drawer: CustomDrawer(),
          backgroundColor: Colors.transparent,
          key: _scaffoldKey,
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(top: 18),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.mapImage), fit: BoxFit.cover),
              ),
              child: Column(children: [
                HomePageTopBar(
                  onTap: () {
                    if (_scaffoldKey.currentState!.isDrawerOpen == false) {
                      _scaffoldKey.currentState!.openDrawer();
                    } else {
                      _scaffoldKey.currentState!.openEndDrawer();
                    }
                  },
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: CustomTheme.appColor),
                            color: CustomTheme.appColor.withOpacity(0.3)),
                        child: Column(children: [
                          CustomRoundedButtom(
                            icon: Icons.search_sharp,
                            iconColor: CustomTheme.darkColor,
                            title: "Where would you go?",
                            onPressed: () {
                              showPopUpDialog(
                                  barrierDismissible: false,
                                  buttonName: "Proceed",
                                  buttonCallback: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SelectTransportWidget(),
                                        ));
                                  },
                                  context: context,
                                  title: "Select Address",
                                  body: Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      ReusableTextField(hintText: "Form"),
                                      ReusableTextField(hintText: "To"),
                                    ],
                                  ));
                            },
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
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
