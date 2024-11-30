enum Category { officeSupplies, equipment, intangible }

extension CategoryExtension on Category {
  String get getName {
    switch (this) {
      case Category.officeSupplies:
        return 'Office Supplies';
      case Category.equipment:
        return 'Equipment';
      case Category.intangible:
        return 'Intangible';
    }
  }
}

extension CategoryArabicExtension on Category {
  String get getArabicName {
    switch (this) {
      case Category.officeSupplies:
        return 'لوازم المكاتب';
      case Category.equipment:
        return 'معدات';
      case Category.intangible:
        return 'غير ملموس';
    }
  }
}

enum SubCategory { laptop, paperProduct, bathroomSupplies }

extension SubCategoryExtension on SubCategory {
  String get getName {
    switch (this) {
      case SubCategory.laptop:
        return 'Laptop';
      case SubCategory.paperProduct:
        return 'Paper Products';
      case SubCategory.bathroomSupplies:
        return 'Bathroom Supplies';
    }
  }
}

extension SubCategoryArabicExtension on SubCategory {
  String get getArabicName {
    switch (this) {
      case SubCategory.laptop:
        return 'لابتوب';
      case SubCategory.paperProduct:
        return 'منتجات ورقية';
      case SubCategory.bathroomSupplies:
        return 'مستلزمات الحمام';
    }
  }
}
