import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/approve_cycle.dart';
import '../../../../../core/enums/requests_enums.dart';
import '../../../../employee/Assets/domain/entity/assets_entity.dart';
import '../../../../employee/consumables/domain/entity/consumables_entity.dart';
import '../../../../employee/requests/entities/attachment_entity.dart';
import '../../../../employee/requests/entities/message_entity.dart';
import '../../../../employee/requests/entities/request_entity.dart';
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
  late List<RequestEntity> requestedProducts;

  bool loading = true;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadEmployeeProducts();
  }

  loadEmployeeProducts([String? userId]) async {
    await Future.delayed(const Duration(seconds: 2));
    requestedProducts = [
      RequestEntity(
        requestId: '001',
        requestType: ProductType.asset,
        status: RequestStatus.waiting,
        requestDate: DateTime.now(),
        dateReturn: DateTime.now(),
        expectedRecieved: DateTime.now(),
        priority: 'Urgent',
        quantity: 2,
        assetsEntity: AssetsEntity(
          assetName: 'Dell GZ 15',
          category: 'Electronics',
          subcategory: 'Computer',
          model: 'GZ 15',
          dateReceived: DateTime.now(),
          quantity: '2',
          status: 'InUse',
          brand: 'Dell',
        ),
        approvalCycles: ApproveCycle.approvalCycles,
      )..inquiryMessages = [
          MessageEntity(
            userEntity: ApproveCycle.approvalCycles[1],
            message: 'Hi',
          ),
          MessageEntity(
            userEntity: ApproveCycle.approvalCycles[1],
            message:
                'Please Send me an attachment of all the designs made by UI/UX Designers as soon as possible .',
          ),
        ],
      RequestEntity(
        requestId: '002',
        requestType: ProductType.asset,
        status: RequestStatus.approved,
        requestDate: DateTime.now(),
        dateReturn: DateTime.now(),
        expectedRecieved: DateTime.now(),
        priority: 'Urgent',
        quantity: 2,
        assetsEntity: AssetsEntity(
          assetName: 'Dell GZ 15',
          category: 'Electronics',
          subcategory: 'Computer',
          model: 'GZ 15',
          dateReceived: DateTime.now(),
          quantity: '2',
          status: 'InUse',
          brand: 'Dell',
        ),
        approvalCycles: ApproveCycle.approvalCycles,
      ),
      RequestEntity(
        requestId: '002',
        requestType: ProductType.asset,
        status: RequestStatus.cancelled,
        requestDate: DateTime.now(),
        dateReturn: DateTime.now(),
        reasonsOfCanccellation:
            'Lorem Ipsum Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum',
        expectedRecieved: DateTime.now(),
        priority: 'Urgent',
        quantity: 2,
        assetsEntity: AssetsEntity(
          assetName: 'Dell GZ 15',
          category: 'Electronics',
          subcategory: 'Computer',
          model: 'GZ 15',
          dateReceived: DateTime.now(),
          quantity: '2',
          status: 'InUse',
          brand: 'Dell',
        ),
        approvalCycles: ApproveCycle.approvalCycles,
      ),
      RequestEntity(
        requestId: '0016',
        requestType: ProductType.consumable,
        status: RequestStatus.pending,
        requestDate: DateTime.now(),
        dateReturn: DateTime.now(),
        expectedRecieved: DateTime.now(),
        priority: 'Urgent',
        quantity: 2,
        consumablesEntity: ConsumablesEntity(
          consumableId: 'C0023',
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
        approvalCycles: ApproveCycle.approvalCycles,
      )..inquiryMessages = [
          MessageEntity(
            userEntity: ApproveCycle.approvalCycles[1],
            message: 'Hi',
          ),
          MessageEntity(
            userEntity: ApproveCycle.approvalCycles[1],
            message:
                'Please Send me an attachment of all the designs made by UI/UX Designers as soon as possible .',
          ),
        ],
    ];
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
      ),
      AssignedUserProductsEntity(
        assigneDate: DateTime.now(),
        returnDate: DateTime.now(),
        lastUpdate: DateTime.now(),
        quantityAssigned: 2,
        //dummy
        productentity: ProductEntity(
            id: '008',
            status: 'Requested',
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
      ),
      AssignedUserProductsEntity(
        assigneDate: DateTime.now(),
        returnDate: DateTime.now(),
        lastUpdate: DateTime.now(),
        quantityAssigned: 2,
        //dummy
        productentity: ProductEntity(
            id: '008',
            status: 'Requested',
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
      ),
      AssignedUserProductsEntity(
        assigneDate: DateTime.now(),
        returnDate: DateTime.now(),
        lastUpdate: DateTime.now(),
        quantityAssigned: 2,
        //dummy
        productentity: ProductEntity(
            id: '008',
            status: 'Requested',
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
      ),
    ];

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

  ///Returns the current products list based on Product Status (Inuse,Maintenance,etc..)
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

  /// Called In Requests Tab
  List<RequestEntity> getRequestNumbers(RequestStatus status) {
    if (status == RequestStatus.approved) {
      return getApprovedRequestsNumbers();
    }
    if (status == RequestStatus.pending) {
      return getPendingRequestsNumbers();
    }
    if (status == RequestStatus.rejected) {
      return getRejectedRequestsNumbers();
    }
    //Canceled
    return getCanceledNumbers();
  }

  List<RequestEntity> getPendingRequestsNumbers() {
    return requestedProducts
        .where((e) => e.status == RequestStatus.pending)
        .toList();
  }

  List<RequestEntity> getApprovedRequestsNumbers() {
    return requestedProducts
        .where((e) => e.status == RequestStatus.approved)
        .toList();
  }

  List<RequestEntity> getCanceledNumbers() {
    return requestedProducts
        .where((e) => e.status == RequestStatus.cancelled)
        .toList();
  }

  List<RequestEntity> getRejectedRequestsNumbers() {
    return requestedProducts
        .where((e) => e.status == RequestStatus.rejected)
        .toList();
  }

  //---------Track Request Tab----------------
  final scrollController = ScrollController();
}
