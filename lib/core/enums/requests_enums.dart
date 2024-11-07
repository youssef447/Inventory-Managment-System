import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_assets.dart';
import '../theme/app_colors.dart';

enum RequestStatus {
  approved,
  cancelled,
  pending,
  rejected,
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
    if (this == 'Canceled'.tr) {
      return AppColors.red;
    }
    return null;
  }
}

extension GetName on RequestStatus {
  String get getName {
    switch (this) {
      case RequestStatus.pending:
        return 'Pending';
      case RequestStatus.approved:
        return 'Approved';
      case RequestStatus.cancelled:
        return 'Canceled';
      case RequestStatus.rejected:
        return 'Rejected';
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
