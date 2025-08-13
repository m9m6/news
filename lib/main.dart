import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/ui/home/home_screen.dart';
import 'package:news/utils/app_routes.dart';
import 'package:news/utils/app_themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName:(context)=>HomeScreen(),
      },

      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
