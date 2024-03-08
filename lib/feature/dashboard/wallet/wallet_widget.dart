import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ridesharing/app/text_style.dart';
import 'package:ridesharing/common/constant/assets.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/common/utils/size_utils.dart';
import 'package:ridesharing/common/widget/common_container.dart';
import 'package:ridesharing/common/widget/custom_button.dart';
import 'package:ridesharing/feature/dashboard/wallet/add_money_widget.dart';

class WalletWidget extends StatelessWidget {
  const WalletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      appBarTitle: "Wallet",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: SizeUtils.width / 3,
              child: CustomRoundedButtom(
                fontWeight: FontWeight.w500,
                title: "Add Money",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddMoneyWidget(),
                    ),
                  );
                },
                borderColor: CustomTheme.appColor,
                color: Colors.transparent,
                textColor: CustomTheme.appColor,
              ),
            ),
          ),
          SizedBox(height: 10.hp),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: SizeUtils.width / 3,
                  decoration: BoxDecoration(
                    color: CustomTheme.appColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: CustomTheme.appColor),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "\$500",
                        style: PoppinsTextStyles.titleMediumRegular,
                      ),
                      Text(
                        "Available Balance",
                        style: PoppinsTextStyles.subheadSmallRegular
                            .copyWith(color: CustomTheme.darkColor),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 30.wp),
              Expanded(
                child: Container(
                  height: SizeUtils.width / 3,
                  decoration: BoxDecoration(
                    color: CustomTheme.appColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: CustomTheme.appColor),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "\$200",
                        style: PoppinsTextStyles.titleMediumRegular,
                      ),
                      Text(
                        "Total Expend",
                        style: PoppinsTextStyles.subheadSmallRegular
                            .copyWith(color: CustomTheme.darkColor),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.hp),
          Text(
            "Transaction",
            style: PoppinsTextStyles.subheadLargeRegular.copyWith(
              fontWeight: FontWeight.w600,
              color: CustomTheme.darkColor,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 15,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: CustomTheme.appColor.withOpacity(0.5),
                  ),
                ),
                child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index.isEven
                            ? const Color(0xFFFFCDD2)
                            : const Color(0xFFC8E6C9),
                      ),
                      child: SvgPicture.asset(
                        index.isEven ? Assets.upIcon : Assets.downIcon,
                        color: index.isEven
                            ? const Color(0xFFD32F2F)
                            : const Color(0xFF388E3D),
                      ),
                    ),
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welton",
                            style:
                                PoppinsTextStyles.subheadLargeRegular.copyWith(
                              fontWeight: FontWeight.w600,
                              color: CustomTheme.darkColor,
                            ),
                          ),
                          Text(
                            "Today at 09:20 am",
                            style: PoppinsTextStyles.bodyMediumRegular
                                .copyWith(fontSize: 12),
                          )
                        ]),
                    trailing: Text(
                      "${index.isEven ? "" : "-"}\$570.00",
                      style: PoppinsTextStyles.subheadLargeRegular.copyWith(
                        fontWeight: FontWeight.w600,
                        color: CustomTheme.darkColor,
                      ),
                    )),
              );
            },
          ),
        ],
      ),
    );
  }
}
