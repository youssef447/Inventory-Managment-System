// Date: 7/11/2024
// By:Mohamed Ashraf



import '../../../../../core/constants/app_assets.dart';

class AssetsEntity {
  final String image = AppAssets.phone;
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
  final String status;
  final String availabilityStatus;
  final bool requiresApprovals;
  final DateTime lastUpdate = DateTime.now();

  AssetsEntity({
    this.assetId = '001',
    required this.assetName,
    required this.category,
    required this.subcategory,
    required this.model,
    this.availableQuantity = 0,
    required this.dateReceived,
    this.dateReturn,
    this.requiresApprovals = true,
    required this.quantity,
    this.availabilityStatus = 'In Stock',
    this.maintenanceFrequency,
    this.nextMaintenanceSchedule,
    this.expirationDate,
    required this.status,
    required this.brand,
  });
}
