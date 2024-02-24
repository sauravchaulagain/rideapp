import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolioapp/app/models/nav_bar_model.dart';
import 'package:portfolioapp/common/constant/assets.dart';
import 'package:portfolioapp/common/theme.dart';
import 'package:portfolioapp/feature/dashboard/favourite/favourite_widget.dart';
import 'package:portfolioapp/feature/dashboard/homeScreen/home_page_widget.dart';
import 'package:portfolioapp/feature/dashboard/navigation_bar.dart';
import 'package:portfolioapp/feature/dashboard/offer/offer_widget.dart';
import 'package:portfolioapp/feature/dashboard/profile/profile_widget.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final offerNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavModel> items = [];
  @override
  void initState() {
    super.initState();
    items = [
      NavModel(
        page: HomePageWidget(),
        navKey: homeNavKey,
      ),
      NavModel(
        page: const FavouriteWidget(),
        navKey: searchNavKey,
      ),
      NavModel(
        page: const OfferWidget(),
        navKey: offerNavKey,
      ),
      NavModel(
        page: const ProfileWidget(),
        navKey: profileNavKey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        backgroundColor: CustomTheme.lightColor,
        body: SafeArea(
          child: IndexedStack(
            index: selectedTab,
            children: items
                .map((page) => Navigator(
                      key: page.navKey,
                      onGenerateInitialRoutes: (navigator, initialRoute) {
                        return [
                          MaterialPageRoute(builder: (context) => page.page)
                        ];
                      },
                    ))
                .toList(),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(top: 10),
          height: 64,
          width: 64,
          child: FloatingActionButton(
            backgroundColor: CustomTheme.appColor,
            elevation: 0,
            onPressed: () => debugPrint("Add Button pressed"),
            child: SvgPicture.asset(
              Assets.walletIcon,
              color: CustomTheme.lightColor,
            ),
          ),
        ),
        bottomNavigationBar: NavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              items[index]
                  .navKey
                  .currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          },
        ),
      ),
    );
  }
}
