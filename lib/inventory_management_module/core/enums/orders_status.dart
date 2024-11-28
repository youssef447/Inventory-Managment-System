import 'dart:ui';

import '../theme/app_colors.dart';

enum OrderStatus {
  pending,
  processing,
  completed,
  cancelled,
  failed,
}

extension GetOrderStatusName on OrderStatus {
  String get getName {
    switch (this) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.completed:
        return 'Completed';
      case OrderStatus.cancelled:
        return 'Cancelled';
      case OrderStatus.failed:
        return 'Failed';
    }
  }
}

extension GetOrderStatusColor on OrderStatus {
  Color get getColor {
    switch (this) {
      case OrderStatus.pending:
        return AppColors.warming;
      case OrderStatus.processing:
        return AppColors.secondaryPrimary;
      case OrderStatus.completed:
        return AppColors.green;
      case OrderStatus.cancelled:
        return AppColors.red;
      case OrderStatus.failed:
        return AppColors.red;
    }
  }
}
