import 'package:flutter/material.dart';

import 'desktop_screen.dart';
import 'mobile_screen.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return MobileScreen();
        } else {
          return DesktopScreen();
        }
      },
    );
  }
}
