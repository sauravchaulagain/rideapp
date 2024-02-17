import 'package:flutter/material.dart';
import 'package:portfolioapp/app/text_style.dart';
import 'package:portfolioapp/common/constant/assets.dart';
import 'package:portfolioapp/common/utils/size_utils.dart';
import 'package:portfolioapp/common/widget/common_image.dart';
import 'package:portfolioapp/common/widget/custom_button.dart';

showPopUpMenuWithItems({
  required BuildContext context,
  required String title,
  required Function() onItemPressed,
  required List dataItems,
}) {
  showGeneralDialog(
    barrierColor: Colors.black.withOpacity(0.5),
    transitionBuilder: (context, a1, a2, widget) {
      return Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: CommonDropDownBox(
            title: title,
            dataItems: dataItems,
            onItemPressed: onItemPressed,
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

class CommonDropDownBox extends StatelessWidget {
  final String title;
  final List dataItems;
  final VoidCallback? onItemPressed;

  CommonDropDownBox({
    this.title = "Title",
    required this.dataItems,
    this.onItemPressed,
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
          Text(
            title,
            style: PoppinsTextStyles.titleMediumRegular,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5.hp),
          Expanded(
            child: ListView.builder(
              itemCount: dataItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(dataItems[index]),
                  onTap: onItemPressed,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
