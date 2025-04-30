import 'package:flutter/material.dart';

class SizedboxHeight extends StatelessWidget {
  final double h;
  const SizedboxHeight({super.key, required this.h});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
  
    );
  }
}