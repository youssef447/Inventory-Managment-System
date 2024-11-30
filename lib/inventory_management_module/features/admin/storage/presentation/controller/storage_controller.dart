import 'dart:io';

import 'package:get/get.dart';

import '../../../../employee/Assets/domain/entity/assets_entity.dart';
import '../../../../employee/requests/entities/attachment_entity.dart';
import '../../../../products/domain/product_entity.dart';
import '../../../../products/domain/subEntities/contract_details_entity.dart';
import '../../../../products/enums/product_enums.dart';
import '../../../suppliers/domain/supplier_entity.dart';
import '../../constants/storage_ids.dart';
import '../../domain/storage_location_entity.dart';

//Youssef Ashraf
///Represents The Storage Location Controller for Storage Tab
class StorageController extends GetxController {
  final List<String> storageHeaders = [
    'Location ID',
    'Location Name',
    'Location Type',
    'Country',
    'State Or Province',
    'City',
    'Postal Code',
    'Storage Capacity',
    'Condition Of Storage',
    'Environmental Control Type',
    'Products',
    'Accessibility Level',
    'Equipment Available',
  ];
  late List<StorageLocationAndQuantityEntity> storages;
  bool loading = true;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadStorages();
  }

  void loadStorages() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        storages = List.generate(
          3,
          (index) => StorageLocationAndQuantityEntity(
              locationName: 'Room A1',
              products: [
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
                )
              ]),
        );

        loading = false;
        update([StorageIds.storagePage]);
      },
    );
  }
}
