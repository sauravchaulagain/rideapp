import 'package:ridesharing/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:ridesharing/common/widget/appbar/common_appbar.dart';

class PageWrapper extends StatefulWidget {
  final String? appbarTitle;
  final Widget body;
  final bool useOwnScaffold;
  final bool showAppBar;
  final PreferredSizeWidget? appBar;
  final String? title;
  final Widget? leadingAppIcon;
  final List<Widget> appActions;
  final EdgeInsets? padding;
  final double appBarLeftPadding;
  final double appBarRightPadding;
  final Widget? floatinActionButton;
  final Widget? bottomNavBar;
  Color? backgroundColor;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final Function()? onBackPressed;
  final bool showBackButton;
  PageWrapper({
    required this.body,
    this.showBackButton = false,
    this.useOwnScaffold = false,
    this.showAppBar = false,
    this.appBar,
    this.appActions = const [],
    this.leadingAppIcon,
    this.title,
    this.padding,
    this.bottomNavBar,
    this.appBarLeftPadding = CustomTheme.symmetricHozPadding,
    this.appBarRightPadding = CustomTheme.symmetricHozPadding,
    this.floatinActionButton,
    this.backgroundColor,
    this.floatingActionButtonLocation =
        FloatingActionButtonLocation.centerDocked,
    this.onBackPressed,
    this.appbarTitle,
  });
  @override
  _PageWrapperState createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  @override
  Widget build(BuildContext context) {
    widget.backgroundColor = CustomTheme.backgroundColor;
    if (widget.useOwnScaffold) {
      return widget.body;
    } else {
      return Scaffold(
        backgroundColor: widget.backgroundColor,
        bottomNavigationBar: widget.bottomNavBar,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        appBar: widget.showAppBar
            ? CustomAppBar(
                showBackButton: widget.showBackButton,
                title: widget.appbarTitle ?? "",
              )
            : null,
        body: Container(
          padding: widget.padding ??
              const EdgeInsets.symmetric(
                horizontal: CustomTheme.symmetricHozPadding,
              ),
          child: widget.body,
        ),
      );
    }
  }
}
