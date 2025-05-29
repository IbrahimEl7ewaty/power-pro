import 'package:flutter/material.dart';

class TextDefulte extends StatelessWidget {
  final String data;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  const TextDefulte({
    super.key,
    required this.data,
    required this.size,
    required this.fontWeight,
    required this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign ?? TextAlign.start,

      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        fontFamily: 'Satoshi',
        decoration: TextDecoration.none,
      ),
    );
  }
}
