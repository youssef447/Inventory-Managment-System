// Date: 7/11/2024
// By:Mohamed Ashraf

import 'dart:io';

import '../../../../../core/constants/app_assets.dart';
import '../../../../products/domain/subEntities/contract_details_entity.dart';
import '../../../../admin/suppliers/domain/supplier_entity.dart';
import '../../../requests/entities/attachment_entity.dart';

class AssetsEntity {
  final String image = AppAssets.pphone;
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
  final DateTime? expectedLifeTime;
  final int availableQuantity;
  final String status;
  final String availabilityStatus;
  final bool requiresApprovals;
  final DateTime lastUpdate = DateTime.now();
  //---- admin ---
  final String supplierId;
  final String supplierName;
  final String storageLocation;
  final String storageRequirement;
  final int quantityOnHand;
  final String unitCost;
  final String currency;
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
    this.expectedLifeTime,
    required this.status,
    required this.brand,
    //---- admin ---
    this.supplierId = '015',
    this.supplierName = 'E-Tech Distributors',
    this.storageLocation = 'Room A1',
    this.quantityOnHand = 15,
    this.unitCost = '200',
    this.currency = 'USd',
    this.storageRequirement = 'Electronic',
  });
}
