enum ProductType { consumable, asset }

extension ProductTypeExtension on ProductType {
  String get getName {
    switch (this) {
      case ProductType.asset:
        return 'Asset';
      case ProductType.consumable:
        return 'Consumable';
    }
  }
}
