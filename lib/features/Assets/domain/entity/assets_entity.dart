// Date: 7/11/2024
// By:Mohamed Ashraf
import '../../../../core/constants/enums.dart';

class AssetsEntity {
  final String assetId;
  final String assetName;
  final String category;
  final String subcategory;
  final String model;
  final String brand;
  final DateTime dateReceived;
  final DateTime? dateReturn;
  final String quantity;
  final String? maintenanceFrequency;
  final DateTime? nextMaintenanceSchedule;
  final DateTime? expirationDate;
  final int availableQuantity;
  final Status status;
  final AssetAvailabilityStatus availabilityStatus;

  AssetsEntity({
    required this.assetId,
    required this.assetName,
    required this.category,
    required this.subcategory,
    required this.model,
    this.availableQuantity = 0,
    required this.dateReceived,
    this.dateReturn,
    required this.quantity,
    this.availabilityStatus = AssetAvailabilityStatus.inStock,
    this.maintenanceFrequency,
    this.nextMaintenanceSchedule,
    this.expirationDate,
    required this.status,
    required this.brand,
  });
}
