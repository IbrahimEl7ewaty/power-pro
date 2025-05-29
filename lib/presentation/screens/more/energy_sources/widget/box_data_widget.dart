import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/ontap_energy_sources_screen.dart';

class BoxDataWidget extends StatelessWidget {
  final String imageUrl;
  const BoxDataWidget({super.key,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 180,
      height: 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap:  () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => OntapEnergySourcesScreen(
                  imageUrl: imageUrl,
                ),
          ),
        );
      },
          child: Image.asset(imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
