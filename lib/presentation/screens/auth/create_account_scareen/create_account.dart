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
import 'package:power_pro_app/data/repositories/login_repo/login_repo.dart';
import 'package:power_pro_app/data/repositories/login_repo/register_repo/register_repo.dart';
import 'package:power_pro_app/logic/cubit/login_cubit/login_cubit.dart';
import 'package:power_pro_app/logic/cubit/register_cubit/register_cubit.dart';
import 'package:power_pro_app/presentation/screens/auth/login_scareen/login_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> isAccepted = ValueNotifier(false);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(AuthRepository()),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Account created successfully')),
            );
            Navigator.pop(context);
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
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
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedboxHeight(h: 70),
                        Center(child: SvgPicture.asset(AppIcons.signUp)),
                        SizedboxHeight(h: 30),
                        Center(
                          child: TextDefulte(
                            data: 'Create An Account ',
                            fontWeight: FontWeight.w700,
                            size: 20,
                            color: AppColor.blue,
                          ),
                        ),
                        SizedboxHeight(h: 10),
                        Center(
                          child: TextDefulte(
                            data: 'Create an account to continue',
                            fontWeight: FontWeight.w400,
                            size: 15,
                            color: AppColor.textColor,
                          ),
                        ),
                        SizedboxHeight(h: 20),
                        TextDefulte(
                          data: 'Username',
                          fontWeight: FontWeight.w300,
                          size: 16,
                          color: AppColor.textColor,
                        ),
                        SizedboxHeight(h: 10),
                        GradientTextField(
                          hintText: 'esteban_schiller',
                          controller: nameController,
                          isPassword: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        SizedboxHeight(h: 10),
                        TextDefulte(
                          data: 'Email address',
                          fontWeight: FontWeight.w300,
                          size: 16,
                          color: AppColor.textColor,
                        ),
                        SizedboxHeight(h: 10),
                        GradientTextField(
                          hintText: 'esteban_schiller@gmail.com',
                          controller: emailController,
                          isPassword: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            final emailRegex = RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            );
                            if (!emailRegex.hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedboxHeight(h: 10),
                        TextDefulte(
                          data: 'Password',
                          fontWeight: FontWeight.w300,
                          size: 16,
                          color: AppColor.textColor,
                        ),
                        SizedboxHeight(h: 10),
                        GradientTextField(
                          hintText: '********',
                          controller: passwordController,
                          isPassword: true,
                          sizeHint: 20,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedboxHeight(h: 20),
                        ValueListenableBuilder<bool>(
                          valueListenable: isAccepted,
                          builder: (context, value, _) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    isAccepted.value = !value;
                                  },
                                  child: ContainerBox(
                                    isChecked: value,
                                    onTap: () {
                                      isAccepted.value = !value;
                                    },
                                  ),
                                ),
                                SizedboxWidth(w: 7),
                                TextDefulte(
                                  data: 'I accept terms and conditions',
                                  size: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.textColor,
                                ),
                              ],
                            );
                          },
                        ),
                        SizedboxHeight(h: 20),
                        BottomText(
                          data: 'Sign up',
                          size: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColor.primaryWhite,
                          isLoading: state is RegisterLoading,
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            if (!isAccepted.value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "You must accept terms and conditions",
                                  ),
                                ),
                              );
                              return;
                            }

                            final username = nameController.text.trim();
                            final email = emailController.text.trim();
                            final password = passwordController.text;

                            context.read<RegisterCubit>().register(
                              username: username,
                              email: email,
                              password: password,
                            );
                          },
                        ),
                        SizedboxHeight(h: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextDefulte(
                              data: "Already have an account?",
                              size: 12,
                              fontWeight: FontWeight.w300,
                              color: AppColor.textColor,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => BlocProvider(
                                          create:
                                              (context) =>
                                                  LoginCubit(LoginRepo()),
                                          child: LoginScreen(),
                                        ),
                                  ),
                                );
                              },
                              child: TextDefulte(
                                data: 'LogIn',
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
            ),
          );
        },
      ),
    );
  }
}
