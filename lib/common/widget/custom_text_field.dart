import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolioapp/app/text_style.dart';

class ReusableTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final String? hintText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final String? errorText;
  final Color? titleColor;
  final Color? hintTextColor;
  final BorderRadius? borderRadius;
  final OutlineInputBorder? defaultBorderDecoration;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final Color? borderColor;
  final VoidCallback? onTap;
  final bool readOnly;

  const ReusableTextField({
    Key? key,
    this.title = "",
    this.controller,
    required this.hintText,
    this.initialValue,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.inputFormatters,
    this.suffixIcon,
    this.errorText,
    this.titleColor,
    this.hintTextColor,
    this.borderRadius,
    this.defaultBorderDecoration,
    this.validator,
    this.fillColor,
    this.borderColor = Colors.white,
    this.onTap,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title.isNotEmpty)
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: titleColor ?? Colors.black,
                ),
              ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: borderRadius ??
                    defaultBorderDecoration?.borderRadius ??
                    BorderRadius.circular(12),
                border: Border.all(color: borderColor ?? Colors.white),
              ),
              child: TextFormField(
                style: PoppinsTextStyles.bodyMediumRegular,
                readOnly: readOnly,
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: hintTextColor ?? Colors.grey[400],
                    fontSize: 16,
                  ),
                  errorText:
                      validator != null && validator!(controller!.text) != null
                          ? validator!(controller!.text)
                          : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  suffixIcon: suffixIcon,
                ),
                initialValue: initialValue,
                keyboardType: keyboardType,
                obscureText: obscureText,
                onChanged: onChanged,
                inputFormatters: inputFormatters,
                validator: validator,
                onTap: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
