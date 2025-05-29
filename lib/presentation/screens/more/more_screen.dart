import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/energy_saving_tips_screen.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/energy_sources_screen.dart';
import 'package:power_pro_app/presentation/screens/more/profile/profile_screen.dart';
import 'package:power_pro_app/presentation/screens/more/videos/videos_screen.dart';
import 'package:power_pro_app/presentation/screens/more/widget/container_more_widget.dart';
import 'package:power_pro_app/presentation/screens/more/widget/container_title.dart';

void showMoreBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return FractionallySizedBox(heightFactor: 0.4, child: const MoreScreen());
    },
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
  );
}

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerMoreWidget(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContainerTitle(
                icon: AppIcons.energySavingTips,
                widthIcon: 20,
                heightIcon: 20,
                data: "Energy-saving tips",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EnergySavingTipsScreen(),
                    ),
                  );
                },
              ),
              ContainerTitle(
                icon: AppIcons.energySources,
                widthIcon: 20,
                heightIcon: 20,
                data: "Energy sources",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EnergySourcesScreen(),
                    ),
                  );
                },
              ),
              ContainerTitle(
                icon: AppIcons.video,
                widthIcon: 20,
                heightIcon: 20,
                data: "Videos",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VideosScreen(),
                    ),
                  );
                },
              ),
              ContainerTitle(
                icon: AppIcons.user,
                widthIcon: 25,
                heightIcon: 25,
                data: "Profile",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
