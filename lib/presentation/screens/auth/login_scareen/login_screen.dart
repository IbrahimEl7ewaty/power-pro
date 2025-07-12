import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_pro_app/core/models/login_request.dart';
import 'package:power_pro_app/core/network/api/api_service.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/bottom_text_verify.dart';
import 'package:power_pro_app/core/widgets/container_box_isChecked.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/sizedbox_width.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/main.dart';
import 'package:power_pro_app/presentation/screens/auth/create_account_scareen/create_account.dart';
import 'package:power_pro_app/presentation/screens/auth/create_account_scareen/custom_text_form_field.dart';
import 'package:power_pro_app/presentation/screens/auth/forget_password_screen/forget_password.dart';
import 'package:power_pro_app/service_locator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isRememberPassword = false;
  bool _isLoading = false;
  final ApiService _apiService = getIt<ApiService>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final loginRequest = LoginRequest(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      await _apiService.login(loginRequest);

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainScreen()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed: ${e.toString()}'),
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
                CustomTextFormField(
                  controller: _emailController,
                  hintText: 'esteban_schiller@gmail.com',
                  labelText: 'Email address',
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
                const SizedboxHeight(h: 10),

                CustomTextFormField(
                  controller: _passwordController,
                  hintText: '********',
                  labelText: 'Password',
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
                const SizedboxHeight(h: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ContainerBoxIsChecked(
                          isChecked: _isRememberPassword,
                          onTap: () {
                            setState(() {
                              _isRememberPassword = !_isRememberPassword;
                            });
                          },
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
                SizedBox(
                  width: double.infinity,
                  child:
                      _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : BottomTextVerify(
                            onPressed: _login,
                            data: 'Login',
                            size: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColor.primaryWhite,
                          ),
                ),
                const SizedboxHeight(h: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextDefulte(
                      data: "Don't have an account?",
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
      ),
    );
  }
}
