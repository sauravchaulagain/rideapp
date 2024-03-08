import 'package:flutter/material.dart';
import 'package:ridesharing/app/text_style.dart';
import 'package:ridesharing/common/constant/assets.dart';
import 'package:ridesharing/common/utils/size_utils.dart';
import 'package:ridesharing/common/widget/common_image.dart';
import 'package:ridesharing/common/widget/custom_button.dart';

showCommonPopUpDialog({
  required BuildContext context,
  required String message,
  required String title,
  Function()? onDisablePressed,
  required Function() onEnablePressed,
  required String imageUrl,
  String disableButtonName = "",
  required String enableButtonName,
  String? buttonText,
}) {
  showGeneralDialog(
    barrierColor: Colors.black.withOpacity(0.5),
    transitionBuilder: (context, a1, a2, widget) {
      return Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: PopUpDialogWidget(
            description: message,
            title: title,
            disableButtonName: disableButtonName,
            enableButtonName: enableButtonName,
            onDisablePressed: onDisablePressed,
            onEnablePressed: onEnablePressed,
            imageUrl: imageUrl,
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
    barrierDismissible: false,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, anim11, anim2) {
      return Container();
    },
  );
}

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

class PopUpDialogWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String enableButtonName;
  final String disableButtonName;
  final VoidCallback? onEnablePressed;
  final VoidCallback? onDisablePressed;

  const PopUpDialogWidget({
    super.key,
    this.imageUrl = Assets.locationImage,
    this.title = "",
    this.description = "",
    this.enableButtonName = "",
    this.disableButtonName = "",
    this.onEnablePressed,
    this.onDisablePressed,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 30.hp,
            horizontal: 15.hp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
              if (enableButtonName.isNotEmpty)
                CustomRoundedButtom(
                  onPressed: () {
                    Navigator.pop(context);
                    onEnablePressed!.call();
                  },
                  title: enableButtonName,
                ),
              if (disableButtonName.isNotEmpty)
                CustomRoundedButtom(
                  color: Colors.transparent,
                  onPressed: () {
                    Navigator.pop(context);
                    onDisablePressed!.call();
                  },
                  title: disableButtonName,
                  textColor: Colors.black26,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
