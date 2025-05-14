import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/bottom_text_verify.dart';
import 'package:power_pro_app/core/widgets/container_box_isChecked.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/sizedbox_width.dart';
import 'package:power_pro_app/core/widgets/text__form_failed_defulte.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/auth/create_account_scareen/create_account.dart';
import 'package:power_pro_app/presentation/screens/auth/forget_password_screen/forget_password.dart';
import 'package:power_pro_app/presentation/screens/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerColorWidget(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedboxHeight(h: 70),
              Center(child: SvgPicture.asset(AppIcons.logIn)),
              const SizedboxHeight(h: 30),
              Center(
                child: TextDefulte(
                  data: 'Login to Account',
                  fontWeight: FontWeight.w700,
                  size: 20,
                  color: AppColor.blue,
                ),
              ),
              const SizedboxHeight(h: 10),
              TextDefulte(
                data: 'Please enter your email and password to continue',
                fontWeight: FontWeight.w400,
                size: 15,
                color: AppColor.textColor,
              ),
              const SizedboxHeight(h: 20),

              // Email field (UI only)
              TextDefulte(
                data: 'Email address',
                fontWeight: FontWeight.w300,
                size: 16,
                color: AppColor.textColor,
              ),
              const SizedboxHeight(h: 10),
              TextFormFailedDefulte(
                hintText: 'esteban_schiller@gmail.com',
                isPassword: false,
              ),
              const SizedboxHeight(h: 10),

              TextDefulte(
                data: 'Password',
                fontWeight: FontWeight.w300,
                size: 16,
                color: AppColor.textColor,
              ),
              const SizedboxHeight(h: 10),
              TextFormFailedDefulte(
                hintText: '********',
                isPassword: true,
                sizeHint: 20,
              ),
              const SizedboxHeight(h: 10),

              // Remember password + forgot link
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // static unchecked box
                      ContainerBoxIsChecked(
                        isChecked: false,
                        onTap: () {}, // no-op
                      ),
                      const SizedboxWidth(w: 8),
                      TextDefulte(
                        data: 'Remember Password',
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ForgetPassword()),
                      );
                    },
                    child: TextDefulte(
                      data: 'Forgot Password?',
                      size: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.blue,
                    ),
                  ),
                ],
              ),
              const SizedboxHeight(h: 20),

              // Login button
              SizedBox(
                width: double.infinity,
                child: BottomTextVerify(
                  onPressed: () {
                    // UI-only
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                  data: 'Login',
                  size: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primaryWhite,
                ),
              ),
              const SizedboxHeight(h: 20),

              // Create account link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextDefulte(
                    data: 'Don’t have an account?',
                    size: 12,
                    fontWeight: FontWeight.w300,
                    color: AppColor.textColor,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CreateAccountScreen(),
                        ),
                      );
                    },
                    child: TextDefulte(
                      data: 'Create Account',
                      size: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColor.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
