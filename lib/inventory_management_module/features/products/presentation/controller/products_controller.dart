import 'dart:io';

import 'package:get/get.dart';

import '../../../employee/Assets/domain/entity/assets_entity.dart';
import '../../../employee/requests/entities/attachment_entity.dart';
import '../../domain/product_entity.dart';
import '../../domain/subEntities/contractDetailsEntity.dart';
import '../../domain/subEntities/storage_location_entity.dart';
import '../../domain/subEntities/supplier_entity.dart';
import '../../enums/product_enums.dart';

class ProductsController extends GetxController {
  late List<ProductEntity> products;
  bool loading = true;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    products = [
      ProductEntity(
          id: '001',
          productType: ProductType.asset,
          storage: [
            StorageLocationAndQuantityEntity(
                locationName: 'Room A13', quantity: 10)
          ],
          supplier: SupplierEntity(
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
              attachmentEntity: AttachmentEntity(file: File('path')),
              endDate: DateTime.now(),
              startDate: DateTime.now(),
            ),
          ),
          totalQuantity: 20,
          currency: 'USD',
          unitCost: 12,
          expectedLifeTime: DateTime.now(),
          productSpecifications: [AttachmentEntity(file: File('path'))],
          productWaranties: [AttachmentEntity(file: File('path'))],
          assetEntity: AssetsEntity(
          assetId: 'A101',
          assetName: 'Laptop',
          category: 'Electronics',
          subcategory: 'Computers',
          model: 'GZ 15',
          brand: 'dell',
          dateReceived: DateTime(2024, 1, 10, 9, 0),
          dateReturn: DateTime(2023, 1, 10, 9, 0),
          quantity: '700',
          maintenanceFrequency: 'Monthly',
          nextMaintenanceSchedule: DateTime(2024, 1, 10, 9, 0),
          expirationDate: DateTime(2024, 1, 10, 9, 0),
          status: 'Maintenance'.tr,
        ),


      )
    ];
  }
}
