import 'package:get/get.dart';

import '../../constants/ids_constants.dart';
import '../../entities/request_entity.dart';

//Youssef Ashraf
//Date: 7/11/2024
///Where all logic in Request tab is handled
class RequestsController extends GetxController {
  List<RequestEntity> requests = [];
  bool loading = true;
  @override
  void onInit() {
    super.onInit();
    loadRequestsData();
  }

  RxInt currentCategoryIndex = 0.obs;
  updateCategoryIndex(int index) {
    currentCategoryIndex.value = index;
  }

  ///Loading Requests from backend. Called at init
  Future<void> loadRequestsData() async {
    Future.delayed(
      const Duration(seconds: 2),
    ).then((_) {
      requests = [
        RequestEntity(
          requestId: '001',
          requestType: 'Asset Request',
          requestDate: DateTime.now(),
          priority: 'Computer',
          maintenanceFrequency: '',
          assetName: 'Laptop',
          category: 'Electronics',
          subCategory: 'Computer',
          model: 'GZ 15',
          brand: 'Dell',
          expectedRecieved: DateTime.now(),
          dateReturn: DateTime.now(),
          quantity: 2,
          status: 'Pending',
        ),
        RequestEntity(
          requestId: '001',
          requestType: 'Asset Request',
          requestDate: DateTime.now(),
          priority: 'Computer',
          maintenanceFrequency: '',
          assetName: 'Laptop',
          category: 'Electronics',
          subCategory: 'Computer',
          model: 'GZ 15',
          brand: 'Dell',
          expectedRecieved: DateTime.now(),
          dateReturn: DateTime.now(),
          quantity: 2,
          status: 'Approved',
        ),
        RequestEntity(
          requestId: '001',
          requestType: 'Asset Request',
          requestDate: DateTime.now(),
          priority: 'Computer',
          maintenanceFrequency: '',
          assetName: 'Laptop',
          category: 'Electronics',
          subCategory: 'Computer',
          model: 'GZ 15',
          brand: 'Dell',
          expectedRecieved: DateTime.now(),
          dateReturn: DateTime.now(),
          quantity: 2,
          status: 'Rejected',
        ),
        RequestEntity(
          requestId: '001',
          requestType: 'Asset Request',
          requestDate: DateTime.now(),
          priority: 'Computer',
          maintenanceFrequency: '',
          assetName: 'Laptop',
          category: 'Electronics',
          subCategory: 'Computer',
          model: 'GZ 15',
          brand: 'Dell',
          expectedRecieved: DateTime.now(),
          dateReturn: DateTime.now(),
          quantity: 2,
          status: 'Pending',
        ),
        RequestEntity(
          requestId: '001',
          requestType: 'Asset Request',
          requestDate: DateTime.now(),
          priority: 'Computer',
          maintenanceFrequency: '',
          assetName: 'Laptop',
          category: 'Electronics',
          subCategory: 'Computer',
          model: 'GZ 15',
          brand: 'Dell',
          expectedRecieved: DateTime.now(),
          dateReturn: DateTime.now(),
          quantity: 2,
          status: 'Canceled',
        ),
      ];
      loading = false;
      update([RequestsIds.requestsPage]);
    });
  }
}
