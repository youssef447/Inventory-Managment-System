import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/enums/requests_enums.dart';
import '../../../core/theme/app_theme.dart';
// Date: 7/11/2024
// By: Youssef Ashraf
/// Objectives: This file is responsible for handling home page logic.

class HomeController extends GetxController {
  //------------Theme------------

  var isDarkModeEnabled = Get.isDarkMode;
  var isAnimatable = true;
  var selectedLanguage = Get.locale?.languageCode == 'ar' ? 'AR' : 'ENG';
  var isArabic = Get.locale?.languageCode == 'ar';

  // by: Nada Mohammed
  void toggleDarkMode() {
    isDarkModeEnabled = !isDarkModeEnabled;
    AppTheme.toggleTheme();
  }

  void toggleAnimation() {
    isAnimatable = !isAnimatable;
    Get.forceAppUpdate();
  }

  void toggleLanguage() {
    if (selectedLanguage == 'ENG') {
      Get.updateLocale(const Locale('ar', 'EG'));
      selectedLanguage = 'AR';
    } else {
      Get.updateLocale(const Locale('en', 'US'));
      selectedLanguage = 'ENG';
    }
  }

  //------------Category Filter Row------------

  RxInt currentCategoryIndex = 0.obs;

  ///updates category filter row index to filter table
  updateCategoryIndex(int index) {
    currentCategoryIndex.value = index;
  }

  //------------Search Filter ------------
  TextEditingController searchController = TextEditingController();
  List<RequestActions> requestAssetActions = [
    RequestActions.requestAsset,
    RequestActions.returnAsset,
    RequestActions.routineMaintenance,
    RequestActions.repairAsset,
  ];
  List<RequestActions> requestConsumablesActions = [
    RequestActions.requestConsumables,
    RequestActions.returnConsumables,
    RequestActions.expiredConsumables,
  ];
}
