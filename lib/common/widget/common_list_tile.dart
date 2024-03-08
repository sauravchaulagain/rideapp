import 'package:flutter/material.dart';
import 'package:ridesharing/app/text_style.dart';
import 'package:ridesharing/common/theme.dart';

class CustomListTile extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? iconData;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback onTap;
  final VoidCallback? onLeadingTap;
  final VoidCallback? onTrailingTap;
  final Color? titleColor;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final Color? subtitleColor;
  final double? subtitleFontSize;
  final FontWeight? subtitleFontWeight;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const CustomListTile({
    Key? key,
    this.title,
    this.subtitle,
    this.iconData,
    this.leading,
    this.trailing,
    required this.onTap,
    this.onLeadingTap,
    this.onTrailingTap,
    this.titleColor,
    this.titleFontSize,
    this.titleFontWeight,
    this.subtitleColor,
    this.subtitleFontSize,
    this.subtitleFontWeight,
    this.backgroundColor,
    this.borderColor,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTitleTextStyle = PoppinsTextStyles.subheadLargeRegular
        .copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: CustomTheme.darkColor,
        )
        .merge(TextStyle(
          color: titleColor,
          fontSize: titleFontSize,
          fontWeight: titleFontWeight,
        ));

    final defaultSubtitleTextStyle = PoppinsTextStyles.bodyMediumRegular
        .copyWith(fontSize: 12)
        .merge(TextStyle(
          color: subtitleColor,
          fontSize: subtitleFontSize,
          fontWeight: subtitleFontWeight,
        ));

    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          color: backgroundColor ?? CustomTheme.secondaryColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor ?? CustomTheme.appColor,
          )),
      child: ListTile(
        leading: leading != null
            ? InkWell(
                onTap: onLeadingTap,
                child: leading,
              )
            : null,
        title: title != null
            ? Text(
                title!,
                style: defaultTitleTextStyle,
              )
            : null,
        subtitle: subtitle != null
            ? Text(
                subtitle!,
                style: defaultSubtitleTextStyle,
              )
            : null,
        trailing: trailing != null
            ? InkWell(
                onTap: onTrailingTap,
                child: trailing,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}
