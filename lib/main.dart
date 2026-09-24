import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/features/article/views/article.dart';
import 'package:news/features/home/view/home_screen.dart';
import 'package:news/features/onboarding/view/splash_screen.dart';

void main() {
  runApp(const KhabarApp());
}

class KhabarApp extends StatelessWidget {
  const KhabarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khabar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Schibsted Grotesk',
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
      ),
      home:  SplashScreen(),
    );
  }
}
