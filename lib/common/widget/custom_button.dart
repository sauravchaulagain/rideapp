import 'package:flutter/material.dart';
import 'package:ridesharing/common/theme.dart';

class CustomRoundedButtom extends StatefulWidget {
  const CustomRoundedButtom({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isDisabled = false,
    this.isLoading = false,
    this.padding,
    this.color,
    this.horizontalPadding = 12,
    this.verticalPadding = 16,
    this.fontSize = 16,
    this.textColor = Colors.white,
    this.borderColor = Colors.white,
    this.fontWeight = FontWeight.w700,
    this.horizontalMargin = 0,
    this.icon,
    this.iconColor,
    this.verticalMargin = 12,
  }) : super(key: key);
  final String title;
  final Function()? onPressed;
  final bool isDisabled;
  final bool isLoading;
  final Color? color;
  final EdgeInsets? padding;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final Color? textColor;
  final FontWeight fontWeight;
  final double horizontalMargin;
  final double verticalMargin;

  final IconData? icon;
  final Color? iconColor;
  final Color? borderColor;

  @override
  CustomRoundedButtomState createState() => CustomRoundedButtomState();
}

class CustomRoundedButtomState extends State<CustomRoundedButtom> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalMargin, vertical: widget.verticalMargin),
      child: Material(
        color: widget.isDisabled
            ? CustomTheme.lightGray
            : (widget.color ?? CustomTheme.primaryColor),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: widget.isDisabled ? null : widget.onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: widget.padding ??
                EdgeInsets.symmetric(
                  vertical: widget.verticalPadding,
                  horizontal: widget.horizontalPadding,
                ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: widget.isDisabled
                  ? null
                  : Border.all(
                      color: widget.borderColor ?? CustomTheme.primaryColor,
                    ),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: theme.textTheme.displaySmall!.copyWith(
                      fontWeight: widget.fontWeight,
                      color: widget.isDisabled
                          ? CustomTheme.gray
                          : widget.textColor,
                      fontSize: widget.fontSize,
                    ),
                  ),
                  if (widget.icon != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        widget.icon,
                        color: widget.iconColor ?? Colors.white,
                        size: 22,
                      ),
                    ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeOut,
                    child: widget.isLoading
                        ? Container(
                            height: 14,
                            width: 14,
                            margin: const EdgeInsets.only(left: 8),
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
