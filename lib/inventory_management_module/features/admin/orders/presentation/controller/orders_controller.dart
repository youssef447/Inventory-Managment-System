import 'dart:io';

import 'package:get/get.dart';

import '../../../../employee/Assets/domain/entity/assets_entity.dart';
import '../../../../employee/requests/entities/attachment_entity.dart';
import '../../../../products/domain/product_entity.dart';
import '../../../../products/domain/subEntities/contract_details_entity.dart';
import '../../../../products/domain/subEntities/storage_location_entity.dart';
import '../../../../products/domain/subEntities/supplier_entity.dart';
import '../../../../products/enums/product_enums.dart';
import '../../constants/order_ids.dart';
import '../../domain/order_entity.dart';

class OrdersController extends GetxController {
  late List<OrderEntity> orders;
  bool loading = true;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadOrders();
  }

  void loadOrders() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        orders = List.generate(
            10,
            (index) => OrderEntity(
                  orderId: '001',
                  requestDate: DateTime.now(),
                  dateReturn: DateTime.now(),
                  expectedRecieved: DateTime.now(),
                  priority: 'Urgent',
                  quantity: 2,
                  productEntity: ProductEntity(
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
                      productSpecifications: [
                        AttachmentEntity(
                            file: File('assets/dummyFile/example.pdf'))
                      ],
                      productWaranties: [
                        AttachmentEntity(
                            file: File('assets/dummyFile/example.pdf'))
                      ]),
                ));

        loading = false;
        update([OrderIds.ordersPage]);
      },
    );
  }
}
