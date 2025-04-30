import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/bottom_text.dart';
import 'package:power_pro_app/core/widgets/container_box.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/sizedbox_width.dart';
import 'package:power_pro_app/core/widgets/text__form_failed_defulte.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/logic/cubit/login_cubit/login_cubit.dart';
import 'package:power_pro_app/presentation/screens/auth/create_account_scareen/create_account.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> isRemembered = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Login Success")));
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColor.primaryBlack, AppColor.primaryWhite],
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedboxHeight(h: 70),
                    Center(child: SvgPicture.asset(AppIcons.logIn)),
                    SizedboxHeight(h: 30),
                    Center(
                      child: TextDefulte(
                        data: 'Login to Account',
                        fontWeight: FontWeight.w700,
                        size: 20,
                        color: AppColor.blue,
                      ),
                    ),
                    SizedboxHeight(h: 10),
                    TextDefulte(
                      data: 'Please enter your email and password to continue',
                      fontWeight: FontWeight.w400,
                      size: 15,
                      color: AppColor.textColor,
                    ),
                    SizedboxHeight(h: 10),
                    TextDefulte(
                      data: ' Email Address',
                      fontWeight: FontWeight.w300,
                      size: 16,
                      color: AppColor.textColor,
                    ),
                    SizedboxHeight(h: 10),
                    GradientTextField(
                      hintText: 'esteban_schiller@gmail.com',
                      controller: emailController,
                      isPassword: false,
                    ),
                    SizedboxHeight(h: 10),
                    TextDefulte(
                      data: ' Password',
                      fontWeight: FontWeight.w300,
                      size: 16,
                      color: AppColor.textColor,
                    ),
                    SizedboxHeight(h: 10),
                    GradientTextField(
                      hintText: '********',
                      controller: passwordController,
                      sizeHint: 20,
                      isPassword: true,
                    ),
                    SizedboxHeight(h: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ValueListenableBuilder<bool>(
                          valueListenable: isRemembered,
                          builder: (context, value, _) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    isRemembered.value = !value;
                                  },
                                  child: ContainerBox(
                                    isChecked: value,
                                    onTap: () {
                                      isRemembered.value = !value;
                                    },
                                  ),
                                ),
                                SizedboxWidth(w: 7),
                                TextDefulte(
                                  data: 'Remember Password',
                                  size: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.textColor,
                                ),
                              ],
                            );
                          },
                        ),
                        TextButton(
                          onPressed: () {},
                          child: TextDefulte(
                            data: 'Forgot Password?',
                            size: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.blue,
                          ),
                        ),
                      ],
                    ),
                    SizedboxHeight(h: 10),
                    BottomText(
                      data: 'Login',
                      size: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColor.primaryWhite,
                      isLoading: state is LoginLoading,
                      onPressed: () {
                        final email = emailController.text;
                        final password = passwordController.text;
                        context.read<LoginCubit>().login(email, password);
                      },
                    ),
                    SizedboxHeight(h: 10),
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
                                builder: (context) => CreateAccountScreen(),
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
        },
      ),
    );
  }
}
