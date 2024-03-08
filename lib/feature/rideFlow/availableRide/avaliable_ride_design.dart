import 'package:flutter/material.dart';
import 'package:ridesharing/app/text_style.dart';
import 'package:ridesharing/common/constant/assets.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/common/utils/size_utils.dart';
import 'package:ridesharing/common/widget/common_popup_box.dart';
import 'package:ridesharing/common/widget/custom_button.dart';
import 'package:ridesharing/feature/dashboard/dashboard_widget.dart';

class AvailableRideBoxDesign extends StatelessWidget {
  const AvailableRideBoxDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: CustomTheme.appColor),
          color: CustomTheme.appColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "BMW Cabrio",
                  style: PoppinsTextStyles.subheadLargeRegular.copyWith(
                      color: CustomTheme.darkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Automatic   |   3 seats   |   Octane",
                  style: PoppinsTextStyles.bodySmallRegular
                      .copyWith(color: CustomTheme.darkColor.withOpacity(0.5)),
                ),
                Text(
                  "800m (5mins away)",
                  style: PoppinsTextStyles.labelMediumRegular.copyWith(
                    color: CustomTheme.darkColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ]),
              Expanded(
                child: Image.asset(
                  Assets.bmwCario,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.hp),
          CustomRoundedButtom(
              color: Colors.transparent,
              borderColor: CustomTheme.appColor,
              title: "Book",
              textColor: CustomTheme.appColor,
              onPressed: () {
                showCommonPopUpDialog(
                    imageUrl: Assets.successAlertImage,
                    title: "Booking Success",
                    context: context,
                    enableButtonName: "Done",
                    onEnablePressed: () {
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardWidget(),
                        ),
                        (route) => false,
                      );
                    },
                    message:
                        "Thank you for your time. Please wait for call form our rider.");
              })
        ],
      ),
    );
  }
}
