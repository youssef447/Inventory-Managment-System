
import 'package:inventory_management/inventory_management_module/features/employee/Assets/domain/entity/assets_entity.dart';

import '../../../employee/home/domain/user_entity.dart';
import '../../../products/domain/product_entity.dart';
import 'maintenance_entity.dart';

class ServiceEntity {
  UserEntity userEntity = UserEntity(
    firstName: 'Ahmed',
    lastName: 'Mohammed',
    id: '',
  );
  String issueType;
  String? description;
  String status;
  DateTime requestRepairDate;
  DateTime returnDate;
  DateTime lastUpdate;
  MaintenanceEntity maintenanceEntity;
  String? serviceProvider;
    String? firstName;
    String? lastName;
    String? descriptionOrIssueReported  ;
    String? wasPartReplaced;
    String? warrantyCoverage;
    String? warrantyExpirationDate;
    String? dateOfApproval;

  ServiceEntity({
    required this.requestRepairDate,
    required this.returnDate,
    required this.lastUpdate,
    required this.issueType,
    required this.status,
    required this.maintenanceEntity,
    this.description,
    this.serviceProvider,
    this.firstName,
    this.lastName,
    this.descriptionOrIssueReported,
    this.wasPartReplaced,
    this.warrantyCoverage,
    this.warrantyExpirationDate,
    this.dateOfApproval,
  });
}
