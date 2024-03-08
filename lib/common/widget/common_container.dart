import 'package:flutter/material.dart';
import 'package:ridesharing/app/text_style.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/common/utils/size_utils.dart';
import 'package:ridesharing/common/widget/custom_button.dart';
import 'package:ridesharing/common/widget/page_wrapper.dart';

class CommonContainer extends StatelessWidget {
  final Widget body;
  final String title;
  final String buttonName;
  final String detail;
  final bool showBackBotton;
  final double verticalPadding;
  final double horizontalPadding;
  final EdgeInsets? padding;
  final String appBarTitle;
  final Function()? onButtonPressed;
  const CommonContainer({
    super.key,
    this.verticalPadding = 20.0,
    this.horizontalPadding = 20.0,
    this.showBackBotton = true,
    this.buttonName = "",
    required this.body,
    this.onButtonPressed,
    this.title = "",
    this.detail = "",
    this.appBarTitle = "",
    this.padding,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final height = SizeUtils.height;

    return PageWrapper(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: CustomTheme.symmetricHozPadding,
          ),
      appbarTitle: appBarTitle,
      showAppBar: appBarTitle.isNotEmpty ? true : false,
      showBackButton: showBackBotton,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.hp),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (title.isNotEmpty)
                            Text(title,
                                style: PoppinsTextStyles.titleMediumRegular),
                          if (detail.isNotEmpty)
                            Text(
                              detail,
                              style: textTheme.titleLarge,
                            )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                body,
                SizedBox(height: height * 0.03),
                if (buttonName.isNotEmpty)
                  CustomRoundedButtom(
                      title: buttonName, onPressed: onButtonPressed)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
