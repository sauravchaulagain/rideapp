import 'package:flutter/material.dart';
import 'package:portfolioapp/common/constant/assets.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    String title = "",
    bool showBackButton = false,
    Function? onBackButtonPressed,
    double height = kToolbarHeight,
    String assetPath = "",
  }) : super(
          title: title.isEmpty
              ? Image.asset(
                  assetPath,
                  height: height,
                )
              : Text(title),
          centerTitle: true,
          automaticallyImplyLeading: showBackButton,
        );
}
