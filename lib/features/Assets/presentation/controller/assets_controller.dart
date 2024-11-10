
// Date: 7/11/2024
// By:Mohamed Ashraf

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/enums.dart';
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
  TextEditingController maintenanceFrequencyController = TextEditingController();
  TextEditingController nextMaintenanceScheduleController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController statusController = TextEditingController();
// show dummy data for test ui ------ will be removed --------
  Future<void> loadAssetsData() async{
    Future.delayed(
      const Duration(seconds: 2),
    ).then((_) {
      assetsList = [
        AssetsEntity(
          assetId: assetIdController.text.isNotEmpty
              ? assetIdController.text
              : 'ytr3',
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
          expirationDate:DateTime(2023, 1, 10, 9, 0),
          status: Status.maintenance,
        ),
        AssetsEntity(
            assetId:  assetIdController.text.isNotEmpty
                ? assetIdController.text
                : 'A10222',
            assetName: 'Laptop',
            category: 'Electronics',
            subcategory: 'Computers',
            model: 'GZ 15',
            brand: 'dell',
            dateReceived: DateTime(2023, 1, 10, 9, 0),
            dateReturn: null,
            quantity: '10',
            maintenanceFrequency: null,
            nextMaintenanceSchedule: null,
            expirationDate: null,
            status:Status.returned
        ),
        AssetsEntity(
            assetId:  assetIdController.text.isNotEmpty
                ? assetIdController.text
                : 'A10dfd5',
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
            status:Status.inUse
        ),
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
        maintenanceFrequencyController.text = asset.maintenanceFrequency ?? '';
        nextMaintenanceScheduleController.text =
            asset.nextMaintenanceSchedule?.toString() ?? '';
        expirationDateController.text = asset.expirationDate?.toString() ?? '';
        statusController.text = asset.status.toString();
      }
      loading = false;
      update([AssetsIdConstant.assetsData]);
    });
  }



}
