// Date: 25/11/2024
// By:Mohamed Ashraf


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../core/enums/requests_enums.dart';
import '../../../../employee/consumables/domain/entity/consumables_entity.dart';
import '../../../../employee/requests/entities/attachment_entity.dart';
import '../../../../products/domain/assigned_user_products_entity.dart';
import '../../../../products/domain/product_entity.dart';
import '../../../../products/domain/subEntities/contract_details_entity.dart';
import '../../../../products/enums/product_enums.dart';
import '../../../storage/domain/storage_location_entity.dart';
import '../../../suppliers/domain/supplier_entity.dart';


class ConsumableAssetsController extends GetxController {
  final searchDetailsController = TextEditingController();
  final assignFilters = ['Assigned',];
  RxInt currentCategoryIndex = 0.obs;
  updateCategoryIndex(int index) {
    currentCategoryIndex.value = index;
  }

  //------------------ hide or expand
  bool hideMaintenance = true;

  void toggleHideAndExpand() {
    hideMaintenance = !hideMaintenance;
    update();
  }

/////////////// delivery method dropDown
  List<String> deliveryMethod = [
    'car',
    'bus',
  ];
  Rxn<String> deliveryMethodValue = Rxn<String>();
  updateDeliveryMethodValue(String value) {
    deliveryMethodValue.value = value;
  }

  //------------- TextEditingController
  TextEditingController assetIdController = TextEditingController();
  TextEditingController requestIdController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController returnDateController = TextEditingController();
  TextEditingController deliveryMethodController = TextEditingController();



  List<AssignedUserProductsEntity> dummyAssignedUsers = [
    AssignedUserProductsEntity(
      assigneDate: DateTime.now(),
      lastUpdate: DateTime.now(),
      returnDate: DateTime.now(),
      quantityAssigned: 2,

      //dummy
      productentity: ProductEntity(
          id: '002',
          productType: ProductType.asset,
          storage: [
            StorageLocationAndQuantityEntity(
                locationName: 'Room A13', quantity: 10)
          ],
          consumablesEntity: ConsumablesEntity(
          consumableId: 'C003',
  name: 'Face Mask',
  category: 'Medical Supplies',
  subcategory: 'Personal Protective Equipment',
  model: 'FM789',
  brand: 'SafeHealth',
  dateReceived: DateTime(2023, 7, 10),
  quantity: '500',
  unitOfMeasurement: UnitOfMeasurement.gram,
  usageFrequency: 'daily',
  expirationDate: DateTime(2024, 7, 10),
  status: 'Returned',
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
    ),
    AssignedUserProductsEntity(
      assigneDate: DateTime.now(),
      lastUpdate: DateTime.now(),
      returnDate: DateTime.now(),
      quantityAssigned: 2,

      //dummy
      productentity: ProductEntity(
          id: '002',
          productType: ProductType.asset,
          storage: [
            StorageLocationAndQuantityEntity(
                locationName: 'Room A13', quantity: 10)
          ],
          consumablesEntity: ConsumablesEntity(
          consumableId: 'C003',
  name: 'Face Mask',
  category: 'Medical Supplies',
  subcategory: 'Personal Protective Equipment',
  model: 'FM789',
  brand: 'SafeHealth',
  dateReceived: DateTime(2023, 7, 10),
  quantity: '500',
            unitOfMeasurement: UnitOfMeasurement.gram,
  usageFrequency: 'daily',
  expirationDate: DateTime(2024, 7, 10),
  status: 'Returned',
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
    ),

  ];


}
