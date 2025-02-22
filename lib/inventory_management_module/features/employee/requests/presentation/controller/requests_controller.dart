import 'package:get/get.dart';

import '../../../../../core/constants/approve_cycle.dart';
import '../../../../../core/enums/requests_enums.dart';
import '../../../../products/enums/product_enums.dart';
import '../../../Assets/domain/entity/assets_entity.dart';
import '../../../consumables/domain/entity/consumables_entity.dart';
import '../../constants/ids_constants.dart';
import '../../entities/message_entity.dart';
import '../../entities/request_entity.dart';

//Youssef Ashraf
//Date: 7/11/2024
///Where all logic in Request tab is handled
class RequestsController extends GetxController {
  List<RequestEntity> requests = [];
  List<RequestEntity> requestsOfAssets = [];
  List<RequestEntity> requestsOfConsumables = [];
  bool loading = true;
  @override
  void onInit() {
    super.onInit();
    loadRequestsData();
  }

  RxInt currentCategoryIndex = 0.obs;
  updateCategoryIndex(int index) {
    currentCategoryIndex.value = index;
    update([RequestsIds.summaryCircles]);
  }

  ///Loading Requests from backend. Called at init
  Future<void> loadRequestsData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    requests = [
      RequestEntity(
        requestId: '001',
        requestType: ProductType.asset,
        status: RequestStatus.pending,
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
        requestType: ProductType.asset,
        status: RequestStatus.approved,
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
        requestId: '0016',
        requestType: ProductType.consumable,
        status: RequestStatus.pending,
        requestDate: DateTime.now(),
        dateReturn: DateTime.now(),
        expectedRecieved: DateTime.now(),
        priority: 'Urgent',
        quantity: 2,
        consumablesEntity: ConsumablesEntity(
          consumableId: 'C0023',
          name: 'Face Mask',
          category: 'Medical Supplies',
          subcategory: 'Personal Protective Equipment',
          model: 'FM789',
          brand: 'SafeHealth',
          dateReceived: DateTime(2023, 7, 10),
          quantity: '500',
          unitOfMeasurement: UnitOfMeasurement.gram,
          usageFrequency: 'Daily',
          expirationDate: DateTime(2024, 7, 10),
          status: 'Maintenance',
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
        requestId: '004',
        requestType: ProductType.asset,
        status: RequestStatus.pending,
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
        requestType: ProductType.asset,
        status: RequestStatus.pending,
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
        requestId: '0013',
        requestType: ProductType.consumable,
        status: RequestStatus.pending,
        requestDate: DateTime.now(),
        dateReturn: DateTime.now(),
        expectedRecieved: DateTime.now(),
        priority: 'Urgent',
        quantity: 2,
        consumablesEntity: ConsumablesEntity(
          consumableId: 'C004',
          name: 'Face Mask',
          category: 'Medical Supplies',
          subcategory: 'Personal Protective Equipment',
          model: 'FM789',
          brand: 'SafeHealth',
          dateReceived: DateTime(2023, 7, 10),
          quantity: '500',
          unitOfMeasurement:  UnitOfMeasurement.gram,
          usageFrequency: 'Daily',
          expirationDate: DateTime(2024, 7, 10),
          status: 'Maintenance',
        ),
        approvalCycles: ApproveCycle.approvalCycles,
      ),
      RequestEntity(
        requestId: '009',
        requestType: ProductType.consumable,
        status: RequestStatus.pending,
        requestDate: DateTime.now(),
        dateReturn: DateTime.now(),
        expectedRecieved: DateTime.now(),
        priority: 'Urgent',
        quantity: 2,
        consumablesEntity: ConsumablesEntity(
          consumableId: 'C005',
          name: 'Face Mask',
          category: 'Medical Supplies',
          subcategory: 'Personal Protective Equipment',
          model: 'FM789',
          brand: 'SafeHealth',
          dateReceived: DateTime(2023, 7, 10),
          quantity: '500',
          unitOfMeasurement:   UnitOfMeasurement.gram,
          usageFrequency: 'Daily',
          expirationDate: DateTime(2024, 7, 10),
          status: 'Maintenance',
        ),
        approvalCycles: ApproveCycle.approvalCycles,
      ),
    ];
    getAssetRequests();
    getConsumableRequests();
    loading = false;
    update([RequestsIds.requestsPage]);
  }

  getAssetRequests() {
    requestsOfAssets = requests
        .where((e) => e.assetsEntity != null)
        .map(
          (e) => e,
        )
        .toList();
  }

  getConsumableRequests() {
    requestsOfConsumables = requests
        .where((e) => e.consumablesEntity != null)
        .map(
          (e) => e,
        )
        .toList();
  }

  int getPendingRequestNumbers(RequestStatus status) {
    final isConsumable = currentCategoryIndex.value == 1;
    if (status == RequestStatus.approved) {
      return isConsumable
          ? getApprovedConsumableNumbers()
          : getApprovedAssetNumbers();
    }
    if (status == RequestStatus.pending) {
      return isConsumable
          ? getPendingConsumableNumbers()
          : getPendingAssetNumbers();
    }
    if (status == RequestStatus.rejected) {
      return isConsumable
          ? getRejectedConsumableNumbers()
          : getRejectedAssetNumbers();
    }
    //Canceled
    return isConsumable
        ? getCanceledConsumableNumbers()
        : getCanceledAssetNumbers();
  }

  int getPendingConsumableNumbers() {
    return requestsOfConsumables
        .where((e) => e.status == RequestStatus.pending)
        .length;
  }

  int getApprovedConsumableNumbers() {
    return requestsOfConsumables
        .where((e) => e.status == RequestStatus.approved)
        .length;
  }

  int getCanceledConsumableNumbers() {
    return requestsOfConsumables
        .where((e) => e.status == RequestStatus.cancelled)
        .length;
  }

  int getRejectedConsumableNumbers() {
    return requestsOfConsumables
        .where((e) => e.status == RequestStatus.rejected)
        .length;
  }

  int getPendingAssetNumbers() {
    return requestsOfAssets
        .where((e) => e.status == RequestStatus.pending)
        .length;
  }

  int getApprovedAssetNumbers() {
    return requestsOfAssets
        .where((e) => e.status == RequestStatus.approved)
        .length;
  }

  int getCanceledAssetNumbers() {
    return requestsOfAssets
        .where((e) => e.status == RequestStatus.cancelled)
        .length;
  }

  int getRejectedAssetNumbers() {
    return requestsOfAssets
        .where((e) => e.status == RequestStatus.rejected)
        .length;
  }
}
