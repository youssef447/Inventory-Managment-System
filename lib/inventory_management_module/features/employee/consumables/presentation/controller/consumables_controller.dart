// Date: 7/11/2024
// By:Mohamed Ashraf

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/enums/requests_enums.dart';
import '../../../../../core/helpers/date_time_helper.dart';
import '../../domain/entity/consumables_entity.dart';
import '../constants/consumables_id_constant.dart';

class ConsumablesController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadConsumablesData();
  }

  // Controllers for TextFormFields to bind with UI
  TextEditingController consumableIdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController subcategoryController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController dateReceivedController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController unitOfMeasurementController = TextEditingController();
  TextEditingController usageFrequencyController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  bool loading = true;

// list for item of table assets
  List<ConsumablesEntity> consumablesList = [];

// show dummy data for test ui ------ will be removed --------
  Future<void> loadConsumablesData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    consumablesList = [
      ConsumablesEntity(
        consumableId: 'C003',
        name: 'Face Mask',
        category: 'Medical Supplies',
        subcategory: 'Personal Protective Equipment',
        model: 'FM789',
        brand: 'SafeHealth',
        dateReceived: DateTime(2023, 7, 10),
        quantity: '500',
        unitOfMeasurement: UnitOfMeasurement.gram,
        usageFrequency: 'daily',
        expirationDate: DateTime(2024, 7, 10),
        status: 'Returned',
      ),
      ConsumablesEntity(
        consumableId: 'C002',
        name: 'Hand Sanitizer',
        category: 'Hygiene Products',
        subcategory: 'Sanitizers',
        model: 'HS-456',
        brand: 'CleanCo',
        dateReceived: DateTime(2023, 6, 15),
        quantity: '50',
        unitOfMeasurement: UnitOfMeasurement.gram,
        usageFrequency: 'as needed',
        expirationDate: DateTime(2025, 6, 15),
        status: 'InUse',
      ),
      ConsumablesEntity(
        consumableId: 'C001',
        name: 'Gloves',
        category: 'Medical Supplies',
        subcategory: 'Personal Protective Equipment',
        model: 'G123',
        brand: 'MedBrand',
        dateReceived: DateTime(2023, 5, 20),
        quantity: '200',
        unitOfMeasurement: UnitOfMeasurement.gram,
        usageFrequency: 'daily',
        expirationDate: null,
        status: 'Expired',
      ),
    ];
    loading = false;
    update([ConsumablesIdConstant.consumablesData]);
  }

  //called when user goes to details of Consumables
  setConsumablesDetails(ConsumablesEntity model) {
    consumableIdController.text = model.consumableId;
    nameController.text = model.name;
    categoryController.text = model.category;
    subcategoryController.text = model.subcategory;
    modelController.text = model.model;
    brandController.text = model.brand;
    quantityController.text = model.quantity;
    unitOfMeasurementController.text = model.unitOfMeasurement.getName;
    usageFrequencyController.text = model.usageFrequency;
    dateReceivedController.text = DateTimeHelper.formatDate(
      model.dateReceived,
    );
    expirationDateController.text = model.expirationDate != null
        ? DateTimeHelper.formatDate(
            model.expirationDate!,
          )
        : 'Not Applicable'.tr;
    statusController.text = model.status;
  }

  resetConsumablesDetails() {
    consumableIdController.clear();
    nameController.clear();
    categoryController.clear();
    subcategoryController.clear();
    modelController.clear();
    brandController.clear();
    dateReceivedController.clear();
    quantityController.clear();
    unitOfMeasurementController.clear();
    usageFrequencyController.clear();
    expirationDateController.clear();
    statusController.clear();
  }
}
