import 'package:flutter/material.dart';

class TextDefulte extends StatelessWidget {
  final String data;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final int? maxLines;
  const TextDefulte({
    super.key,
    required this.data,
    required this.size,
    required this.fontWeight,
    required this.color,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,

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
