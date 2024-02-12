// import 'package:flutter/material.dart';

// import 'common_button.dart';

// showPopUpDialog({
//   required BuildContext context,
//   required String message,
//   required String title,
//   required Function() buttonCallback,
//   bool showCancelButton = true,
//   bool isSuccessPopUp = false,
//   String? buttonText,
// }) {
//   showGeneralDialog(
//     barrierColor: Colors.black.withOpacity(0.5),
//     transitionBuilder: (context, a1, a2, widget) {
//       return Transform.scale(
//         scale: a1.value,
//         child: Opacity(
//           opacity: a1.value,
//           child: PopUpDialogWidget(
//             buttonCallback: buttonCallback,
//             message: message,
//             title: title,
//             showCancelButton: showCancelButton,
//             isSuccessPopUp: isSuccessPopUp,
//             buttonText: buttonText,
//           ),
//         ),
//       );
//     },
//     transitionDuration: const Duration(milliseconds: 300),
//     barrierDismissible: false,
//     barrierLabel: '',
//     context: context,
//     pageBuilder: (context, anim11, anim2) {
//       return Container();
//     },
//   );
// }

// class PopUpDialogWidget extends StatefulWidget {
//   const PopUpDialogWidget({
//     Key? key,
//     required this.message,
//     required this.title,
//     required this.buttonCallback,
//     required this.showCancelButton,
//     required this.isSuccessPopUp,
//     this.buttonText,
//   }) : super(key: key);
//   final String message;
//   final String title;
//   final bool showCancelButton;
//   final bool isSuccessPopUp;
//   final Function() buttonCallback;
//   final String? buttonText;

//   @override
//   State<PopUpDialogWidget> createState() => _LoadingDialogBoxState();
// }

// class _LoadingDialogBoxState extends State<PopUpDialogWidget> {
//   late Image image;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     image.image.evict();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _theme = Theme.of(context);
//     final _textTheme = _theme.textTheme;

//     return WillPopScope(
//       onWillPop: () => Future.value(false),
//       child: Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Container(
//           padding: EdgeInsets.symmetric(
//             vertical: 30,
//             horizontal: 15,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "${widget.title}",
//                 style: _textTheme.titleLarge!.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 14),
//               if (widget.isSuccessPopUp) image,
//               if (widget.isSuccessPopUp) const SizedBox(height: 14),
//               Text(
//                 "${widget.message}",
//                 textAlign: TextAlign.center,
//                 style: _textTheme.titleLarge,
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: Row(
//                   children: [
//                     if (widget.showCancelButton)
//                       Expanded(
//                         child: CustomRoundedButtom(
//                           title: "Cancel",
//                           color: Colors.white,
//                           textColor: _theme.primaryColor,
//                           onPressed: () {
//                             NavigationService.pop();
//                           },
//                         ),
//                       ),
//                     if (widget.showCancelButton)
//                       SizedBox(
//                         width: 10,
//                       ),
//                     Expanded(
//                       child: CustomRoundedButtom(
//                         title: widget.buttonText ?? "",
//                         onPressed: widget.buttonCallback,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
