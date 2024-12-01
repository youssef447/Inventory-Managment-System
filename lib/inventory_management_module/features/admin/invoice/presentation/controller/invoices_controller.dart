import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/enums/departments.dart';
import '../../../../../core/enums/orders_status.dart';
import '../../../../employee/Assets/domain/entity/assets_entity.dart';
import '../../../../employee/home/domain/user_entity.dart';
import '../../../../employee/requests/entities/attachment_entity.dart';
import '../../../../products/domain/product_entity.dart';
import '../../../../products/domain/subEntities/contract_details_entity.dart';
import '../../../../products/enums/product_enums.dart';
import '../../../orders/domain/order_entity.dart';
import '../../../storage/domain/storage_location_entity.dart';
import '../../../suppliers/domain/supplier_entity.dart';
import '../../constants/ids.dart';

//Youssef Ashraf
///Handles the logic of the Invoices Page
class InvoicesController extends GetxController {
  List<OrderEntity> invoices = [];
  bool loading = true;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadInvoices();
  }

  loadInvoices() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    invoices = List.generate(
      10,
      (index) => OrderEntity(
        orderId: '00${index + 1}',
        orderDate: DateTime.now(),
        dateReturn: DateTime.now(),
        expectedRecieved: DateTime.now(),
        orderStatus: index == 1
            ? OrderStatus.pending
            : index == 3
                ? OrderStatus.processing
                : OrderStatus.completed,
        priority: 'Urgent',
        quantity: 2,
        productEntity: [
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
            productSpecifications: [
              AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
            ],
            productWaranties: [
              AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
            ],
          ),
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
            productSpecifications: [
              AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
            ],
            productWaranties: [
              AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
            ],
          ),
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
            productSpecifications: [
              AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
            ],
            productWaranties: [
              AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
            ],
          ),
        ],
      ),
    );
    loading = false;
    update([InvoicesIds.invoicesPage]);
  }

  final searchController = TextEditingController();
  List<String> invoiceTableHeaders = [
    'NO',
    'ARTICLE',
    'QUANTITY',
    'UNIT PRICE',
    'VAT',
    'AMOUNT',
    'FINAL AMOUNT',
  ];
  List<UserEntity> dummyUsers = [
    UserEntity(
      firstName: 'Ahmed',
      id: '024',
      lastName: 'Mohammed',
    ),
    UserEntity(
      firstName: 'Khaled',
      id: '024',
      lastName: 'Ahmed',
    ),
    UserEntity(
      firstName: 'Youssef',
      id: '024',
      lastName: 'Mohammed',
    ),
  ];

  //-----------------------Filter---------------------
  List<String> dummyjobTitles = ['job 1', 'job 2'];
  Rxn<String>? selectedJobTitle = Rxn<String>();
  Rxn<Departments>? selectedDepartment = Rxn<Departments>();
  updateJobTitle(String v) {
    applyEnabled.value = true;
    selectedJobTitle?.value = v;
  }

  updateDep(Departments v) {
    applyEnabled.value = true;

    selectedDepartment?.value = v;
  }

  Rx<bool> applyEnabled = false.obs;
  applyFilter() {
    if (selectedDepartment?.value != null) {}
    if (selectedJobTitle?.value != null) {}
  }

  resetFilter() {
    selectedDepartment?.value = null;
    selectedJobTitle?.value = null;
    applyEnabled.value = false;
  }
}
