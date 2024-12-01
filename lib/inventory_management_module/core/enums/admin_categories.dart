enum AdminCategories {
  products,
  assets,
  consumables,
  order,
  suppliers,
  storageLocation
}

extension AdminCategoriesExtension on AdminCategories {
  String get getName {
    switch (this) {
      case AdminCategories.products:
        return 'Products';
      case AdminCategories.assets:
        return 'Assets';
      case AdminCategories.consumables:
        return 'Consumables';
      case AdminCategories.order:
        return 'Orders';
      case AdminCategories.suppliers:
        return 'Suppliers';
      case AdminCategories.storageLocation:
        return 'Storage Location';
    }
  }
}
