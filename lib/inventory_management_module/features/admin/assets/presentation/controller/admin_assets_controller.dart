// Date: 25/11/2024
// By:Mohamed Ashraf

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../employee/Assets/domain/entity/assets_entity.dart';
import '../../../../employee/requests/entities/attachment_entity.dart';
import '../../../../products/domain/assigned_user_products_entity.dart';
import '../../../../products/domain/product_entity.dart';
import '../../../../products/domain/subEntities/contract_details_entity.dart';

import '../../../../products/enums/product_enums.dart';
import '../../../storage/domain/storage_location_entity.dart';
import '../../../suppliers/domain/supplier_entity.dart';
import '../../domin/maintenance_entity.dart';
import '../../domin/service_entity.dart';

class AdminAssetsController extends GetxController {
  final searchDetailsController = TextEditingController();
  final assignServiceHistoryFilters = ['Assigned', 'Service History'];
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

  //------------- TextEditingController for ServiceHistory
  TextEditingController issueTypeController = TextEditingController();
  TextEditingController requestRepairDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController maintenanceIDController = TextEditingController();
  TextEditingController maintenanceStartDateController = TextEditingController();
  TextEditingController maintenanceEndDateController = TextEditingController();
  TextEditingController nextScheduledMaintenanceController = TextEditingController();
  TextEditingController serviceProviderController = TextEditingController();
  TextEditingController serviceProviderFirstNameController = TextEditingController();
  TextEditingController serviceProviderLastNameController = TextEditingController();
  TextEditingController descriptionOrIssueReportedController = TextEditingController();
  TextEditingController wasAPartReplacedController = TextEditingController();
  TextEditingController warrantyCoverageController = TextEditingController();
  TextEditingController warrantyExpirationDateController = TextEditingController();
  TextEditingController dateOfApprovalController = TextEditingController();

  //dummy in stock data (get by id from backend)
  final List<ServiceEntity> dummyServiceHistory = [
    ServiceEntity(
      requestRepairDate:  DateTime.now(),
      returnDate:  DateTime.now(),
      lastUpdate:  DateTime.now(),
      issueType: 'Mechanical',
      status: 'Pending',
       maintenanceEntity:  MaintenanceEntity(
           maintenanceStartDate: DateTime.now(),
       maintenanceEndDate: DateTime.now(),
        nextScheduledMaintenance : DateTime.now(),
        requestedMaintenance : DateTime.now(),
         maintenanceSchedule : DateTime.now(),
       )
    ),
  ];


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
    ),
  ];
}
