// Date: 29/9/2024
// By: Youssef Ashraf
// Objectives: This file is responsible for providing a helper class that is used to show a responsive widget based on the screen size.

import 'package:flutter/material.dart';
import '../../core/extensions/extensions.dart';

class ResponsiveHelper extends StatelessWidget {
  final Widget mobileWidget, tabletWidget;
  const ResponsiveHelper(
      {super.key, required this.mobileWidget, required this.tabletWidget});

  @override
  Widget build(BuildContext context) {
    return context.isTablett ? tabletWidget : mobileWidget;
  }
}
