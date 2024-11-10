// Date: 29/9/2024
// By: Youssef Ashraf, Mohammed Ashraf
// Last update: 29/9/2024

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/////////////////// Assets

enum Status {
  maintenance,
  returned,
  inUse,
  expired,
}

extension GetColor on Status {
  Color get getColor {
    switch (this) {
      case Status.maintenance:
        return AppColors.secondaryPrimary;
      case Status.returned:
        return AppColors.primary;
      case Status.inUse:
        return AppColors.green;
      case Status.expired:
        return AppColors.red;
    }
  }
}

extension GetStatusName on Status {
  String get getName {
    switch (this) {
      case Status.maintenance:
        return 'Approved';
      case Status.returned:
        return 'Pending';
      case Status.inUse:
        return 'InUse';
      case Status.expired:
        return 'Expired';
    }
  }
}

enum AssetAvailabilityStatus {
  outOfStock,
  inStock,
}

extension GetAssetAvailabilityStatusName on AssetAvailabilityStatus {
  String get getName {
    switch (this) {
      case AssetAvailabilityStatus.outOfStock:
        return 'Out Stock';
      case AssetAvailabilityStatus.inStock:
        return 'In Stock';
    }
  }
}

extension GetAssetAvailabilityColor on AssetAvailabilityStatus {
  Color get getColor {
    switch (this) {
      case AssetAvailabilityStatus.outOfStock:
        return AppColors.red;
      case AssetAvailabilityStatus.inStock:
        return AppColors.green;
    }
  }
}
