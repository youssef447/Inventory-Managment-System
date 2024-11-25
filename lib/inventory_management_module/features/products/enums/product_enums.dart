enum ProductType { consumable, asset }

extension ProductTypeExtension on ProductType {
  String get name {
    switch (this) {
      case ProductType.asset:
        return 'Asset';
      case ProductType.consumable:
        return 'Consumable';
    }
  }
}
