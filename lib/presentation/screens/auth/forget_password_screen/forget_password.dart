import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/models/forgot_password_request.dart';
import 'package:power_pro_app/core/network/api/api_service.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/bottom_text_verify.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/auth/create_account_scareen/custom_text_form_field.dart';
import 'package:power_pro_app/service_locator.dart';

import '../otp_verification_screen/otp_verification.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  bool _isLoading = false;
  final ApiService _apiService = getIt<ApiService>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> _forgotPassword() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final forgotPasswordRequest = ForgotPasswordRequest(
        email: emailController.text.trim(),
      );

      final response = await _apiService.forgotPassword(forgotPasswordRequest);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              response.message.isNotEmpty
                  ? response.message
                  : 'OTP sent to your email',
            ),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to OTP verification screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                    OTPVerification(email: emailController.text.trim()),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send OTP: ${e.toString()}'),
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
                  const SizedboxHeight(h: 70),
                  SvgPicture.asset(AppIcons.forgetPassword),
                  const SizedboxHeight(h: 30),

                  TextDefulte(
                    data: 'Forget Password',
                    fontWeight: FontWeight.w700,
                    size: 20,
                    color: AppColor.blue,
                  ),

                  const SizedboxHeight(h: 10),
                  TextDefulte(
                    data: 'Please enter the email',
                    size: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                  const SizedboxHeight(h: 15),
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
                  const SizedboxHeight(h: 10),

                  // استبدال TextFormFailedDefulte بـ CustomTextFormField
                  CustomTextFormField(
                    hintText: 'esteban_schiller@gmail.com',
                    controller: emailController,

                    labelText: 'Email Address',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedboxHeight(h: 15),
                  const SizedboxHeight(h: 15),

                  BottomTextVerify(
                    data: _isLoading ? 'Sending...' : 'Verify',
                    size: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primaryWhite,
                    onPressed: _isLoading ? () {} : _forgotPassword,
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
