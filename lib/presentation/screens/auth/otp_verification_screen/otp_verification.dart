import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/models/register_confirm_request.dart';
import 'package:power_pro_app/core/network/api/api_service.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/bottom_text_verify.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text__form_failed_defulte.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/auth/login_scareen/login_screen.dart';
import 'package:power_pro_app/presentation/screens/auth/otp_verification_screen/widget/resend_count_down.dart';
import 'package:power_pro_app/service_locator.dart';

class OTPVerification extends StatefulWidget {
  final String email;

  const OTPVerification({super.key, required this.email});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final ApiService _apiService = getIt<ApiService>();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  Future<void> _confirmOtp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final registerConfirmRequest = RegisterConfirmRequest(
        email: widget.email,
        otp: otpController.text,
      );

      await _apiService.confirmRegistration(registerConfirmRequest);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration confirmed successfully!'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to login screen
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false,
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to confirm OTP: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerColorWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
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
                        data: 'email: ${widget.email}',
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
                    controller: otpController,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter OTP code';
                    //   }
                    //   // You can add more validation logic here if needed
                    //   return null;
                    // },
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
                    data: _isLoading ? 'Verifying...' : 'Verify',
                    size: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primaryWhite,
                    onPressed: () {
                      if (!_isLoading) {
                        _confirmOtp();
                      }
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
