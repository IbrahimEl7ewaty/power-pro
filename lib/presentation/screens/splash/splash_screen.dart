import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/data/repositories/login_repo/login_repo.dart';
import 'package:power_pro_app/data/repositories/login_repo/register_repo/register_repo.dart';
import 'package:power_pro_app/logic/cubit/login_cubit/login_cubit.dart';
import 'package:power_pro_app/presentation/screens/auth/login_scareen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (_) => LoginCubit(LoginRepo()),
                child: LoginScreen(),
              ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColor.primaryBlack, AppColor.primaryWhite],
          ),
        ),
        child: Center(child: Image.asset(AppImages.splash)),
      ),
    );
  }
}
