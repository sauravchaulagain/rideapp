import 'package:flutter/material.dart';
import 'package:ridesharing/common/theme.dart';
import 'package:ridesharing/feature/onbaording/splash_screen.dart';

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
        home: const SplashWidget());
  }
}
