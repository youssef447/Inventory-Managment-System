import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/features/requests/presentation/controller/requests_controller.dart';

import '../../../../core/enums/requests_enums.dart';
import '../../../Assets/domain/entity/assets_entity.dart';
import '../../../Assets/presentation/controller/assets_controller.dart';
import '../../../requests/entities/attachment_entity.dart';
import '../../../requests/entities/request_entity.dart';
import '../../constants/ids_constants.dart';
import 'package:file_picker/file_picker.dart';

//Youssef Ashraf
//Date: 7/11/2024
///Where all logic in Request Asset Page is handled
class RequestAssetsController extends GetxController {
  List<AssetsEntity> assets = [];
  List<RequestEntity> requests = [];
  bool loading = true;
  late RequestActions requestAction;
  @override
  void onInit() {
    super.onInit();
    requestAction = Get.arguments['action'] as RequestActions;

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

  ///Loading Request . only when action is request asset
  Future<void> loadRequestsData() async {
    Get.find<RequestsController>().loadRequestsData().then((_) {
      loading = false;
      update([RequestAssetsIds.requestAssetsPage]);
    });
  }

  //------------Search Filter ------------
  TextEditingController searchController = TextEditingController();
  //------------Request Attachments ------------
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

  //------------New Request Logic ------------
  TextEditingController reqIdController = TextEditingController();
  TextEditingController assetNameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController subCategoryController = TextEditingController();
  TextEditingController assetModelController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController availabilityController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController expectedDeliveryController = TextEditingController();
  TextEditingController expectedReturnController = TextEditingController();
  TextEditingController additionalNotesController = TextEditingController();
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
    priorityValue.value = null;
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
