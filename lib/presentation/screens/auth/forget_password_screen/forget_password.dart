import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/bottom_text_verify.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text__form_failed_defulte.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/auth/otp_verification_screen/otp_verification.dart';

class ForgetPassword extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerColorWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: [
                  SizedboxHeight(h: 70),
                  SvgPicture.asset(AppIcons.forgetPassword),
                  SizedboxHeight(h: 30),

                  TextDefulte(
                    data: 'Forget Password',
                    fontWeight: FontWeight.w700,
                    size: 20,
                    color: AppColor.blue,
                  ),

                  SizedboxHeight(h: 10),
                  TextDefulte(
                    data: 'Please enter the email',
                    size: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 15),
                  Row(
                    children: [
                      TextDefulte(
                        data: 'Email Address',
                        size: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                    ],
                  ),
                  SizedboxHeight(h: 10),
                  TextFormFailedDefulte(
                    hintText: 'esteban_schiller@gmail.com',
                    controller: emailController,
                    isPassword: false,
                  ),
                  SizedboxHeight(h: 15),
                  Row(
                    children: [
                      TextDefulte(
                        data: 'Did it not arrive?',
                        size: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: TextDefulte(
                          data: 'Please send it again.',
                          size: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColor.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedboxHeight(h: 15),

                  BottomTextVerify(
                    data: 'Verify',
                    size: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primaryWhite,

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  OTPVerification(email: emailController.text),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
