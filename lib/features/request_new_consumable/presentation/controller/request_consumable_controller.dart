import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/constants/approve_cycle.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../core/enums/requests_enums.dart';
import '../../../consumables/domain/entity/consumables_entity.dart';

import '../../../consumables/presentation/controller/consumables_controller.dart';
import '../../../requests/entities/attachment_entity.dart';
import '../../../requests/entities/request_entity.dart';
import '../../constants/ids_constants.dart';
import 'package:file_picker/file_picker.dart';

//Youssef Ashraf
//Date: 7/11/2024
///Where all logic in Request New consumable Page is handled (request,repair,maintenance, return)
class RequestConsumableController extends GetxController {
  List<ConsumablesEntity> consumables = [];
  List<RequestEntity> requests = [];
  bool loading = true;
  late RequestActions requestAction;
  @override
  void onInit() {
    super.onInit();
    requestAction = Get.arguments['action'] as RequestActions;
    loadconsumablesData();
  }

  RxInt currentCategoryIndex = 0.obs;
  updateCategoryIndex(int index) {
    currentCategoryIndex.value = index;
  }

  ///Loading consumables Data to repair,maintenance,return
  Future<void> loadconsumablesData() async {
    Get.find<ConsumablesController>().loadConsumablesData().then((_) {
      consumables = Get.find<ConsumablesController>().consumablesList;
      loading = false;
      update([RequestConsumablesIds.requestConsumablePage]);
    });
  }

  //------------Search Filter ------------
  TextEditingController searchController = TextEditingController();
  //------------Request Uploaded Attachments ------------
  List<AttachmentEntity> attachments = [];
  uploadAttachments() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (result != null) {
      attachments.addAll(result.files.map((e) {
        String fileName = File(e.path!).path.split('/').last;
        String extension = fileName.split('.').last;
        double totalSize = File(e.path!).lengthSync() / (1024 * 1024);

        return AttachmentEntity(
            file: File(e.path!),
            fileName: fileName,
            extension: extension,
            totalSize: totalSize);
      }).toList());
      update([RequestConsumablesIds.attachments]);
    }
  }

  removeAttachment(AttachmentEntity model) {
    final index =
        attachments.indexWhere((element) => element.fileName == model.fileName);

    attachments.removeAt(index);
    update([RequestConsumablesIds.attachments]);
  }

  submitForApproval(ConsumablesEntity entity) {
    RequestEntity(
      requestId: '001',
      requestType: requestAction.getName,
      requestDate: DateTime.now(),
      priority: priorityController.text,
      consumablesEntity: entity,
      expectedRecieved: DateTime.parse(
        expectedDeliveryController.text,
      ),
      dateReturn: DateTime.parse(
        expectedReturnController.text,
      ),
      quantity: int.parse(quantityController.text),
      status: 'Pending',
      approvalCycles: ApproveCycle.approvalCycles,
    );
  }

  //------------New Request Logic ------------
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

  late TextEditingController reqIdController = TextEditingController();
  late TextEditingController consumableNameController = TextEditingController();
  late TextEditingController categoryController = TextEditingController();
  late TextEditingController subCategoryController = TextEditingController();
  late TextEditingController consumableModelController =
      TextEditingController();
  late TextEditingController brandController = TextEditingController();
  late TextEditingController availabilityController = TextEditingController();
  late TextEditingController quantityController = TextEditingController();
  late TextEditingController stockRemainingController = TextEditingController();
  late TextEditingController priorityController = TextEditingController();
  late TextEditingController additionalNotesController =
      TextEditingController();
  //request consumable
  late TextEditingController expectedDeliveryController =
      TextEditingController();
  late TextEditingController expectedReturnController = TextEditingController();
  //routine maintenance

  //return consumable
  late TextEditingController returnDateController = TextEditingController();
  //repair consumable
  late TextEditingController pickUpDateController = TextEditingController();
  List<IssueTypes> issueTypes = [
    IssueTypes.mechanical,
    IssueTypes.electrical,
    IssueTypes.performance,
    IssueTypes.safety,
    IssueTypes.software,
  ];
  Rxn<IssueTypes> issueTypeValue = Rxn<IssueTypes>();
  updateIssueType(IssueTypes value) {
    issueTypeValue.value = value;
  }

  ///called when exit new request form
  resetResources() {
    reqIdController.clear();
    consumableNameController.clear();
    categoryController.clear();
    subCategoryController.clear();
    consumableModelController.clear();
    brandController.clear();
    availabilityController.clear();
    quantityController.clear();
    priorityController.clear();
    expectedDeliveryController.clear();
    expectedReturnController.clear();
    additionalNotesController.clear();
    pickUpDateController.clear();
    stockRemainingController.clear();
    priorityValue.value = null;
    issueTypeValue.value = null;
    attachments = [];
  }

  ///called when user goes to new request form
  setResources(ConsumablesEntity model) {
    reqIdController.text = '001';
    consumableNameController.text = model.name;
    categoryController.text = model.category;
    subCategoryController.text = model.subcategory;
    consumableModelController.text = model.model;
    brandController.text = model.brand;
    stockRemainingController.text = model.stockRemaining.toString();
    availabilityController.text = model.availableQuantity.toString();
    quantityController.text = model.quantity;
  }
}
