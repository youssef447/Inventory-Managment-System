import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../features/employee/consumables/domain/entity/consumables_entity.dart';

import '../../../../../core/enums/requests_enums.dart';
import '../../../../employee/Assets/domain/entity/assets_entity.dart';
import '../../../../employee/requests/entities/attachment_entity.dart';
import '../../../../products/domain/product_entity.dart';
import '../../../../products/domain/subEntities/contract_details_entity.dart';
import '../../../storage/domain/storage_location_entity.dart';
import '../../../suppliers/domain/supplier_entity.dart';
import '../../../../products/enums/product_enums.dart';
import '../../constants/order_ids.dart';

class NewOrderController extends GetxController {
  late List<ProductEntity> availableProducts;

  ///selected Products To be Ordered based on checkbox values (must be same length as availableProducts)

  late List<bool> selectedProducts;
  bool loading = true;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadAvailableProducts();
  }

  void loadAvailableProducts() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        availableProducts = List.generate(
          10,
          (index) => ProductEntity(
              id: '002',
              productType:
                  index == 0 ? ProductType.consumable : ProductType.asset,
              storage: [
                StorageLocationAndQuantityEntity(
                    locationName: 'Room A13', quantity: 10)
              ],
              assetEntity: index == 0
                  ? null
                  : AssetsEntity(
                      assetName: 'Dell GZ 15',
                      category: 'Electronics',
                      subcategory: 'Computer',
                      model: 'GZ 15',
                      dateReceived: DateTime.now(),
                      quantity: '2',
                      status: 'InUse',
                      brand: 'Dell',
                    ),
              consumablesEntity: index != 0
                  ? null
                  : ConsumablesEntity(
                      brand: 'Papers',
                      consumableId: '001',
                      name: 'Papers',
                      category: 'Papers',
                      subcategory: 'Papers',
                      model: 'GZ 15',
                      dateReceived: DateTime.now(),
                      quantity: '1',
                      unitOfMeasurement: UnitOfMeasurement.gram,
                      usageFrequency: 'Daily',
                      status: 'Pending',
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
                  attachmentEntity: AttachmentEntity(
                      file: File('assets/dummyFile/example.pdf')),
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
        );
        selectedProducts = List.generate(
          10,
          (index) => false,
        );

        loading = false;
        update([OrderIds.newOrderPage]);
      },
    );
  }

  selectOrderProduct(int index, bool value) {
    selectedProducts[index] = value;
    update([OrderIds.newOrderPage]);
  }

  ///Return selected Products To be Ordered based on checkbox values
  List<ProductEntity> getSelectedProducts() {
    return availableProducts
        .where(
            (element) => selectedProducts[availableProducts.indexOf(element)])
        .toList();
  }

  resetSelectedProducts() {
    selectedProducts = selectedProducts
        .map(
          (_) => false,
        )
        .toList();
    update([OrderIds.newOrderPage]);
  }

//products search controller
  final searchController = TextEditingController();
}
