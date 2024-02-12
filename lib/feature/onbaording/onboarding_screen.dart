import 'package:flutter/material.dart';
import 'package:portfolioapp/common/constant/assets.dart';
import 'package:portfolioapp/common/navigation/navigation_service.dart';
import 'package:portfolioapp/common/theme.dart';
import 'package:portfolioapp/app/text_style.dart';
import 'package:portfolioapp/common/utils/size_utils.dart';
import 'package:portfolioapp/common/widget/page_wrapper.dart';
import 'package:portfolioapp/feature/auth/login/login_page.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                child: Text(
                  "Skip",
                  style: PoppinsTextStyles.subheadLargeRegular,
                ),
              ),
            ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildPage(
                    imageAsset: Assets.anywhereYouAreImage,
                    title: "Anywhere you are",
                    description:
                        "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.",
                  ),
                  _buildPage(
                    imageAsset: Assets.atAnytimeImage,
                    title: "At anytime",
                    description:
                        "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.",
                  ),
                  _buildPage(
                    imageAsset: Assets.frame1Image,
                    title: "Book your car",
                    description:
                        "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Add some space
            InkWell(
                onTap: () {
                  if (_currentPage < 2) {
                    _pageController.animateToPage(
                      _currentPage + 1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  }
                },
                child: _buildCircularIndicator()),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(
      {required String imageAsset,
      required String title,
      required String description}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(imageAsset),
        Padding(
          padding: const EdgeInsets.all(56.0),
          child: Column(
            children: [
              Text(
                title,
                style: PoppinsTextStyles.titleMediumRegular
                    .copyWith(color: CustomTheme.darkerBlack),
              ),
              SizedBox(height: 10.hp),
              Text(
                description,
                style: PoppinsTextStyles.subheadSmallRegular,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCircularIndicator() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 50.wp,
        height: 50.hp,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: (_currentPage + 1) / 3,
              strokeWidth: 5.0,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(CustomTheme.appColor),
            ),
            Center(
                child: Icon(
              Icons.arrow_forward,
              size: 30,
              color: CustomTheme.appColor,
            )),
          ],
        ),
      ),
    );
  }
}
