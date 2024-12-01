// Date: 7/11/2024
// By:Mohamed Ashraf

import 'dart:io';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/enums/requests_enums.dart';
import '../../../../products/domain/subEntities/contract_details_entity.dart';
import '../../../../admin/suppliers/domain/supplier_entity.dart';
import '../../../requests/entities/attachment_entity.dart';

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
  final UnitOfMeasurement unitOfMeasurement;
  final String usageFrequency;
  final DateTime? expirationDate;
  final DateTime? expectedLifeTime;
  final DateTime expectedLifeTimeDate = DateTime.now();
  final String status;
  final DateTime? dateReturn;
  final DateTime lastUpdate = DateTime.now();
  SupplierEntity supplier = SupplierEntity(
    supplierName: 'TechSource Solutions',
    postalCode: '1313',
    city: 'Cairo',
    country: 'Egypt',
    email: 'jCgQ5@example.com',
    firstName: 'Youssef',
    lastName: 'Ashraf',
    phoneNumber: '010100101010',
    supplierId: '110',
    stateOrProvince: 'NA',
    contractDetails: ContractdetailsEntity(
      attachmentEntity:
          AttachmentEntity(file: File('assets/dummyFile/example.pdf')),
      endDate: DateTime.now(),
      startDate: DateTime.now(),
    ),
  );
  //---- admin ---
  final String supplierId;
  final String supplierName;
  final String storageLocation;
  final int quantityOnHand;
  final String unitCost;
  final String currency;

  final DateTime maintenanceSchedule = DateTime.now();
  final String maintenanceFrequency = 'Monthly';

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
     this.unitOfMeasurement = UnitOfMeasurement.gram,
    required this.usageFrequency,
    this.expirationDate,
    this.expectedLifeTime,
    required this.status,

    //---- admin ---
    this.supplierId = '015',
    this.supplierName = 'E-Tech Distributors',
    this.storageLocation = 'Room A1',
    this.quantityOnHand = 15,
    this.unitCost = '200',
    this.currency = 'USd',
  });
}
