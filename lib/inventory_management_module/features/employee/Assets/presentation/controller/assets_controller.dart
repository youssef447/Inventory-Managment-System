// Date: 7/11/2024
// By:Mohamed Ashraf

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/helpers/date_time_helper.dart';
import '../../domain/entity/assets_entity.dart';
import '../ui/constants/assets_id_constant.dart';

class AssetsController extends GetxController {
// list for item of table assets
  List<AssetsEntity> assetsList = [];
  bool loading = true;

  @override
  void onInit() {
    super.onInit();
    loadAssetsData();
  }

  // Controllers for TextFormFields to bind with UI
  TextEditingController assetIdController = TextEditingController();
  TextEditingController assetNameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController subcategoryController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController dateReceivedController = TextEditingController();
  TextEditingController dateReturnController = TextEditingController();
  TextEditingController maintenanceFrequencyController =
      TextEditingController();
  TextEditingController nextMaintenanceScheduleController =
      TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController statusController = TextEditingController();

// show dummy data for test ui ------ will be removed --------
  Future<void> loadAssetsData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    assetsList = [
      AssetsEntity(
        assetId: 'A101',
        assetName: 'Laptop',
        category: 'Electronics',
        subcategory: 'Computers',
        model: 'GZ 15',
        brand: 'dell',
        dateReceived: DateTime(2024, 1, 10, 9, 0),
        dateReturn: DateTime(2023, 1, 10, 9, 0),
        quantity: '700',
        maintenanceFrequency: 'Monthly',
        nextMaintenanceSchedule: DateTime(2024, 1, 10, 9, 0),
        expirationDate: DateTime(2024, 1, 10, 9, 0),
        status: 'Maintenance'.tr,
      ),
      AssetsEntity(
          assetId: 'A102',
          assetName: 'Laptop',
          category: 'Electronics',
          subcategory: 'Computers',
          availabilityStatus: 'Out Stock',
          model: 'GZ 15',
          brand: 'dell',
          dateReceived: DateTime(2023, 1, 10, 9, 0),
          dateReturn: DateTime(2023, 1, 10, 9, 0),
          quantity: '50',
          requiresApprovals: false,
          maintenanceFrequency: 'Monthly',
          nextMaintenanceSchedule: null,
          expirationDate: DateTime(2023, 1, 10, 9, 0),
          status: 'Returned'.tr),
      AssetsEntity(
          assetId: 'A103',
          assetName: 'Laptop',
          category: 'Electronics',
          subcategory: 'Computers',
          model: 'HY-15',
          brand: 'dell',
          dateReceived: DateTime(2023, 1, 10, 9, 0),
          dateReturn: null,
          quantity: '5',
          maintenanceFrequency: 'Monthly',
          nextMaintenanceSchedule: DateTime(2023, 1, 10, 9, 0),
          expirationDate: null,
          status: 'InUse'.tr),
      AssetsEntity(
        assetId: 'A103',
        assetName: 'Laptop',
        category: 'Electronics',
        subcategory: 'Computers',
        model: 'HY-15',
        brand: 'dell',
        dateReceived: DateTime(2023, 1, 10, 9, 0),
        dateReturn: null,
        quantity: '5',
        maintenanceFrequency: 'Monthly',
        nextMaintenanceSchedule: DateTime(2023, 1, 10, 9, 0),
        expirationDate: null,
        status: 'InUse'.tr,
      ),
      AssetsEntity(
        assetId: 'A103',
        assetName: 'Laptop',
        category: 'Electronics',
        subcategory: 'Computers',
        model: 'HY-15',
        brand: 'dell',
        dateReceived: DateTime(2023, 1, 10, 9, 0),
        dateReturn: null,
        quantity: '5',
        maintenanceFrequency: 'Monthly',
        nextMaintenanceSchedule: DateTime(2023, 1, 10, 9, 0),
        expirationDate: null,
        status: 'Returned'.tr,
      ),

      // Add more assets as needed
    ];
    loading = false;
    update([AssetsIdConstant.assetsData]);
  }

  //called when user goes to details of assets
  setAssetsDetails(AssetsEntity model) {
    assetIdController.text = model.assetId;
    assetNameController.text = model.assetName;
    categoryController.text = model.category;
    subcategoryController.text = model.subcategory;
    modelController.text = model.model;
    brandController.text = model.brand;
    quantityController.text = model.quantity;
    dateReceivedController.text = DateTimeHelper.formatDate(model.dateReceived);
    dateReturnController.text = model.dateReturn != null
        ? DateTimeHelper.formatDate(
            model.dateReturn!,
          )
        : 'Not Applicable'.tr;
    maintenanceFrequencyController.text = model.maintenanceFrequency ?? '';
    nextMaintenanceScheduleController.text =
        model.nextMaintenanceSchedule != null
            ? DateTimeHelper.formatDate(
                model.nextMaintenanceSchedule!,
              )
            : 'Not Applicable'.tr;
    expirationDateController.text = model.expirationDate != null
        ? DateTimeHelper.formatDate(
            model.expirationDate!,
          )
        : 'Not Applicable'.tr;
    statusController.text = model.status;
  }

  //reset data of controller
  resetAssetsDetails() {
    assetIdController.clear();
    assetNameController.clear();
    categoryController.clear();
    subcategoryController.clear();
    modelController.clear();
    brandController.clear();
    quantityController.clear();
    dateReceivedController.clear();
    dateReturnController.clear();
    maintenanceFrequencyController.clear();
    dateReturnController.clear();
    expirationDateController.clear();
    statusController.clear();
  }
}
