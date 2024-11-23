// Date: 29/9/2024
// By: Youssef Ashraf
// Objectives: This file is responsible for providing a helper class that is used to show a responsive widget based on the screen size.

import 'package:flutter/material.dart';
import '../../core/extensions/extensions.dart';

class OrientationHelper extends StatelessWidget {
  final Widget landScape, portrait;
  const OrientationHelper(
      {super.key, required this.landScape, required this.portrait});

  @override
  Widget build(BuildContext context) {
    return context.isLandscapee ? landScape : portrait;
  }
}
