import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolioapp/common/constant/assets.dart';
import 'package:portfolioapp/common/utils/size_utils.dart';
import 'package:portfolioapp/common/widget/common_container.dart';
import 'package:portfolioapp/common/widget/custom_button.dart';
import 'package:portfolioapp/common/widget/custom_text_field.dart';
import 'package:share_plus/share_plus.dart';

class ReferralWidget extends StatelessWidget {
  ReferralWidget({super.key});
  final referralCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
        appBarTitle: "Referral",
        body: Column(
          children: [
            ReusableTextField(
              readOnly: true,
              onTap: () {
                _copyToClipboard(context, referralCodeController.text);
              },
              suffixIcon: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.copyIcon,
                    height: 30.hp,
                  ),
                ],
              ),
              hintText: "Code",
              controller: referralCodeController..text = "RkMFucd",
              title: "Refer a friend and Earn \$20",
            ),
            CustomRoundedButtom(
              title: "Invite",
              onPressed: () async {
                await Share.share(
                  'Unlock exclusive benefits by using my referral code ${referralCodeController.text} on Ride!',
                );
              },
            )
          ],
        ));
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    const snackBar = SnackBar(content: Text('Text copied to clipboard'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
