import 'package:flutter/material.dart';
import 'package:ridesharing/app/text_style.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/common/utils/size_utils.dart';

showPopUpMenuWithItems({
  required BuildContext context,
  required String title,
  required Function(String) onItemPressed,
  required List<String> dataItems,
}) {
  showGeneralDialog(
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
              CommonDropDownBox(
                title: title,
                dataItems: dataItems,
                onItemPressed: onItemPressed,
              ),
            ],
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
    barrierDismissible: true,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return Container();
    },
  );
}

class CommonDropDownBox extends StatelessWidget {
  final String title;
  final List<String> dataItems;
  final Function(String)? onItemPressed;

  const CommonDropDownBox({
    super.key,
    this.title = "Title",
    required this.dataItems,
    this.onItemPressed,
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
            children: [
              Text(
                title,
                style: PoppinsTextStyles.titleMediumRegular,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: dataItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      dataItems[index],
                      style: const TextStyle(color: CustomTheme.darkColor),
                    ),
                    onTap: () {
                      if (onItemPressed != null) {
                        onItemPressed!(dataItems[
                            index]); // Pass the selected item to the callback
                      }
                      Navigator.of(context)
                          .pop(); // Close the dialog after item is pressed
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
