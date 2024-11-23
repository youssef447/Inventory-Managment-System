// Date: 29/9/2024
// By: Youssef Ashraf, Nada Mohammed, Mohammed Ashraf
// Last update: 29/9/2024
// Objectives: This file is responsible for providing extensions to several classes in the project.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';

//-----------------------Context Extensions-----------------------------
extension ContextExtension on BuildContext {
  // ScreenInfo
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  bool get isTablett => MediaQuery.of(this).size.shortestSide > 500;
  bool get isLandscapee =>
      (MediaQuery.of(this).size.width > 900) || (isTablet && isLandscape);
  bool get isArabic => Get.locale.toString().toLowerCase().contains('ar');
  bool get isDesktop =>
      Platform.isWindows || Platform.isLinux || Platform.isMacOS;

  void navigateTo(String routeName, {Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }
}

//-----------------------String Colors Extension-----------------------------
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
    if (this == 'Canceled'.tr) {
      return AppColors.red;
    }
    if (this == 'Out Stock'.tr) {
      return AppColors.red;
    }
    if (this == 'In Stock'.tr) {
      return AppColors.green;
    }
    if (this == 'Maintenance'.tr) {
      return AppColors.secondaryPrimary;
    }

    if (this == 'Returned'.tr) {
      return AppColors.primary;
    }
    if (this == 'InUse'.tr) {
      return AppColors.green;
    }
    if (this == 'Expired'.tr) {
      return AppColors.red;
    }
    return null;
  }
}
