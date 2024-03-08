import 'package:flutter/material.dart';
import 'package:ridesharing/app/text_style.dart';
import 'package:ridesharing/common/utils/size_utils.dart';
import 'package:ridesharing/common/widget/custom_button.dart';

showPopUpDialog({
  required BuildContext context,
  required String title,
  required Widget body,
  required VoidCallback buttonCallback,
  required String buttonName,
  bool barrierDismissible = false,
}) {
  showGeneralDialog(
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionBuilder: (context, a1, a2, widget) {
      return Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonDialogueBox(
                body: body,
                title: title,
                onEnablePressed: buttonCallback,
                buttonName: buttonName,
              ),
            ],
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
    barrierLabel: '',
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return Container();
    },
  );
}

class CommonDialogueBox extends StatelessWidget {
  final String title;
  final Widget body;
  final VoidCallback? onEnablePressed;
  final String buttonName;
  const CommonDialogueBox(
      {super.key,
      this.title = "Title",
      required this.body,
      this.onEnablePressed,
      required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 18.hp,
            horizontal: 15.hp,
          ),
          child: Column(
            children: [
              Text(
                title,
                style:
                    PoppinsTextStyles.titleMediumRegular.copyWith(fontSize: 16),
              ),
              body,
              if (buttonName.isNotEmpty)
                CustomRoundedButtom(
                  title: buttonName.toString(),
                  onPressed: () {
                    Navigator.pop(context);
                    onEnablePressed!.call();
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
