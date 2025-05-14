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
import 'package:power_pro_app/presentation/screens/auth/login_scareen/login_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerColorWidget(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedboxHeight(h: 70),
              Center(child: SvgPicture.asset(AppIcons.signUp)),
              const SizedboxHeight(h: 30),
              Center(
                child: TextDefulte(
                  data: 'Create An Account',
                  fontWeight: FontWeight.w700,
                  size: 20,
                  color: AppColor.blue,
                ),
              ),
              const SizedboxHeight(h: 10),
              Center(
                child: TextDefulte(
                  data: 'Create an account to continue',
                  fontWeight: FontWeight.w400,
                  size: 15,
                  color: AppColor.textColor,
                ),
              ),
              const SizedboxHeight(h: 20),

              TextDefulte(
                data: 'Username',
                fontWeight: FontWeight.w300,
                size: 16,
                color: AppColor.textColor,
              ),
              const SizedboxHeight(h: 10),
              TextFormFailedDefulte(
                hintText: 'esteban_schiller',
                isPassword: false,
              ),
              const SizedboxHeight(h: 10),

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
              const SizedboxHeight(h: 20),

              Row(
                children: [
                  ContainerBoxIsChecked(
                    isChecked: false,
                    onTap: () {}, // لا منطق هنا
                  ),
                  const SizedboxWidth(w: 7),
                  TextDefulte(
                    data: 'I accept terms and conditions',
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                ],
              ),
              const SizedboxHeight(h: 20),

              SizedBox(
                width: double.infinity,
                child: BottomTextVerify(
                  onPressed: () {
                    // UI-only
                  },
                  data: 'Sign Up',
                  size: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primaryWhite,
                ),
              ),
              const SizedboxHeight(h: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextDefulte(
                    data: 'Already have an account?',
                    size: 12,
                    fontWeight: FontWeight.w300,
                    color: AppColor.textColor,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: TextDefulte(
                      data: 'Log In',
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
