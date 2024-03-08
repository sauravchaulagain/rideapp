import 'package:flutter/material.dart';
import 'package:ridesharing/common/constant/assets.dart';
import 'package:ridesharing/feature/auth/welcomeScreen/screen/welcome_page.dart';
import 'package:ridesharing/feature/onbaording/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    getAppStatus();
    super.initState();
  }

  getAppStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final appStatus = prefs.getBool("showOnboarding");
    if (appStatus == true) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnBoardingPage(),
            ));
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomePage(),
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Image.asset(
          Assets.splashImage,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
