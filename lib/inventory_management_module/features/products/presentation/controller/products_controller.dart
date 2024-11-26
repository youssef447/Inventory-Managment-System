import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/enums/stock_enums.dart';
import '../../../employee/Assets/domain/entity/assets_entity.dart';
import '../../../employee/consumables/domain/entity/consumables_entity.dart';
import '../../../employee/requests/entities/attachment_entity.dart';
import '../../constants/ids.dart';
import '../../domain/product_entity.dart';
import '../../domain/subEntities/contractDetailsEntity.dart';
import '../../domain/subEntities/storage_location_entity.dart';
import '../../domain/subEntities/supplier_entity.dart';
import '../../enums/product_enums.dart';

class ProductsController extends GetxController {
  late List<ProductEntity> products;
  List<AssetsEntity> assets = [];
  List<ConsumablesEntity> consumables = [];
  bool loading = true;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadProducts();
  }

  loadProducts() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    products = [
      ProductEntity(
          id: '002',
          productType: ProductType.asset,
          additionalNotes:
              'Lorem Ipsum Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum',
          storage: [
            StorageLocationAndQuantityEntity(
              locationName: 'Room A13',
              quantity: 10,
            ),
            StorageLocationAndQuantityEntity(
              locationName: 'Room A13',
              quantity: 10,
            ),
            StorageLocationAndQuantityEntity(
              locationName: 'Room A13',
              quantity: 10,
            ),
          ],
          assetEntity: AssetsEntity(
            assetName: 'Dell GZ 15',
            category: 'Electronics',
            subcategory: 'Computer',
            model: '552',
            dateReceived: DateTime.now(),
            quantity: '2',
            status: 'InUse',
            brand: 'Dell',
          ),
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
              attachmentEntity:
                  AttachmentEntity(file: File('assets/dummyFile/example.pdf')),
              endDate: DateTime.now(),
              startDate: DateTime.now(),
            ),
          ),
          totalQuantity: 20,
          currency: 'USD',
          unitCost: 12,
          expectedLifeTime: DateTime.now(),
          productSpecifications: [
            AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
          ],
          productWaranties: [
            AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
          ]),
      ProductEntity(
          id: '002',
          productType: ProductType.asset,
          storage: [
            StorageLocationAndQuantityEntity(
                locationName: 'Room A13', quantity: 10)
          ],
          assetEntity: AssetsEntity(
            assetName: 'Dell GZ 15',
            category: 'Electronics',
            subcategory: 'Computer',
            model: 'GZ 15',
            dateReceived: DateTime.now(),
            quantity: '2',
            status: 'InUse',
            brand: 'Dell',
          ),
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
              attachmentEntity:
                  AttachmentEntity(file: File('assets/dummyFile/example.pdf')),
              endDate: DateTime.now(),
              startDate: DateTime.now(),
            ),
          ),
          totalQuantity: 20,
          currency: 'USD',
          unitCost: 12,
          expectedLifeTime: DateTime.now(),
          productSpecifications: [
            AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
          ],
          productWaranties: [
            AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
          ]),
      ProductEntity(
          id: '003',
          productType: ProductType.asset,
          storage: [
            StorageLocationAndQuantityEntity(
                locationName: 'Room A13', quantity: 10)
          ],
          assetEntity: AssetsEntity(
            assetName: 'Dell GZ 15',
            category: 'Electronics',
            subcategory: 'Computer',
            model: 'GZ 15',
            dateReceived: DateTime.now(),
            quantity: '2',
            status: 'InUse',
            brand: 'Dell',
          ),
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
              attachmentEntity:
                  AttachmentEntity(file: File('assets/dummyFile/example.pdf')),
              endDate: DateTime.now(),
              startDate: DateTime.now(),
            ),
          ),
          totalQuantity: 20,
          currency: 'USD',
          unitCost: 12,
          expectedLifeTime: DateTime.now(),
          productSpecifications: [
            AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
          ],
          productWaranties: [
            AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
          ]),
      ProductEntity(
          id: '004',
          productType: ProductType.consumable,
          consumablesEntity: ConsumablesEntity(
            consumableId: 'C005',
            name: 'Face Mask',
            category: 'Medical Supplies',
            subcategory: 'Personal Protective Equipment',
            model: 'FM789',
            brand: 'SafeHealth',
            dateReceived: DateTime(2023, 7, 10),
            quantity: '500',
            unitOfMeasurement: 'pieces',
            usageFrequency: 'Daily',
            expirationDate: DateTime(2024, 7, 10),
            status: 'Maintenance',
          ),
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
              attachmentEntity:
                  AttachmentEntity(file: File('assets/dummyFile/example.pdf')),
              endDate: DateTime.now(),
              startDate: DateTime.now(),
            ),
          ),
          totalQuantity: 20,
          currency: 'USD',
          unitCost: 12,
          expectedLifeTime: DateTime.now(),
          productSpecifications: [
            AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
          ],
          productWaranties: [
            AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
          ]),
      ProductEntity(
          id: '004',
          productType: ProductType.consumable,
          consumablesEntity: ConsumablesEntity(
            consumableId: 'C005',
            name: 'Face Mask',
            category: 'Medical Supplies',
            subcategory: 'Personal Protective Equipment',
            model: 'FM789',
            brand: 'SafeHealth',
            dateReceived: DateTime(2023, 7, 10),
            quantity: '500',
            unitOfMeasurement: 'pieces',
            usageFrequency: 'Daily',
            expirationDate: DateTime(2024, 7, 10),
            status: 'Maintenance',
          ),
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
              attachmentEntity:
                  AttachmentEntity(file: File('assets/dummyFile/example.pdf')),
              endDate: DateTime.now(),
              startDate: DateTime.now(),
            ),
          ),
          totalQuantity: 20,
          currency: 'USD',
          unitCost: 12,
          expectedLifeTime: DateTime.now(),
          productSpecifications: [
            AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
          ],
          productWaranties: [
            AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
          ]),
      ProductEntity(
          id: '005',
          productType: ProductType.asset,
          assetEntity: AssetsEntity(
            assetName: 'Dell GZ 15',
            category: 'Electronics',
            subcategory: 'Computer',
            model: 'GZ 15',
            dateReceived: DateTime.now(),
            quantity: '2',
            status: 'InUse',
            brand: 'Dell',
          ),
          storage: [
            StorageLocationAndQuantityEntity(
                locationName: 'Room A13', quantity: 10)
          ],
          stockStatus: StockStatus.outOfStock,
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
              attachmentEntity:
                  AttachmentEntity(file: File('assets/dummyFile/example.pdf')),
              endDate: DateTime.now(),
              startDate: DateTime.now(),
            ),
          ),
          totalQuantity: 20,
          currency: 'USD',
          unitCost: 12,
          expectedLifeTime: DateTime.now(),
          productSpecifications: [
            AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
          ],
          productWaranties: [
            AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
          ]),
    ];
    loading = false;
     for (var model in products) {
      if (model.productType == ProductType.asset) {
        assets.add(model.assetEntity!);
      }
      if (model.productType == ProductType.consumable) {
        consumables.add(model.consumablesEntity!);
      }
    }
    update([ProductsIds.productsTab]);

  }

  //-----------------------Prodoct Details-----------------------
  final searchDetailsController = TextEditingController();
  final assignStockFilters = ['Assigned', 'Stock'];
  RxInt currentCategoryIndex = 0.obs;
  updateCategoryIndex(int index) {
    currentCategoryIndex.value = index;
  }
}
