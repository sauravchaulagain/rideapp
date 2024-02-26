import 'package:flutter/material.dart';
import 'package:portfolioapp/common/theme.dart';
import 'package:portfolioapp/feature/onbaording/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: CustomTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: OnBoardingPage());
  }
}
