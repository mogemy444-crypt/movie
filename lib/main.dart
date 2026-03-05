import 'package:flutter/material.dart';
import 'package:movie_project/ui/screens/onboarding/onboarding.dart';
import 'package:movie_project/ui/screens/splash/splash.dart';
import 'package:movie_project/ui/utils/AppTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.mode,
      themeMode: ThemeMode.light,
      routes: {
        Splash.routeName:(_)=>Splash(),
        Onboarding.routeName:(_)=>Onboarding()
      },
      initialRoute:  Onboarding.routeName,
    );
  }
}
