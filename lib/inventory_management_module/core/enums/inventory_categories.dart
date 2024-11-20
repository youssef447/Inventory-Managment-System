enum InventoryCategories { assets, consumables, requests }

extension InventoryCategoriesExtension on InventoryCategories {
  String get getName {
    switch (this) {
      case InventoryCategories.assets:
        return 'Assets';
      case InventoryCategories.consumables:
        return 'Consumables';
      case InventoryCategories.requests:
        return 'Requests';
    }
  }
}
