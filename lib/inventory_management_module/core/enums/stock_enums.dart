import 'dart:ui';

import '../theme/app_colors.dart';

enum StockStatus { inStock, outOfStock }

extension StockStatusExtension on StockStatus {
  String get getName {
    switch (this) {
      case StockStatus.inStock:
        return 'In Stock';
      case StockStatus.outOfStock:
        return 'Out of Stock';
    }
  }
}

extension StockStatusExtension2 on StockStatus {
  Color get getColor {
    switch (this) {
      case StockStatus.inStock:
        return AppColors.green;
      case StockStatus.outOfStock:
        return AppColors.red;
    }
  }
}
