import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/models/reset_password_request.dart';
import 'package:power_pro_app/core/network/api/api_service.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/bottom_text_verify.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text__form_failed_defulte.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/auth/login_scareen/login_screen.dart';
import 'package:power_pro_app/service_locator.dart';

class ResetPassword extends StatefulWidget {
  final String email;
  final String otp;

  const ResetPassword({super.key, required this.email, required this.otp});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  final ApiService _apiService = getIt<ApiService>();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword() async {
    if (_newPasswordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_newPasswordController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 8 characters'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final resetPasswordRequest = ResetPasswordRequest(
        email: widget.email,
        otp: widget.otp,
        newPassword: _newPasswordController.text,
      );
      print(widget.otp);
      print(widget.email);

      await _apiService.resetPassword(resetPasswordRequest);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password reset successfully'),
            backgroundColor: Colors.green,
          ),
        );
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
            content: Text('Error: ${e.toString()}'),
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                          controller: _newPasswordController,
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
                          controller: _confirmPasswordController,
                          hintText: '********',
                          isPassword: true,
                          sizeHint: 20,
                        ),
                        SizedboxHeight(h: 20),
                        BottomTextVerify(
                          data: _isLoading ? 'Resetting...' : 'Reset Password',
                          size: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColor.primaryWhite,
                          onPressed: () {
                            if (!_isLoading) {
                              _resetPassword();
                            }
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
      ),
    );
  }
}
