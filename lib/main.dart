import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:rive/rive.dart' as rive;

import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/custom_nav.dart';
import 'pages/home_page.dart';
import 'pages/project_page.dart';
import 'pages/skill_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Faiyaz Ullah',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
              letterSpacing: 2,
              shadows: [
                BoxShadow(
                  offset: Offset(4, 4),
                  color: Colors.black,
                  blurRadius: 5,
                )
              ]),
        ),
        fontFamily: 'M PLUS Rounded 1c',
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        scaffoldBackgroundColor: Colors.transparent,
        useMaterial3: true,
      ),
      home: const ResponsiveScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _pageController = PageController(initialPage: 0);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50),
        child: CustomNavBar(
          controller: _pageController,
        ),
      ),
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
                HomePage(),
                AboutPage(),
                SkillPage(),
                ProjectPage(),
                ContactPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
