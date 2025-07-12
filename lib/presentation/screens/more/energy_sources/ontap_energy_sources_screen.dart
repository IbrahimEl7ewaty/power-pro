import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/line_border.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/home/widget/background_image.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/widget/Improving_energy_widget.dart';

class OntapEnergySourcesScreen extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final List<String> advantages;
  final List<String> dailyUses;
  final String howItWorksDescription;
  final String howItWorksImage;

  const OntapEnergySourcesScreen({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.advantages,
    required this.dailyUses,
    required this.howItWorksDescription,
    required this.howItWorksImage,
  });

  @override
  Widget build(BuildContext context) {
    // Description for each advantage
    List<String> advantageDescriptions = [
      "Reduces waste and contributes to clean energy production.",
      "Helps minimize pollution and reliance on fossil fuels.",
      "Encourages sustainable practices and local agriculture.",
    ];

    return ContainerColorWidget(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(AppIcons.arrBack),
                      ),
                    ],
                  ),
                  SizedboxHeight(h: 20),
                  // Title
                  TextDefulte(
                    data: name,
                    size: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 20),
                  // Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imageUrl.isNotEmpty
                          ? imageUrl
                          : 'https://res.cloudinary.com/dsrv7czbc/image/upload/v1751434271/zty40g9tyryqj2a6swh4.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 220,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          'https://res.cloudinary.com/dsrv7czbc/image/upload/v1751434271/zty40g9tyryqj2a6swh4.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 220,
                        );
                      },
                    ),
                  ),
                  SizedboxHeight(h: 20),
                  // Description
                  TextDefulte(
                    data:
                        description.isNotEmpty
                            ? description
                            : 'No description available',
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 20),
                  // Advantages Section
                  TextDefulte(
                    data: "Advantages of this Energy Source",
                    size: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 20),
                  // Loop through the advantages list and create a widget for each
                  for (int i = 0; i < advantages.length; i++)
                    ImprovingEnergyWidget(
                      title: advantages[i],
                      description:
                          advantageDescriptions.length > i
                              ? advantageDescriptions[i]
                              : "Description not available",
                    ),
                  SizedboxHeight(h: 20),
                  // How It Works Section
                  TextDefulte(
                    data: "How it Works",
                    size: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 20),
                  TextDefulte(
                    data:
                        howItWorksDescription.isNotEmpty
                            ? howItWorksDescription
                            : 'No description available',
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      howItWorksImage.isNotEmpty
                          ? howItWorksImage
                          : 'https://res.cloudinary.com/dsrv7czbc/image/upload/v1751434271/zty40g9tyryqj2a6swh4.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 180,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          'https://res.cloudinary.com/dsrv7czbc/image/upload/v1751434271/zty40g9tyryqj2a6swh4.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 180,
                        );
                      },
                    ),
                  ),
                  SizedboxHeight(h: 20),
                  // Applications in Real Life Section
                  BackgroundImage(
                    height: 220,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextDefulte(
                            data: "Applications in Real Life",
                            size: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColor.textColor,
                          ),
                          SizedboxHeight(h: 10),
                          LineBorder(width: 90, height: 4.8),
                          SizedboxHeight(h: 30),
                          TextDefulte(
                            data:
                                "This energy source can be used in generating electricity for homes, factories, and remote areas, as well as supporting electrical grids.",
                            size: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.textColor,
                            maxLines: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedboxHeight(h: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
