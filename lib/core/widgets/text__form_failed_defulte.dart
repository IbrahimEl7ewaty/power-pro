import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';

class GradientTextField extends StatefulWidget {
  final String hintText;
  final double sizeHint;
  final String? icon;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const GradientTextField({
    Key? key,
    required this.controller,
    this.hintText = '',
    this.sizeHint = 10.48,
    this.icon,
    this.isPassword = false,
    this.validator,
  }) : super(key: key);

  @override
  State<GradientTextField> createState() => _GradientTextFieldState();
}

class _GradientTextFieldState extends State<GradientTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.65),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColor.blueBlack, AppColor.blueWhite],
        ),
        borderRadius: BorderRadius.circular(5.24),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColor.primaryWhite,
          borderRadius: BorderRadius.circular(5.24),
        ),
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscureText : false,
          validator: widget.validator,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColor.textColor,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: widget.sizeHint,
              fontWeight: FontWeight.w400,
              color: AppColor.textColor,
            ),
            border: InputBorder.none,
            suffixIcon:
                widget.isPassword
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: SvgPicture.asset(
                        _obscureText
                            ? AppIcons.showPassword
                            : AppIcons.showPassword,
                      ),
                    )
                    : (widget.icon != null
                        ? Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(widget.icon!),
                        )
                        : null),
          ),
        ),
      ),
    );
  }
}
