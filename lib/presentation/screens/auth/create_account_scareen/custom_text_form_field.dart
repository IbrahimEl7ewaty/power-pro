import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String? icon;
  final double sizeHint;
  final bool colorText;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.validator,
    this.icon,
    this.sizeHint = 10.48,
    this.colorText = true,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
              obscureText: widget.obscureText ? _obscureText : false,
              keyboardType: widget.keyboardType,
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
                  color:
                      widget.colorText
                          ? AppColor.textColor
                          : AppColor.primaryWhite,
                ),
                border: InputBorder.none,
                labelText: widget.labelText,
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColor.textColor,
                ),
                suffixIcon:
                    widget.obscureText
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
        ),
        SizedboxHeight(h: 15),
      ],
    );
  }
}
