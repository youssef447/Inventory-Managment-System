// Date: 7/11/2024
// By:Mohamed Ashraf

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/helpers/date_time_helper.dart';
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
        dateReceived: DateTime(2023, 1, 10, 9, 0),
        dateReturn: DateTime(2023, 1, 10, 9, 0),
        quantity: '9',
        maintenanceFrequency: 'Monthly',
        nextMaintenanceSchedule: null,
        expirationDate: DateTime(2023, 1, 10, 9, 0),
        status: 'Maintenance',
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
          dateReturn: null,
          quantity: '10',
          maintenanceFrequency: null,
          nextMaintenanceSchedule: null,
          expirationDate: null,
          status: 'Returned'),
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
          expirationDate: DateTime(2023, 1, 10, 9, 0),
          status: 'InUse'),
      // Add more assets as needed
    ];
    if (assetsList.isNotEmpty) {
      final asset = assetsList[0]; // Using the first asset as an example
      assetIdController.text = asset.assetId;
      assetNameController.text = asset.assetName;
      categoryController.text = asset.category;
      subcategoryController.text = asset.subcategory;
      modelController.text = asset.model;
      brandController.text = asset.brand;
      quantityController.text = asset.quantity;
      dateReceivedController.text =
          DateTimeHelper.formatDate(asset.dateReceived);
      dateReturnController.text = DateTimeHelper.formatDate(asset.dateReturn!);
      maintenanceFrequencyController.text = asset.maintenanceFrequency ?? '';
      nextMaintenanceScheduleController.text =
          asset.nextMaintenanceSchedule?.toString() ?? '';
      expirationDateController.text = asset.expirationDate?.toString() ?? '';
      statusController.text = asset.status;
    }
    loading = false;
    update([AssetsIdConstant.assetsData]);
  }
}
