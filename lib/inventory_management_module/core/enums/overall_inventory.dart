import '../constants/app_assets.dart';

enum OverallInventory { products, warehouses, orders, suppliers, lowStocks }

extension GetOverallInventoryName on OverallInventory {
  String get getName {
    switch (this) {
      case OverallInventory.products:
        return 'Products';
      case OverallInventory.warehouses:
        return 'Warehouse';
      case OverallInventory.orders:
        return 'Orders';
      case OverallInventory.suppliers:
        return 'Suppliers';
      case OverallInventory.lowStocks:
        return 'Low Stock';
    }
  }
}

extension GetOverallInventoryIcon on OverallInventory {
  String get getIcon {
    switch (this) {
      case OverallInventory.products:
        return AppAssets.products;
      case OverallInventory.warehouses:
        return AppAssets.house;
      case OverallInventory.orders:
        return AppAssets.truck;
      case OverallInventory.suppliers:
        return AppAssets.supplier;
      case OverallInventory.lowStocks:
        return AppAssets.stock;
    }
  }
}
