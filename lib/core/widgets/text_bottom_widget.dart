import 'package:flutter/material.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';

class TextBottomWidget extends StatelessWidget {
  final String data;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final VoidCallback onPressed;
  const TextBottomWidget({super.key, required this.data, required this.size, required this.fontWeight, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: TextDefulte(data: data, size: size, fontWeight: fontWeight, color: color));
  }
}