import 'package:flutter/material.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/common/utils/size_utils.dart';

class BottomSheetWrapper extends StatelessWidget {
  final bool showCancelButton;
  final EdgeInsets? padding;
  final double? topPadding;
  final Widget child;
  final Color backgroundColor;
  final bool showTopDivider;
  final int titleTopPadding;
  final int titleBottomPadding;
  final String title;
  const BottomSheetWrapper({
    super.key,
    this.padding,
    this.showCancelButton = false,
    this.backgroundColor = CustomTheme.backgroundColor,
    this.topPadding,
    this.showTopDivider = true,
    this.titleTopPadding = 16,
    this.titleBottomPadding = 20,
    required this.child,
    this.title = "",
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      padding: padding ??
          EdgeInsets.only(
            left: CustomTheme.symmetricHozPadding.wp,
            right: CustomTheme.symmetricHozPadding.wp,
            top: topPadding ?? 24.hp,
            bottom: 5.hp,
          ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showTopDivider)
            Container(
              height: 4,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: CustomTheme.gray,
              ),
            ),
          Container(
            padding: EdgeInsets.only(
              top: titleTopPadding.hp,
              bottom: titleBottomPadding.hp,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (showCancelButton)
                  InkWell(
                    onTap: () {
                      Navigator.pop;
                    },
                    child: Row(
                      children: [
                        Text(
                          "Close",
                          style: textTheme.titleSmall!
                              .copyWith(color: CustomTheme.googleColor),
                        ),
                        const Icon(
                          Icons.cancel_outlined,
                          size: 20,
                          color: CustomTheme.googleColor,
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}
