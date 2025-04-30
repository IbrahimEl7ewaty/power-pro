import 'package:flutter/material.dart';

class TextDefulte extends StatelessWidget {
  final String data;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  const TextDefulte({super.key, required this.data, required this.size, required this.fontWeight, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(data,
        style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
      fontFamily: 'Satoshi',
    ));
  }
}
