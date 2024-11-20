import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/constants/approve_cycle.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../core/enums/requests_enums.dart';
import '../../../../core/routes/route_arguments.dart';
import '../../../Assets/domain/entity/assets_entity.dart';
import '../../../Assets/presentation/controller/assets_controller.dart';
import '../../../requests/entities/attachment_entity.dart';
import '../../../requests/entities/request_entity.dart';
import '../../constants/ids_constants.dart';
import 'package:file_picker/file_picker.dart';

//Youssef Ashraf
//Date: 7/11/2024
///Where all logic in Request New Asset Page is handled (request,repair,maintenance, return)
class RequestAssetsController extends GetxController {
  List<AssetsEntity> assets = [];
  bool loading = true;
  late RequestActions requestAction;
  @override
  void onInit() {
    super.onInit();
    requestAction =
        Get.arguments[RouteArguments.requestAction] as RequestActions;
    loadAssetsData();
  }

  RxInt currentCategoryIndex = 0.obs;
  updateCategoryIndex(int index) {
    currentCategoryIndex.value = index;
  }

  ///Loading Assets Data to repair,maintenance,return
  Future<void> loadAssetsData() async {
    Get.find<AssetsController>().loadAssetsData().then((_) {
      assets = Get.find<AssetsController>().assetsList;
      loading = false;
      update([RequestAssetsIds.requestAssetsPage]);
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
      update([RequestAssetsIds.attachments]);
    }
  }

  removeAttachment(AttachmentEntity model) {
    final index =
        attachments.indexWhere((element) => element.fileName == model.fileName);

    attachments.removeAt(index);
    update([RequestAssetsIds.attachments]);
  }

  submitForApproval(AssetsEntity assetModel) {
    RequestEntity(
      requestId: '001',
      requestType: requestAction.getName,
      requestDate: DateTime.now(),
      priority: priorityController.text,
      assetsEntity: assetModel,
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
  late TextEditingController assetNameController = TextEditingController();
  late TextEditingController categoryController = TextEditingController();
  late TextEditingController subCategoryController = TextEditingController();
  late TextEditingController assetModelController = TextEditingController();
  late TextEditingController brandController = TextEditingController();
  late TextEditingController availabilityController = TextEditingController();
  late TextEditingController quantityController = TextEditingController();
  late TextEditingController priorityController = TextEditingController();
  late TextEditingController additionalNotesController =
      TextEditingController();
  //request asset
  late TextEditingController expectedDeliveryController =
      TextEditingController();
  late TextEditingController expectedReturnController = TextEditingController();
  //routine maintenance
  late TextEditingController maintenanceDateController =
      TextEditingController();
  //return asset
  late TextEditingController returnDateController = TextEditingController();
  //repair asset
  late TextEditingController repairDateController = TextEditingController();
  Rxn<IssueTypes> issueTypeValue = Rxn<IssueTypes>();
  updateIssueType(IssueTypes value) {
    issueTypeValue.value = value;
  }

  ///called when exit new request form
  resetResources() {
    reqIdController.clear();
    assetNameController.clear();
    categoryController.clear();
    subCategoryController.clear();
    assetModelController.clear();
    brandController.clear();
    availabilityController.clear();
    quantityController.clear();
    priorityController.clear();
    expectedDeliveryController.clear();
    expectedReturnController.clear();
    additionalNotesController.clear();
    repairDateController.clear();
    priorityValue.value = null;
    issueTypeValue.value = null;
    attachments = [];
  }

  ///called when user goes to new request form
  setResources(AssetsEntity model) {
    reqIdController.text = '001';
    assetNameController.text = model.assetName;
    categoryController.text = model.category;
    subCategoryController.text = model.subcategory;
    assetModelController.text = model.model;
    brandController.text = model.brand;
    availabilityController.text = model.availableQuantity.toString();
    quantityController.text = model.quantity;
  }
}
