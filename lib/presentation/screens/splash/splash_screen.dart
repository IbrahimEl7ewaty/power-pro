import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/presentation/screens/auth/login_scareen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _navigateToLogin(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // تنفيذ التنقل بعد أول فريم يُرسم
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToLogin(context);
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColor.primaryBlack, AppColor.primaryWhite],
          ),
        ),
        child: Center(
          child: Image.asset(AppImages.splash),
        ),
      ),
    );
  }
}
