import 'package:get/get.dart';
import 'package:inventory_management/core/constants/approve_cycle.dart';

import '../../../Assets/domain/entity/assets_entity.dart';
import '../../constants/ids_constants.dart';
import '../../entities/message_entity.dart';
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
    await Future.delayed(
      const Duration(seconds: 2),
    );
    requests = [
      RequestEntity(
        requestId: '001',
        requestType: 'Asset Request',
        status: 'Pending',
        requestDate: DateTime.now(),
        dateReturn: DateTime.now(),
        expectedRecieved: DateTime.now(),
        priority: 'Urgent',
        quantity: 2,
        assetsEntity: AssetsEntity(
          assetName: 'Dell GZ 15',
          category: 'Electronics',
          subcategory: 'Computer',
          model: 'GZ 15',
          dateReceived: DateTime.now(),
          quantity: '2',
          status: 'InUse',
          brand: 'Dell',
        ),
        approvalCycles: ApproveCycle.approvalCycles,
      )..inquiryMessages = [
          MessageEntity(
            userEntity: ApproveCycle.approvalCycles[1],
            message: 'Hi',
          ),
          MessageEntity(
            userEntity: ApproveCycle.approvalCycles[1],
            message:
                'Please Send me an attachment of all the designs made by UI/UX Designers as soon as possible .',
          ),
        ],
      RequestEntity(
        requestId: '002',
        requestType: 'Asset Request',
        status: 'Approved',
        requestDate: DateTime.now(),
        dateReturn: DateTime.now(),
        expectedRecieved: DateTime.now(),
        priority: 'Urgent',
        quantity: 2,
        assetsEntity: AssetsEntity(
          assetName: 'Dell GZ 15',
          category: 'Electronics',
          subcategory: 'Computer',
          model: 'GZ 15',
          dateReceived: DateTime.now(),
          quantity: '2',
          status: 'InUse',
          brand: 'Dell',
        ),
        approvalCycles: ApproveCycle.approvalCycles,
      ),
      RequestEntity(
        requestId: '003',
        requestType: 'Asset Request',
        status: 'Pending',
        requestDate: DateTime.now(),
        dateReturn: DateTime.now(),
        expectedRecieved: DateTime.now(),
        priority: 'Urgent',
        quantity: 2,
        assetsEntity: AssetsEntity(
          assetName: 'Dell GZ 15',
          category: 'Electronics',
          subcategory: 'Computer',
          model: 'GZ 15',
          dateReceived: DateTime.now(),
          quantity: '2',
          status: 'InUse',
          brand: 'Dell',
        ),
        approvalCycles: ApproveCycle.approvalCycles,
      ),
      RequestEntity(
        requestId: '004',
        requestType: 'Asset Request',
        status: 'Pending',
        requestDate: DateTime.now(),
        dateReturn: DateTime.now(),
        expectedRecieved: DateTime.now(),
        priority: 'Urgent',
        quantity: 2,
        assetsEntity: AssetsEntity(
          assetName: 'Dell GZ 15',
          category: 'Electronics',
          subcategory: 'Computer',
          model: 'GZ 15',
          dateReceived: DateTime.now(),
          quantity: '2',
          status: 'InUse',
          brand: 'Dell',
        ),
        approvalCycles: ApproveCycle.approvalCycles,
      ),
      RequestEntity(
        requestId: '005',
        requestType: 'Asset Request',
        status: 'Pending',
        requestDate: DateTime.now(),
        dateReturn: DateTime.now(),
        expectedRecieved: DateTime.now(),
        priority: 'Urgent',
        quantity: 2,
        assetsEntity: AssetsEntity(
          assetName: 'Dell GZ 15',
          category: 'Electronics',
          subcategory: 'Computer',
          model: 'GZ 15',
          dateReceived: DateTime.now(),
          quantity: '2',
          status: 'InUse',
          brand: 'Dell',
        ),
        approvalCycles: ApproveCycle.approvalCycles,
      )
    ];
    loading = false;
    update([RequestsIds.requestsPage]);
  }
}
