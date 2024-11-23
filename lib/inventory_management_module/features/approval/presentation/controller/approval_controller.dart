// by : Mohamed Ashraf
//dater : 11/11/2024
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/enums/requests_enums.dart';
import '../../../../core/helpers/date_time_helper.dart';
import '../../domain/approval_entity.dart';
import '../ui/constants/approval_id_constant.dart';

class ApprovalController extends GetxController {
  RxInt currentCategoryIndex = 0.obs;

  /// drop down
  List<RequestPriorityTypes> priorities = [
    RequestPriorityTypes.urgent,
    RequestPriorityTypes.high,
    RequestPriorityTypes.medium,
    RequestPriorityTypes.low,
  ];
  Rxn<RequestPriorityTypes> priorityValue = Rxn<RequestPriorityTypes>();
  updatePriority(RequestPriorityTypes value) {
    priorityValue.value = value;
  }

  ///updates category filter row index to filter table
  updateCategoryIndex(int index) {
    currentCategoryIndex.value = index;
  }

  // list for item of table assets
  List<ApprovalEntity> allApprovalList = [];
  List<ApprovalEntity> approvedList = [];
  List<ApprovalEntity> rejectedList = [];
  List<ApprovalEntity> canceledList = [];
  bool loading = true;
  bool gridViewSelect = true;
  bool listViewSelect = false;

  selectGridView() {
    gridViewSelect = true;
    listViewSelect = false;
    update([
      ApprovalIdConstant.approval,
    ]);
  }

  selectListView() {
    listViewSelect = true;
    gridViewSelect = false;
    update([
      ApprovalIdConstant.approval,
    ]);
  }

  @override
  void onInit() {
    super.onInit();
    loadAssetsData();
  }

  // Controllers for search
  TextEditingController searchController = TextEditingController();
  // Controllers for TextFormFields to bind with UI
  TextEditingController approvalIdController = TextEditingController();
  TextEditingController approvalNameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController subcategoryController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController availabilityController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController expectedDeliveryDateController =
      TextEditingController();
  TextEditingController expectedReturnDateController = TextEditingController();
  TextEditingController additionalNoteController = TextEditingController();

// show dummy data for test ui ------ will be removed --------
  Future<void> loadAssetsData() async {
    await Future.delayed(const Duration(seconds: 1));
    // Define all dummy data
    List<ApprovalEntity> allApprovals = [
      ApprovalEntity(
        approvalId: '001',
        userName: 'Alice Johnson',
        requestDate: DateTime.now(),
        requestType: 'Asset Request',
        assetName: 'Laptop',
        category: 'Electronics',
        subcategory: 'Computers',
        model: 'Dell 13',
        brand: 'Dell',
        quantity: 11111,
        availability: 3,
        priority: 'High',
        expectedDelivery: DateTime.now().add(const Duration(days: 5)),
        expectedReturn: DateTime.now().add(const Duration(days: 30)),
        status: 'Approved',
      ),
      ApprovalEntity(
        approvalId: '002',
        userName: 'Bob Smith',
        requestDate: DateTime.now().subtract(const Duration(days: 2)),
        requestType: 'Asset Request',
        assetName: 'Projector',
        category: 'Office',
        subcategory: 'Audiovisual',
        model: 'EB-S41',
        brand: 'Epson',
        quantity: 2222,
        availability: 1,
        priority: 'Medium',
        expectedDelivery: DateTime.now().add(const Duration(days: 3)),
        expectedReturn: DateTime.now().add(const Duration(days: 15)),
        status: 'Rejected',
      ),
      ApprovalEntity(
        approvalId: '003',
        userName: 'Diana Prince',
        requestDate: DateTime.now(),
        requestType: 'Assets Request',
        assetName: 'Tablet',
        category: 'Electronics',
        subcategory: 'Mobile Devices',
        model: 'Galaxy Tab S7',
        brand: 'Samsung',
        quantity: 444444,
        availability: 10,
        priority: 'High',
        expectedDelivery: DateTime.now().add(const Duration(days: 7)),
        expectedReturn: DateTime.now().add(const Duration(days: 30)),
        status: 'Approved',
      ),
      ApprovalEntity(
        approvalId: '004',
        userName: 'Diana Prince',
        requestDate: DateTime.now(),
        requestType: 'Asset Request',
        assetName: 'Tablet',
        category: 'Electronics',
        subcategory: 'Mobile Devices',
        model: 'Galaxy Tab S7',
        brand: 'Samsung',
        quantity: 444444,
        availability: 10,
        priority: 'High',
        expectedDelivery: DateTime.now().add(const Duration(days: 7)),
        expectedReturn: DateTime.now().add(const Duration(days: 30)),
        status: 'Approved',
      ),
      ApprovalEntity(
        approvalId: '005',
        userName: 'Diana Prince',
        requestDate: DateTime.now(),
        requestType: 'Assets Request',
        assetName: 'Tablet',
        category: 'Electronics',
        subcategory: 'Mobile Devices',
        model: 'Galaxy Tab S7',
        brand: 'Samsung',
        quantity: 444444,
        availability: 10,
        priority: 'High',
        expectedDelivery: DateTime.now().add(const Duration(days: 7)),
        expectedReturn: DateTime.now().add(const Duration(days: 30)),
        status: 'Rejected',
      ),
      ApprovalEntity(
        approvalId: '006',
        userName: 'Diana Prince',
        requestDate: DateTime.now(),
        requestType: 'Assets Request',
        assetName: 'Tablet',
        category: 'Electronics',
        subcategory: 'Mobile Devices',
        model: 'Galaxy Tab S7',
        brand: 'Samsung',
        quantity: 444444,
        availability: 10,
        priority: 'High',
        expectedDelivery: DateTime.now().add(const Duration(days: 7)),
        expectedReturn: DateTime.now().add(const Duration(days: 30)),
        status: 'Canceled',
      ),
      ApprovalEntity(
        approvalId: '007',
        userName: 'Diana Prince',
        requestDate: DateTime.now(),
        requestType: 'Assets Request',
        assetName: 'Tablet',
        category: 'Electronics',
        subcategory: 'Mobile Devices',
        model: 'Galaxy Tab S7',
        brand: 'Samsung',
        quantity: 444444,
        availability: 10,
        priority: 'High',
        expectedDelivery: DateTime.now().add(const Duration(days: 7)),
        expectedReturn: DateTime.now().add(const Duration(days: 30)),
        status: 'Canceled',
      ),
    ];

    allApprovalList = List.from(allApprovals);
    approvedList = allApprovals
        .where((approval) => approval.status == 'Approved')
        .toList();
    rejectedList = allApprovals
        .where((approval) => approval.status == 'Rejected')
        .toList();
    canceledList = allApprovals
        .where((approval) => approval.status == 'Canceled')
        .toList();
    loading = false;
    update([ApprovalIdConstant.approval]);
  }

  // Method to change the status of an item
  void changeApprovalStatusById(
      String approvalId, String newStatus, BuildContext context) {
    final approvals = allApprovalList
        .where((approval) => approval.approvalId == approvalId)
        .toList();
    for (var approval in approvals) {
      approval.status = newStatus;
    }

    approvedList = allApprovalList
        .where((approval) => approval.status == 'Approved')
        .toList();
    rejectedList = allApprovalList
        .where((approval) => approval.status == 'Rejected')
        .toList();
    canceledList = allApprovalList
        .where((approval) => approval.status == 'Canceled')
        .toList();

    update([ApprovalIdConstant.approval]);
  }

  //called when user goes to details of approvals
  setApprovalDetails(ApprovalEntity model) {
    approvalIdController.text = model.approvalId;
    approvalNameController.text = model.assetName;
    categoryController.text = model.category;
    subcategoryController.text = model.subcategory;
    modelController.text = model.model;
    brandController.text = model.brand;
    quantityController.text = model.quantity.toString();
    availabilityController.text = model.availability.toString();
    priorityController.text = model.priority;
    expectedDeliveryDateController.text = DateTimeHelper.formatDate(
      model.expectedDelivery,
    );
    expectedReturnDateController.text = DateTimeHelper.formatDate(
      model.expectedReturn,
    );
    additionalNoteController.text = model.additionalNote.toString();
  }

  //reset data of controller
  resetApprovalDetails() {
    approvalIdController.clear();
    approvalNameController.clear();
    categoryController.clear();
    subcategoryController.clear();
    modelController.clear();
    brandController.clear();
    quantityController.clear();
    availabilityController.clear();
    priorityController.clear();
    expectedDeliveryDateController.clear();
    expectedReturnDateController.clear();
    additionalNoteController.clear();
  }
}
