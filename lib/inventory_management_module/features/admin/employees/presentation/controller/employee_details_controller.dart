import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/features/admin/employees/presentation/controller/employees_controller.dart';

import '../../../../employee/Assets/domain/entity/assets_entity.dart';
import '../../../../employee/requests/entities/attachment_entity.dart';
import '../../../../products/domain/assigned_user_products_entity.dart';
import '../../../../products/domain/product_entity.dart';
import '../../../../products/domain/subEntities/contract_details_entity.dart';
import '../../../../products/domain/subEntities/storage_location_entity.dart';
import '../../../../products/domain/subEntities/supplier_entity.dart';
import '../../../../products/enums/product_enums.dart';
import '../../constants/ids.dart';

class EmployeeDetailsController extends GetxController {
  late List<AssignedUserProductsEntity> employeeProducts;
  late List<AssignedUserProductsEntity> inUseProducts;
  late List<AssignedUserProductsEntity> returnedProducts;
  late List<AssignedUserProductsEntity> retrievedProducts;
  late List<AssignedUserProductsEntity> maintenanceProducts;
  late List<AssignedUserProductsEntity> requestedProducts;
  bool loading = true;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadEmployeeProducts();
  }

  loadEmployeeProducts([String? userId]) async {
    await Future.delayed(const Duration(seconds: 2));
    employeeProducts = [
      AssignedUserProductsEntity(
        assigneDate: DateTime.now(),
        returnDate: DateTime.now(),
        lastUpdate: DateTime.now(),
        quantityAssigned: 2,
        //dummy
        productentity: ProductEntity(
            id: '002',
            status: 'Returned',
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
              status: 'Maintenance',
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
            ]),
        //dummy
        userEntity: Get.find<EmployeesController>().employees.first,
      ),
      AssignedUserProductsEntity(
        assigneDate: DateTime.now(),
        returnDate: DateTime.now(),
        lastUpdate: DateTime.now(),
        quantityAssigned: 2,
        //dummy
        productentity: ProductEntity(
            id: '002',
            status: 'InUse',
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
              status: 'Maintenance',
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
            ]),
        //dummy
        userEntity: Get.find<EmployeesController>().employees.first,
      ),
      AssignedUserProductsEntity(
        assigneDate: DateTime.now(),
        returnDate: DateTime.now(),
        lastUpdate: DateTime.now(),
        quantityAssigned: 2,
        //dummy
        productentity: ProductEntity(
            id: '002',
            status: 'InUse',
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
              status: 'Maintenance',
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
            ]),
        //dummy
        userEntity: Get.find<EmployeesController>().employees.first,
      ),
    ];
    requestedProducts = employeeProducts
        .where((element) => element.productentity.status == 'Requested')
        .toList();

    returnedProducts = employeeProducts
        .where((element) => element.productentity.status == 'Returned')
        .toList();

    inUseProducts = employeeProducts
        .where((element) => element.productentity.status == 'InUse')
        .toList();

    maintenanceProducts = employeeProducts
        .where((element) => element.productentity.status == 'Maintenance')
        .toList();

    retrievedProducts = employeeProducts
        .where((element) => element.productentity.status == 'Retrieved')
        .toList();
    loading = false;
    update([AdminEmployeesIds.employeeDetails]);
  }

  final searchEmployeeProductsController = TextEditingController();
  int currentCategoryIndex = 0;

  updateCategoryIndex(int index) {
    currentCategoryIndex = index;
    update([AdminEmployeesIds.employeeDetails]);
  }

  List getCurrentProducts() {
    switch (currentCategoryIndex) {
      case 0:
        return inUseProducts;
      case 1:
        return returnedProducts;
      case 2:
        return retrievedProducts;
      case 3:
        return maintenanceProducts;

      default:
        return requestedProducts;
    }
  }
}
