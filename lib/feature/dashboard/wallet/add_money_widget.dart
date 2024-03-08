import 'package:flutter/material.dart';
import 'package:ridesharing/app/text_style.dart';
import 'package:ridesharing/common/constant/assets.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/common/utils/size_utils.dart';
import 'package:ridesharing/common/widget/common_container.dart';
import 'package:ridesharing/common/widget/common_list_tile.dart';
import 'package:ridesharing/common/widget/common_popup_box.dart';
import 'package:ridesharing/common/widget/custom_text_field.dart';
import 'package:ridesharing/common/widget/form_validator.dart';
import 'package:ridesharing/feature/dashboard/dashboard_widget.dart';

class AddMoneyWidget extends StatefulWidget {
  const AddMoneyWidget({super.key});

  @override
  State<AddMoneyWidget> createState() => _AddMoneyWidgetState();
}

class _AddMoneyWidgetState extends State<AddMoneyWidget> {
  final _amountController = TextEditingController();

  int _currentIndex = 0;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: CommonContainer(
          appBarTitle: "Add Money",
          buttonName: "Confirm",
          onButtonPressed: () {
            if (_formKey.currentState!.validate()) {
              showCommonPopUpDialog(
                  imageUrl: Assets.successAlertImage,
                  context: context,
                  title: "\$${_amountController.text} Add Success",
                  message: "Your money has been add successfully",
                  enableButtonName: "Done",
                  onEnablePressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardWidget(),
                      ),
                      (route) => false,
                    );
                  });
            }
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _amountController,
                hintText: "Enter Amount",
                textInputType: TextInputType.number,
                validator: (value) => FormValidator.validateAmount(
                    val: value.toString(), minAmount: 10, maxAmount: 5000),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Select Payment Method",
                  style: PoppinsTextStyles.subheadLargeRegular.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CustomTheme.darkColor,
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: walletDataList.length,
                  itemBuilder: (context, index) => designTitle(
                        index: index,
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ))
            ],
          )),
    );
  }

  List walletDataList = [
    {
      "title": "**** **** **** 8970",
      "image": Assets.visaLogo,
      "subtitle": "Expires: 12/26",
    },
    {
      "title": "**** **** **** 7870",
      "image": Assets.masterCardLogo,
      "subtitle": "Expires: 12/26",
    },
    {
      "title": "mailaddress@mail.com",
      "image": Assets.paypalLogo,
      "subtitle": "Expires: 12/26",
    },
    {
      "image": Assets.cashAppLogo,
      "title": "Cash",
      "subtitle": "Expires: 12/26",
    },
  ];

  Widget designTitle({required int index, required Function() onTap}) {
    return Opacity(
      opacity: _currentIndex == index ? 1 : 0.5,
      child: CustomListTile(
        onTap: onTap,
        leading: Image.asset(
          walletDataList[index]["image"],
          height: 30.hp,
        ),
        title: walletDataList[index]["title"],
        subtitle: walletDataList[index]["subtitle"],
      ),
    );
  }
}
