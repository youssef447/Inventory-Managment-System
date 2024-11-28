enum Currncies {
  usd,
  egp,
}

extension CurrnciesExtension on Currncies {
  String get getName {
    switch (this) {
      case Currncies.usd:
        return 'USD';
      case Currncies.egp:
        return 'EGP';
    }
  }
}
