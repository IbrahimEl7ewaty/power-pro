import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/presentation/screens/blog/blog_screen.dart';
import 'package:power_pro_app/presentation/screens/contact_us/contact_screen.dart';
import 'package:power_pro_app/presentation/screens/energy_consumption/energy_consumption_screen.dart'
    show EnergyConsumptionScreen;
import 'package:power_pro_app/presentation/screens/home/widget/bottom_bar.dart';
import 'package:power_pro_app/presentation/screens/splash/splash_screen.dart';

import 'presentation/screens/home/home_screen.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}

//main scereen
// This is the main entry point of the application.
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static List<Widget> screens = [
    HomeScreen(),
    EnergyConsumptionScreen(),
    BlogScreen(),
    ContactScreen(),
    Placeholder(), 
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentIndexNotifier,
      builder: (context, currentIndex, _) {
        return ContainerColorWidget(
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              extendBody: true,
              body: screens[currentIndex],
              bottomNavigationBar:
                  BottomBar(), // هيتم استدعاء البوتوم شيت من هنا
            ),
          ),
        );
      },
    );
  }
}
