// Date: 29/9/2024
// By: Youssef Ashraf, Nada Mohammed, Mohammed Ashraf
// Last update: 29/9/2024
// Objectives: This file is responsible for providing extensions to several classes in the project.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';

extension ContextExtension on BuildContext {
  // ScreenInfo
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  bool get isTablett => MediaQuery.of(this).size.shortestSide > 500;
  bool get isLandscapee => (MediaQuery.of(this).size.width > 1000);
  bool get isArabic => Get.locale.toString().toLowerCase().contains('ar');
}

extension GetColor on String {
  Color? get getColor {
    if (this == 'Pending'.tr) {
      return AppColors.warming;
    }
    if (this == 'Approved'.tr) {
      return AppColors.green;
    }
    if (this == 'Rejected'.tr) {
      return AppColors.red;
    }
    return null;
  }
}
