import 'package:flutter/material.dart';

class SizedboxWidth extends StatelessWidget {
  final double w;
  const SizedboxWidth({super.key, required this.w});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: w);
  }
}
