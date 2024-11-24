// Date: 7/11/2024
// By:Mohamed Ashraf


import '../../../../../core/constants/app_assets.dart';

class ConsumablesEntity {
  final String consumableId;
  final String name;
  final String image;
  final String category;
  final String subcategory;
  final String model;
  final String brand;
  final DateTime dateReceived;
  final String quantity;
  final int reorderLevel;
  final int stockRemaining;
  final bool requiresApproval;
  final int reorderQuantity;
  final int availableQuantity;
  final String unitOfMeasurement;
  final String usageFrequency;
  final DateTime? expirationDate;
  final String status;
  final DateTime? dateReturn;

  final DateTime lastUpdate = DateTime.now();

  ConsumablesEntity({
    required this.consumableId,
    required this.name,
    required this.category,
    required this.subcategory,
    this.requiresApproval = true,
    required this.model,
    this.dateReturn,
    this.image = AppAssets.image,
    required this.brand,
    required this.dateReceived,
    required this.quantity,
    this.reorderLevel = 2,
    this.stockRemaining = 2,
    this.reorderQuantity = 3,
    this.availableQuantity = 3,
    required this.unitOfMeasurement,
    required this.usageFrequency,
    this.expirationDate,
    required this.status,
  });
}
