import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ridesharing/common/constant/fonts.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/common/utils/size_utils.dart';

class ReusableTextField extends FormField<String> {
  ReusableTextField({
    Key? key,
    this.controller,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmited,
    String hintText = "",
    bool showSurfixIcon = false,
    bool readOnly = false,
    TextFieldType type = TextFieldType.Outline,
    String title = "",
    bool required = false,
    EdgeInsets? margin,
    TextInputType textInputType = TextInputType.text,
    Widget? suffixIcon,
    VoidCallback? onSuffixPressed,
    int? maxLength,
    bool customHintTextStyle = false,
    double bottomMargin = 18,
    double horizontalMargin = 0,
    // double horizontalMargin = CustomTheme.symmetricHozPadding,
    AutovalidateMode? autovalidateMode,
    bool? enabled,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    String? restorationId,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    VoidCallback? onSurffixImagePress,
    Widget? prefix,
    int maxLine = 1,
    double borderRadius = 12,
    Widget? trailingTitle,
    bool obscureText = false,
    List<TextInputFormatter>? inputFormatters,
    TextInputAction? textInputAction,
  }) : super(
          key: key,
          autovalidateMode: autovalidateMode,
          enabled: enabled ?? true,
          initialValue: controller?.text ?? "",
          onSaved: onSaved,
          restorationId: restorationId,
          validator: validator,
          builder: (FormFieldState<String> field) {
            final _CustomTextFieldState state = field as _CustomTextFieldState;
            final InputDecoration effectiveDecoration = InputDecoration(
              counterText: "",
              hintText: hintText,
              prefix: prefix,
              hintStyle: customHintTextStyle
                  ? TextStyle(
                      fontFamily: Fonts.poppin,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: CustomTheme.darkerBlack.withOpacity(0.9),
                    )
                  : const TextStyle(
                      fontFamily: Fonts.poppin,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: CustomTheme.gray,
                    ),
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ).applyDefaults(Theme.of(field.context).inputDecorationTheme);
            void onChangedHandler(String value) {
              field.didChange(value);
              if (onChanged != null) {
                onChanged(value);
              }
            }

            return Container(
              margin: margin ??
                  EdgeInsets.only(
                    bottom: bottomMargin,
                    left: horizontalMargin,
                    right: horizontalMargin,
                  ),
              child: UnmanagedRestorationScope(
                bucket: field.bucket,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              bottom:
                                  (trailingTitle != null || title.isNotEmpty)
                                      ? 10.hp
                                      : 0),
                          child: Row(
                            children: [
                              if (title.isNotEmpty)
                                RichText(
                                  text: TextSpan(
                                    text: title,
                                    style: const TextStyle(
                                      fontFamily: Fonts.poppin,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: CustomTheme.lightTextColor,
                                    ),
                                    children: [
                                      if (required)
                                        const TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                            fontFamily: Fonts.poppin,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: CustomTheme.primaryColor,
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              const Spacer(),
                              if (trailingTitle != null) trailingTitle
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Row(
                            children: [
                              if (leading != null) leading,
                              Expanded(
                                child: Container(
                                  height: 60.hp,
                                  decoration: BoxDecoration(
                                    color: CustomTheme.white,
                                    borderRadius:
                                        BorderRadius.circular(borderRadius),
                                    border: type == TextFieldType.Outline
                                        ? Border.all(
                                            width: 1,
                                            color: CustomTheme.gray,
                                          )
                                        : null,
                                  ),
                                  padding: EdgeInsets.only(
                                    left: CustomTheme.symmetricHozPadding,
                                    right: showSurfixIcon
                                        ? 0
                                        : CustomTheme.symmetricHozPadding,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          obscureText: obscureText,
                                          restorationId: restorationId,
                                          controller:
                                              state._effectiveController,
                                          decoration: effectiveDecoration,
                                          keyboardType: textInputType,
                                          maxLength: maxLength,
                                          onChanged: onChangedHandler,
                                          textInputAction: textInputAction,
                                          // enablepoppinactiveSelection:
                                          //     !readOnly,
                                          readOnly: readOnly,
                                          maxLines: maxLine,
                                          inputFormatters: inputFormatters,
                                          cursorColor: CustomTheme.gray,
                                          onEditingComplete: () {
                                            FocusScope.of(field.context)
                                                .unfocus();
                                            if (onSubmited != null) {
                                              onSubmited(
                                                  controller?.text ?? "");
                                            }
                                          },
                                          onTap: onTap,
                                          style: const TextStyle(
                                            fontFamily: Fonts.poppin,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: CustomTheme.lightTextColor,
                                          ),
                                        ),
                                      ),
                                      if (showSurfixIcon)
                                        InkWell(
                                          onTap: onSuffixPressed,
                                          child: suffixIcon,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              if (trailing != null) trailing,
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (state.hasError)
                      Container(
                        padding: EdgeInsets.only(top: 4.hp),
                        child: Text(
                          state.errorText!,
                          style: const TextStyle(
                            fontFamily: Fonts.poppin,
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.red,
                          ),
                        ),
                      )
                  ],
                ),
              ),
            );
          },
        );

  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  @override
  FormFieldState<String> createState() {
    return _CustomTextFieldState();
  }
}

enum TextFieldType { Outline, Filled }

class _CustomTextFieldState extends FormFieldState<String> {
  RestorableTextEditingController? _controller;

  TextEditingController get _effectiveController =>
      widget.controller ?? _controller!.value;

  @override
  ReusableTextField get widget => super.widget as ReusableTextField;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    super.restoreState(oldBucket, initialRestore);
    if (_controller != null) {
      _registerController();
    }
    // Make sure to update the poppinnal [FormFieldState] value to sync up with
    // text editing controller value.
    setValue(_effectiveController.text);
  }

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController([TextEditingValue? value]) {
    assert(_controller == null);
    _controller = value == null
        ? RestorableTextEditingController()
        : RestorableTextEditingController.fromValue(value);
    if (!restorePending) {
      _registerController();
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _createLocalController(widget.initialValue != null
          ? TextEditingValue(text: widget.initialValue!)
          : null);
    } else {
      widget.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(ReusableTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null) {
        _createLocalController(oldWidget.controller!.value);
      }

      if (widget.controller != null) {
        setValue(widget.controller!.text);
        if (oldWidget.controller == null) {
          unregisterFromRestoration(_controller!);
          _controller!.dispose();
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (_effectiveController.text != value) {
      _effectiveController.text = value ?? '';
    }
  }

  @override
  void reset() {
    // setState will be called in the superclass, so even though state is being
    // manipulated, no setState call is needed here.
    _effectiveController.text = widget.initialValue ?? '';
    super.reset();
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.text != value) {
      didChange(_effectiveController.text);
    }
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:ridesharing/app/text_style.dart';

// class ReusableTextField extends StatelessWidget {
//   final String title;
//   final TextEditingController? controller;
//   final String? hintText;
//   final String? initialValue;
//   final TextInputType? keyboardType;
//   final bool obscureText;
//   final Function(String)? onChanged;
//   final List<TextInputFormatter>? inputFormatters;
//   final Widget? suffixIcon;
//   final String? errorText;
//   final Color? titleColor;
//   final Color? hintTextColor;
//   final BorderRadius? borderRadius;
//   final OutlineInputBorder? defaultBorderDecoration;
//   final FormFieldValidator<String>? validator;
//   final Color? fillColor;
//   final Color? borderColor;
//   final VoidCallback? onTap;
//   final bool readOnly;
//   final AutovalidateMode? autovalidateMode;
//   final int? maxLines; // New property for maximum lines

//   const ReusableTextField({
//     Key? key,
//     this.title = "",
//     this.controller,
//     required this.hintText,
//     this.initialValue,
//     this.keyboardType,
//     this.obscureText = false,
//     this.onChanged,
//     this.inputFormatters,
//     this.suffixIcon,
//     this.errorText,
//     this.titleColor,
//     this.hintTextColor,
//     this.borderRadius,
//     this.defaultBorderDecoration,
//     this.validator,
//     this.fillColor,
//     this.borderColor = Colors.white,
//     this.onTap,
//     this.autovalidateMode,
//     this.readOnly = false,
//     this.maxLines, // Initialize the new property
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: GestureDetector(
//         onTap: onTap,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (title.isNotEmpty)
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                   color: titleColor ?? Colors.black,
//                 ),
//               ),
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 8),
//               decoration: BoxDecoration(
//                 borderRadius: borderRadius ??
//                     defaultBorderDecoration?.borderRadius ??
//                     BorderRadius.circular(12),
//                 border: Border.all(color: borderColor ?? Colors.white),
//               ),
//               child: TextFormField(
//                 autovalidateMode: autovalidateMode,
//                 style: PoppinsTextStyles.bodyMediumRegular,
//                 readOnly: readOnly,
//                 controller: controller,
//                 decoration: InputDecoration(
//                   hintText: hintText,
//                   hintStyle: TextStyle(
//                     color: hintTextColor ?? Colors.grey[400],
//                     fontSize: 16,
//                   ),
//                   errorText:
//                       validator != null && validator!(controller!.text) != null
//                           ? validator!(controller!.text)
//                           : null,
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8)),
//                   suffixIcon: suffixIcon,
//                 ),
//                 initialValue: initialValue,
//                 keyboardType: keyboardType,
//                 obscureText: obscureText,
//                 onChanged: onChanged,
//                 inputFormatters: inputFormatters,
//                 validator: validator,
//                 onTap: onTap,
//                 maxLines: maxLines,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
