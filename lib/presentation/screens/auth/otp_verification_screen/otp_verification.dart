import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/bottom_text_verify.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text__form_failed_defulte.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/auth/otp_verification_screen/widget/resend_count_down.dart';
import 'package:power_pro_app/presentation/screens/auth/reset_password/reset_password.dart';

class OTPVerification extends StatelessWidget {
  final String email;

  OTPVerification({super.key, required this.email});

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
                  SvgPicture.asset(AppIcons.otpVerification),
                  SizedboxHeight(h: 30),
                  TextDefulte(
                    data: 'OTP Verification',
                    size: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColor.blue,
                  ),
                  SizedboxHeight(h: 10),
                  Row(
                    children: [
                      TextDefulte(
                        data: 'Please enter the code that was sent to your',
                        size: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextDefulte(
                        data: 'email: $email',
                        size: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: TextDefulte(
                          data: 'Change',
                          size: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColor.blue,
                        ),
                      ),
                    ],
                  ),

                  SizedboxHeight(h: 10),
                  Row(
                    children: [
                      TextDefulte(
                        data: 'OTP Code',
                        size: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                    ],
                  ),
                  SizedboxHeight(h: 10),
                  TextFormFailedDefulte(
                    hintText: 'OTP code',

                    isPassword: false,
                  ),
                  SizedboxHeight(h: 20),
                  Row(
                    children: [
                      TextDefulte(
                        data: 'Resend The Code To',
                        size: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                      Spacer(),
                      ResendCountdown(
                        onResend: () {
                          print('OTP sent again!');
                        },
                      ),
                      SizedboxHeight(h: 15),
                    ],
                  ),
                  SizedboxHeight(h: 20),
                  BottomTextVerify(
                    data: 'Verify',
                    size: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primaryWhite,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ResetPassword()),
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

// class OTPVerification extends StatelessWidget {
//   final TextEditingController otpController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   OTPVerification({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ContainerColorWidget(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   SvgPicture.asset(AppIcons.otpVerification),
//                   SizedboxHeight(h: 30),
//                   TextDefulte(
//                     data: 'OTP Verification',
//                     size: 20,
//                     fontWeight: FontWeight.w700,
//                     color: AppColor.blue,
//                   ),
//                   SizedboxHeight(h: 10),
//                   TextDefulte(
//                     data: 'Please enter the code that was sent to your email.',
//                     size: 16,
//                     fontWeight: FontWeight.w400,
//                     color: AppColor.textColor,
//                   ),
//                   SizedboxHeight(h: 10),
//                   Row(
//                     children: [
//                       TextDefulte(
//                         data: 'OTP Code',
//                         size: 16,
//                         fontWeight: FontWeight.w400,
//                         color: AppColor.textColor,
//                       ),
//                     ],
//                   ),
//                   SizedboxHeight(h: 10),
//                   TextFormFailedDefulte(
//                     hintText: 'OTP code',
//                     controller: otpController,
//                     isPassword: false,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter OTP code';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedboxHeight(h: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextDefulte(
//                         data: 'Resend The Code To',
//                         size: 16,
//                         fontWeight: FontWeight.w400,
//                         color: AppColor.textColor,
//                       ),
//                       SlideCountdownSeparated(
//                         duration: Duration(minutes: 2),
//                         separatorType: SeparatorType.symbol,
//                         slideDirection: SlideDirection.down,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
