import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/bottom_text_verify.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text__form_failed_defulte.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/auth/login_scareen/login_screen.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerColorWidget(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedboxHeight(h: 70),
                  SvgPicture.asset(AppIcons.resetPassword),
                  SizedboxHeight(h: 30),
                  TextDefulte(
                    data: 'Reset Password',
                    size: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColor.blue,
                  ),
                  SizedboxHeight(h: 10),
                  TextDefulte(
                    data: 'Please enter your passwords',
                    size: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextDefulte(
                        data: 'New Password',
                        size: 16,
                        fontWeight: FontWeight.w300,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 10),
                      TextFormFailedDefulte(
                        hintText: '********',
                        isPassword: true,
                        sizeHint: 20,
                      ),
                      SizedboxHeight(h: 10),
                      TextDefulte(
                        data: ' Confirm new Password',
                        size: 16,
                        fontWeight: FontWeight.w300,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 10),
                      TextFormFailedDefulte(
                        hintText: '********',
                        isPassword: true,
                        sizeHint: 20,
                      ),
                      SizedboxHeight(h: 20),
                      BottomTextVerify(
                        data: 'Reset Password',
                        size: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.primaryWhite,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => LoginScreen()),
                          );
                        },
                      ),
                    ],
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
