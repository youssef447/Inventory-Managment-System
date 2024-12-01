// by : Mohamed Ashraf

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/approve_cycle.dart';
import '../../../../../core/enums/requests_enums.dart';
import '../../../../employee/Assets/domain/entity/assets_entity.dart';
import '../../../../employee/consumables/domain/entity/consumables_entity.dart';
import '../../../../employee/requests/entities/message_entity.dart';
import '../../../../employee/requests/entities/request_entity.dart';
import '../../../../products/enums/product_enums.dart';
import '../ui/constants/approval_id_constant.dart';

class AdminApprovalController extends GetxController{

  RxInt currentCategoryIndex = 0.obs;
  ///updates category filter row index to filter table
  updateCategoryIndex(int index) {
    currentCategoryIndex.value = index;
  }

  bool loading = true;
   List<RequestEntity> requestedProducts = [];

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
        requestId: '002',
        requestType: ProductType.asset,
        status: RequestStatus.retrieved,
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
        requestId: '002',
        requestType: ProductType.asset,
        status: RequestStatus.rejected,
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
          unitOfMeasurement: UnitOfMeasurement.gram,
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
    loading = false;
    update([ApprovalAdminIdConstant.approval,]);
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

  List<RequestEntity> getRetrievedRequestsNumbers() {
    return requestedProducts
        .where((e) => e.status == RequestStatus.retrieved)
        .toList();
  }

  //---------Track Request Tab----------------

  get searchController => null;

  bool gridViewSelect = true;
  bool listViewSelect = false;

  selectGridView() {
    gridViewSelect = true;
    listViewSelect = false;
    update([
      ApprovalAdminIdConstant.changeListview,
    ]);
  }

  selectListView() {
    listViewSelect = true;
    gridViewSelect = false;
    update([
      ApprovalAdminIdConstant.changeListview,
    ]);
  }
}