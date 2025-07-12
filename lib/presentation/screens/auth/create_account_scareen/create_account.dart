import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/models/register_request.dart';
import 'package:power_pro_app/core/network/api/api_service.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/bottom_text_verify.dart';
import 'package:power_pro_app/core/widgets/container_box_isChecked.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/sizedbox_width.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/auth/create_account_scareen/custom_text_form_field.dart';
import 'package:power_pro_app/presentation/screens/auth/login_scareen/login_screen.dart';
import 'package:power_pro_app/service_locator.dart';

import '../otp_verification_screen/otp_verification.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isTermsAccepted = false;
  bool _isLoading = false;
  final ApiService _apiService = getIt<ApiService>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!_isTermsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept terms and conditions'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final registerRequest = RegisterRequest(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        role: 'User', // Default role
      );

      final response = await _apiService.register(registerRequest);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (_) => OTPVerification(email: _emailController.text.trim()),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed: ${e.toString()}'),
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
        child: Form(
          key: _formKey,
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

                // استخدام CustomTextFormField
                CustomTextFormField(
                  controller: _firstNameController,
                  labelText: 'First Name',
                  hintText: 'Ibrahim',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  controller: _lastNameController,
                  labelText: 'Last Name',
                  hintText: 'El-Hewaty',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'Email address',
                  hintText: 'power-pro@gmail.com',
                  keyboardType: TextInputType.emailAddress,
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
                CustomTextFormField(
                  controller: _passwordController,
                  labelText: 'Password',
                  hintText: '********',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedboxHeight(h: 20),

                // Terms and conditions checkbox
                Row(
                  children: [
                    ContainerBoxIsChecked(
                      isChecked: _isTermsAccepted,
                      onTap: () {
                        setState(() {
                          _isTermsAccepted = !_isTermsAccepted;
                        });
                      },
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

                // Sign Up button
                SizedBox(
                  width: double.infinity,
                  child: BottomTextVerify(
                    onPressed: () {
                      if (!_isLoading) {
                        _register();
                      }
                    },
                    data: _isLoading ? 'Signing Up...' : 'Sign Up',
                    size: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primaryWhite,
                  ),
                ),
                const SizedboxHeight(h: 10),

                // Login navigation
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
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
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
      ),
    );
  }
}
