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

  final Status status;

  AssetsEntity(
      {required this.assetId,
      required this.assetName,
      required this.category,
      required this.subcategory,
      required this.model,
      required this.dateReceived,
       this.dateReturn,
      required this.quantity,
       this.maintenanceFrequency,
      this.nextMaintenanceSchedule,
       this.expirationDate,
      required this.status,
      required this.brand});
}
