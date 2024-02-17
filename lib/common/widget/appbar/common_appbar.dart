import 'package:flutter/material.dart';
import 'package:portfolioapp/app/text_style.dart';
import 'package:portfolioapp/common/constant/assets.dart';
import 'package:portfolioapp/common/theme.dart';

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
                : Text(
                    title,
                    style: PoppinsTextStyles.headlineMediumRegular,
                  ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: CustomTheme.backgroundColor,
            automaticallyImplyLeading: showBackButton,
            actionsIconTheme: IconThemeData(
              color: CustomTheme.darkColor,
            ));
}
