// by : Mohamed Ashraf
//dater : 11/11/2024
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/helpers/date_time_helper.dart';
import '../../domain/approval_entity.dart';
import '../ui/constants/approval_id_constant.dart';

class ApprovalController extends GetxController {
  RxInt currentCategoryIndex = 0.obs;

  ///updates category filter row index to filter table
  updateCategoryIndex(int index) {
    currentCategoryIndex.value = index;
  }

  // list for item of table assets
  List<ApprovalEntity> approvalList = [];
  bool loading = true;
  bool gridViewSelect = true;
  bool listViewSelect = false;

selectGridView(){
   gridViewSelect = true;
   listViewSelect = false;
   update([ApprovalIdConstant.approval,]);
 }
 selectListView(){
   listViewSelect =true;
   gridViewSelect = false;
   update([ApprovalIdConstant.approval,]);
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
    await Future.delayed(
      const Duration(seconds: 1),
    );
    approvalList = [
     ApprovalEntity(
    approvalId: '001',
    userName: 'Alice Johnson',
    requestDate: DateTime.now(),
    requestType: 'Purchase ',
    assetName: 'Laptop',
    category: 'Electronics',
    subcategory: 'Computers',
    model: 'Dell 13',
    brand: 'Dell',
    quantity: 1,
    availability: 3,
    priority: 'High',
    expectedDelivery: DateTime.now().add(const Duration(days: 5)), // 5 days from now
    expectedReturn: DateTime.now().add(const Duration(days: 30)), // 1 month from now
    status: 'Approved',
    ),
    ApprovalEntity(
    approvalId: '002',
    userName: 'Bob Smith',
    requestDate: DateTime.now().subtract(const Duration(days: 2)), // 2 days ago
    requestType: 'Maintenance',
    assetName: 'Projector',
    category: 'Office ',
    subcategory: 'Audiovisual',
    model: 'EB-S41',
    brand: 'Epson',
    quantity: 1,
    availability: 1,
    priority: 'Medium',
    expectedDelivery: DateTime.now().add(const Duration(days: 3)), // 3 days from now
    expectedReturn: DateTime.now().add(const Duration(days: 15)), // 15 days from now
    status: 'Rejected',
    ),ApprovalEntity(
    approvalId: '003',
    userName: 'Charlie Brown',
    requestDate: DateTime.now(),
    requestType: 'Replacement',
    assetName: 'Monitor',
    category: 'Electronics',
    subcategory: 'Displays',
    model: 'G5',
    brand: 'Samsung',
    quantity: 2,
    availability: 0,
    priority: 'Low',
    expectedDelivery: DateTime.now().add(const Duration(days: 10)), // 10 days from now
    expectedReturn: DateTime.now().add(const Duration(days: 40)), // 40 days from now
    status: 'Rejected',
    ),
      ApprovalEntity(
        approvalId: '003',
        userName: 'Charlie Brown',
        requestDate: DateTime.now(),
        requestType: 'Replacement',
        assetName: 'Monitor',
        category: 'Electronics',
        subcategory: 'Displays',
        model: ' G5',
        brand: 'Samsung',
        quantity: 2,
        availability: 0,
        priority: 'Low',
        expectedDelivery: DateTime.now().add(const Duration(days: 10)), // 10 days from now
        expectedReturn: DateTime.now().add(const Duration(days: 40)), // 40 days from now
        status: 'Canceled',
      )

    // Add more approvals as needed
    ];
    loading = false;
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
