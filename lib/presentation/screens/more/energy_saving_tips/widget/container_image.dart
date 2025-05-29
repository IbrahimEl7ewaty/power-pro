import 'package:flutter/material.dart';

class ContainerImage extends StatelessWidget {
  final String image;
  final bool? isInfinite;
  final double? width;
  const ContainerImage({super.key, required this.image, this.isInfinite, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Image.asset(image, fit: BoxFit.cover,
          width: isInfinite == true ? double.infinity:width),
      
    );
  }
}
