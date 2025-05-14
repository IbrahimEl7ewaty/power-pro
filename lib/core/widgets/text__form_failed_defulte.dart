import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';

class TextFormFailedDefulte extends StatefulWidget {
  final String hintText;
  final double sizeHint;
  final String? icon;
  final bool isPassword;
  final TextEditingController? controller;
  final bool colorText;

  const TextFormFailedDefulte({
    Key? key,
    this.hintText = '',
    this.sizeHint = 10.48,
    this.icon,
    this.isPassword = false,
    this.controller,
    this.colorText = true,
  }) : super(key: key);

  @override
  State<TextFormFailedDefulte> createState() => _TextFormFailedDefulteState();
}

class _TextFormFailedDefulteState extends State<TextFormFailedDefulte> {
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
                  widget.colorText ? AppColor.textColor : AppColor.primaryWhite,
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
