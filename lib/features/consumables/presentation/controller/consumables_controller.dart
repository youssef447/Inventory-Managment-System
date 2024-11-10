
// Date: 7/11/2024
// By:Mohamed Ashraf

import 'package:get/get.dart';

import '../../../../core/constants/enums.dart';
import '../../domain/entity/consumables_entity.dart';
import '../constants/consumables_id_constant.dart';

class ConsumablesController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadConsumablesData();
  }
  bool loading = true;
// list for item of table assets
  List<ConsumablesEntity> consumablesList = [];
// show dummy data for test ui ------ will be removed --------
  Future<void> loadConsumablesData() async {

    Future.delayed(
      const Duration(seconds: 2),
    ).then((_) {
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
          unitOfMeasurement: 'pieces',
          usageFrequency: 'daily',
          expirationDate: DateTime(2024, 7, 10),
          status: Status.maintenance,
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
          unitOfMeasurement: 'liters',
          usageFrequency: 'as needed',
          expirationDate: DateTime(2025, 6, 15),
          status: Status.inUse,
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
          unitOfMeasurement: 'pieces',
          usageFrequency: 'daily',
          expirationDate: null,
          status: Status.expired,
        ),
        // Add more assets as needed
      ];
      loading = false;
      update([ConsumablesIdConstant.consumablesTable]);
    });
  }



}
