import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  const ReusableTextField({
    Key? key,
    required this.title,
    this.controller,
    this.hintText,
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
    this.borderColor = Colors.white, // Default border color to white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: titleColor ?? Colors.black,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
              borderRadius: borderRadius ??
                  defaultBorderDecoration?.borderRadius ??
                  BorderRadius.circular(12),
              border: Border.all(color: borderColor ?? Colors.white)),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              fillColor: fillColor ??
                  Colors.grey[200], // Use provided fill color or default
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(
                color: hintTextColor ?? Colors.grey[400],
                fontSize: 14,
              ),
              errorText:
                  validator != null && validator!(controller!.text) != null
                      ? validator!(controller!.text)
                      : null,
              border: OutlineInputBorder(
                  borderRadius: borderRadius ??
                      defaultBorderDecoration?.borderRadius ??
                      BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              suffixIcon: suffixIcon,
            ),
            initialValue: initialValue,
            keyboardType: keyboardType,
            obscureText: obscureText,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
