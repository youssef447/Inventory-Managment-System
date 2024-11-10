import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Assets/domain/entity/assets_entity.dart';
import '../../../Assets/presentation/controller/assets_controller.dart';
import '../../constants/ids_constants.dart';

//Youssef Ashraf
//Date: 7/11/2024
///Where all logic in Request Asset Page is handled
class RequestAssetsController extends GetxController {
  List<AssetsEntity> assets = [];
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

  ///Loading Request Assets from backend but for now its from asset controller.  Called at init
  Future<void> loadRequestsData() async {
    Get.find<AssetsController>().loadAssetsData().then((_) {
      assets = Get.find<AssetsController>().assetsList;
      loading = false;
      update([RequestAssetsIds.requestAssetsPage]);
    });
  }

  //------------Search Filter ------------
  TextEditingController searchController = TextEditingController();
}
