enum BusinessType {
  manufacturer,
  distributor,
  serviceProvicer,
}

extension BusinessTypeExtension on BusinessType {
  String get getName {
    switch (this) {
      case BusinessType.manufacturer:
        return 'Manufacturer';
      case BusinessType.distributor:
        return 'Distributor';
      case BusinessType.serviceProvicer:
        return 'Service Provider';
    }
  }
}
