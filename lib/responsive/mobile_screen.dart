import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
import '../mobile_pages/custom_drawer.dart';
import '../mobile_pages/mob_about.dart';
import '../mobile_pages/mob_contact.dart';
import '../mobile_pages/mob_home.dart';
import '../mobile_pages/mob_project.dart';

import '../pages/skill_page.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobPage();
  }
}

class MobPage extends StatelessWidget {
  const MobPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _pageController = PageController(initialPage: 0);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Faiyaz Ullah',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.purple.shade400,
            shadows: const [
              BoxShadow(
                  offset: Offset(3, 3), color: Colors.black, blurRadius: 5)
            ],
            letterSpacing: 3,
          ),
        ),
      ),
      drawer: CustomDrawer(controller: _pageController),
      body: Stack(
        children: [
          //background animation
          const rive.RiveAnimation.asset(
            'baloon_night.riv',
            animations: ['main', 'shooting_star'],
            fit: BoxFit.cover,
          ),
          //content
          ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
              PointerDeviceKind.stylus,
              PointerDeviceKind.trackpad,
            }),
            child: PageView(
              physics: const ClampingScrollPhysics(),
              controller: _pageController,
              scrollDirection: Axis.vertical,
              children: const [
                MobHomePage(),
                MobAboutPage(),
                SkillPage(),
                MobProjectPage(),
                MobContactPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
