
// Date: 7/11/2024
// By:Mohamed Ashraf

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

// show dummy data for test ui ------ will be removed --------
  Future<void> loadAssetsData() async{
    Future.delayed(
      const Duration(seconds: 2),
    ).then((_) {
      assetsList = [
        AssetsEntity(
          assetId: 'A101',
          assetName: 'Laptop',
          category: 'Electronics',
          subcategory: 'Computers',
          model: 'Dell Inspiration',
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
            assetId: 'A101',
            assetName: 'Laptop',
            category: 'Electronics',
            subcategory: 'Computers',
            model: 'Dell Inspiration',
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
            assetId: 'A101',
            assetName: 'Laptop',
            category: 'Electronics',
            subcategory: 'Computers',
            model: 'Dell Inspiration',
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
      loading = false;
      update([AssetsIdConstant.assetsTable]);
    });
  }



}
