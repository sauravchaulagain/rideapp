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

import 'package:flutter/material.dart';
import 'package:portfolioapp/app/text_style.dart';
import 'package:portfolioapp/common/constant/assets.dart';
import 'package:portfolioapp/common/utils/size_utils.dart';
import 'package:portfolioapp/common/widget/common_image.dart';
import 'package:portfolioapp/common/widget/custom_button.dart';

class ContainerWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String enableButtonName;
  final String disableButtonName;
  final VoidCallback? onEnablePressed;
  final VoidCallback? onDisablePressed;

  ContainerWidget({
    this.imageUrl = Assets.locationImage,
    this.title = "Title",
    this.description = "Desc",
    this.enableButtonName = "Enable",
    this.disableButtonName = "Cancel",
    this.onEnablePressed,
    this.onDisablePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CommonImage(
            imageUrl: imageUrl,
            height: 100.hp,
          ),
          SizedBox(height: 40.hp),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: PoppinsTextStyles.titleMediumRegular,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.hp),
                Text(
                  description,
                  style: PoppinsTextStyles.subheadSmallRegular,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.hp),
          CustomRoundedButtom(
            onPressed: onEnablePressed,
            title: enableButtonName,
          ),
          CustomRoundedButtom(
            color: Colors.transparent,
            onPressed: onDisablePressed,
            title: disableButtonName,
            textColor: Colors.black26,
          ),
        ],
      ),
    );
  }
}
