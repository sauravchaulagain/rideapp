import 'package:flutter/material.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/common/utils/size_utils.dart';
import 'package:ridesharing/common/widget/common_container.dart';
import 'package:ridesharing/common/widget/common_list_tile.dart';
import 'package:ridesharing/common/widget/custom_button.dart';

class OfferWidget extends StatefulWidget {
  const OfferWidget({super.key});

  @override
  State<OfferWidget> createState() => _OfferWidgetState();
}

class _OfferWidgetState extends State<OfferWidget> {
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      appBarTitle: "Offer",
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 15,
        itemBuilder: (context, index) => CustomListTile(
          backgroundColor: CustomTheme.lightColor,
          onTap: () {},
          title: "15% off",
          titleFontWeight: FontWeight.w600,
          titleColor: CustomTheme.googleColor,
          subtitle: "Black Friday",
          trailing: SizedBox(
            width: 120.wp,
            child: CustomRoundedButtom(
              onPressed: () {},
              title: "Collect",
              fontSize: 13,
              padding: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }
}
