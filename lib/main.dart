import 'package:flutter/material.dart';
import 'package:portfolioapp/common/theme.dart';
import 'package:portfolioapp/feature/dashboard/dashboard_widget.dart';

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
        home: const DashboardWidget());
  }
}
