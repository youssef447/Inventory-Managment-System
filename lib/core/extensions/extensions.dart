// Date: 29/9/2024
// By: Youssef Ashraf, Nada Mohammed, Mohammed Ashraf
// Last update: 29/9/2024
// Objectives: This file is responsible for providing extensions to several classes in the project.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../enums/requests_enums.dart';
import '../theme/app_colors.dart';
import '../../core/constants/app_assets.dart';

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
}

//Request Model
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

extension GetName on RequestStatus {
  String get getName {
    switch (this) {
      case RequestStatus.pending:
        return 'Pending'.tr;
      case RequestStatus.approved:
        return 'Approved'.tr;
      case RequestStatus.cancelled:
        return 'Canceled'.tr;
      case RequestStatus.rejected:
        return 'Rejected'.tr;
    }
  }
}

extension GetriorityType on RequestPriorityTypes {
  String get getName {
    switch (this) {
      case RequestPriorityTypes.high:
        return 'High';
      case RequestPriorityTypes.urgent:
        return 'Urgent';
      case RequestPriorityTypes.low:
        return 'Low';
      case RequestPriorityTypes.medium:
        return 'Medium';
    }
  }
}

extension GetAsset on RequestStatus {
  String get getAsset {
    switch (this) {
      case RequestStatus.pending:
        return AppAssets.pending;
      case RequestStatus.approved:
        return AppAssets.approved;
      case RequestStatus.cancelled:
        return AppAssets.canceled;
      case RequestStatus.rejected:
        return AppAssets.rejected;
    }
  }
}

extension GetReqActionName on RequestActions {
  String get getName {
    switch (this) {
      case RequestActions.requestAsset:
        return 'Request Asset';
      case RequestActions.returnAsset:
        return 'Return Asset';
      case RequestActions.routineMaintenance:
        return 'Routine Maintenance';
      case RequestActions.repairAsset:
        return 'Repair Asset';
    }
  }
}

extension GetIssuName on IssueTypes {
  String get getName {
    switch (this) {
      case IssueTypes.mechanical:
        return 'Mechanical';
      case IssueTypes.electrical:
        return 'Electrical';
      case IssueTypes.software:
        return 'Software';
      case IssueTypes.performance:
        return 'Performance';
      case IssueTypes.safety:
        return 'Safety';
    }
  }
}
