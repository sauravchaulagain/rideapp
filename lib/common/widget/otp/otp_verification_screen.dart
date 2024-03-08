import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/common/utils/size_utils.dart';
import 'package:ridesharing/common/widget/custom_button.dart';
import 'package:ridesharing/common/widget/page_wrapper.dart';

class OTPWidget extends StatefulWidget {
  const OTPWidget({super.key, required this.onValueCallback});

  final Function(String) onValueCallback;

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  String otpCodeInput = "";
  final TextEditingController _textController = TextEditingController();
  final GlobalKey<FormState> _otpKey = GlobalKey<FormState>();
  final _height = SizeUtils.height;
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      showAppBar: false,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: _height * 0.03),
            Container(
              padding: const EdgeInsets.all(30),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: CustomTheme.backgroundColor,
              ),
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/verify your number.svg",
                    // colorFilter: const ColorFilter.mode(
                    //     Color(0XFF4E4E4E), BlendMode.srcIn),
                    height: _height * 0.05,
                  ),
                  SizedBox(height: _height * 0.02),
                  Text(
                    "Enter your OTP",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: _height * 0.02),
                  Text("Please enter your OTP to proceed.",
                      style: Theme.of(context).textTheme.headlineSmall),
                  SizedBox(height: _height * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 6; i++) // Create 6 OTP boxes
                        const OtpInputBox(),
                    ],
                  ),
                  // Form(
                  //   key: _otpKey,
                  //   child: CustomPinCodeField(
                  //     length: 6,
                  //     fieldHeight: 50,
                  //     fieldWidth: 45,
                  //     controller: _textController,
                  //     validator: (val) {
                  //       if (val == null) {
                  //         return "Please enter OTP.";
                  //       }
                  //       if (val.length < 6) {
                  //         return "Please enter valid OTP.";
                  //       }
                  //       return null;
                  //     },
                  //     onChanged: (val) {
                  //       otpCodeInput = val;
                  //     },
                  //   ),
                  // ),
                  SizedBox(height: _height * 0.03),
                  CustomRoundedButtom(
                      title: "Proceed",
                      onPressed: () {
                        if (_otpKey.currentState!.validate()) {
                          widget.onValueCallback(otpCodeInput);
                        }
                        // Get.to(() => const SetupMpin());
                      }),
                  SizedBox(height: _height * 0.03),
                  TextButton(
                      onPressed: () {
                        Navigator.pop;
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtpInputBox extends StatelessWidget {
  const OtpInputBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: const TextField(
        keyboardType: TextInputType.number,
        maxLength: 1, // Limit input to 1 character
        textAlign: TextAlign.center,
      ),
    );
  }
}
