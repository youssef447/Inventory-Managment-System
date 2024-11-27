import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../core/enums/requests_enums.dart';
import '../../../../../core/helpers/date_time_helper.dart';
import '../../../../../core/helpers/share_helper.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../Assets/presentation/controller/assets_controller.dart';
import '../../../Assets/presentation/ui/constants/assets_columns_name.dart';
import '../../../Assets/presentation/ui/pages/mobile/mobile_assets_page.dart';
import '../../../Assets/presentation/ui/pages/tablet/tablet_assets_page.dart';
import '../../../consumables/presentation/constants/consumables_columns_name.dart';
import '../../../consumables/presentation/controller/consumables_controller.dart';
import '../../../consumables/presentation/ui/pages/mobile/mobile_consumables_page.dart';
import '../../../consumables/presentation/ui/pages/tablet/consumables_tablet_page.dart';
import '../../../requests/constants/requests_columns.dart';
import '../../../requests/presentation/controller/requests_controller.dart';
import '../../../requests/presentation/ui/pages/mobile/mobile_requests_page.dart';
import '../../../requests/presentation/ui/pages/tablet/tablet_requests_page.dart';
// Date: 7/11/2024
// By: Youssef Ashraf
/// Objectives: This file is responsible for handling home page logic.

class HomeController extends GetxController {
  //------------Tabs------------
  final List<Widget> mobileHomeTabs = [
    const MobileAssetsPage(),
    const MobileConsumablesPage(),
    const MobileRequestsPage(),
  ];
  final List<Widget> tabletHomeTabs = [
    const TabletAssetsPage(),
    const ConsumablesTabletPage(),
    const TabletRequestsPage(),
  ];
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
  //------------Export Table Logic ------------

  ///This function is responsible for exporting the current table data based on the currentCategoryIndex into a pdf file.
  ///the data is retrieved from the AssetsController, ConsumablesController or RequestsController based on the currentCategoryIndex.
  Future<void> exportTable() async {
    late List<String> headers;
    late List<List<dynamic>> data;

    //assets
    if (currentCategoryIndex.value == 0) {
      final controller = Get.find<AssetsController>();
      headers = AssetsColumnsName.tableColumnsName;
      data = controller.assetsList.map((model) {
        return [
          model.assetId,
          model.assetName,
          model.category,
          model.subcategory,
          model.model,
          model.brand,
          DateTimeHelper.formatDate(model.dateReceived),
          DateTimeHelper.formatDate(model.dateReturn ?? DateTime.now()),
          DateTimeHelper.formatInt(int.parse(model.quantity)),
          model.maintenanceFrequency ?? 'Not Applicable',
          DateTimeHelper.formatDate(
              model.nextMaintenanceSchedule ?? DateTime.now()),
          DateTimeHelper.formatDate(model.expectedLifeTime ?? DateTime.now()),
          model.status,
        ];
      }).toList();
    }
    //consumables
    else if (currentCategoryIndex.value == 1) {
      final controller = Get.find<ConsumablesController>();
      headers = ConsumablesColumnsName.tableColumnsConsumablesName;
      data = controller.consumablesList.map((model) {
        return [
          model.consumableId,
          model.name,
          model.category,
          model.subcategory,
          model.model,
          model.brand,
          DateTimeHelper.formatDate(model.dateReceived),
          DateTimeHelper.formatInt(int.parse(model.quantity)),
          model.unitOfMeasurement,
          model.usageFrequency,
          DateTimeHelper.formatDate(model.expirationDate ?? DateTime.now()),
          model.status,
        ];
      }).toList();
    }
    //requests
    else if (currentCategoryIndex.value == 2) {
      final controller = Get.find<RequestsController>();
      if (controller.currentCategoryIndex.value == 0) {
        if (controller.requestsOfAssets.isEmpty) return;
        headers = RequestsColumns.requestAssetColumns;
        data = controller.requestsOfAssets.map((model) {
          return [
            model.requestId,
            model.requestType,
            DateTimeHelper.formatDate(model.requestDate),
            model.status,
            model.priority,
            model.maintenanceFrequency ?? 'Not Applicable',
            if (model.assetsEntity != null) ...[
              model.assetsEntity!.assetName,
              model.assetsEntity!.category,
              model.assetsEntity!.subcategory,
              model.assetsEntity!.model,
              model.assetsEntity!.brand,
              DateTimeHelper.formatDate(model.expectedRecieved),
              DateTimeHelper.formatDate(
                  model.assetsEntity!.dateReturn ?? DateTime.now()),
              DateTimeHelper.formatInt(int.parse(model.assetsEntity!.quantity)),
            ],
          ];
        }).toList();
      } else {
        headers = RequestsColumns.requestConsumableColumns;
        if (controller.requestsOfConsumables.isEmpty) return;

        data = controller.requestsOfConsumables.map((model) {
          return [
            model.requestId,
            model.requestType,
            DateTimeHelper.formatDate(model.requestDate),
            model.status,
            model.priority,
            DateTimeHelper.formatDate(model.expectedRecieved),
            model.consumablesEntity!.consumableId,
            model.consumablesEntity!.name,
            model.consumablesEntity!.category,
            model.consumablesEntity!.subcategory,
            model.consumablesEntity!.model,
            model.consumablesEntity!.brand,
            DateTimeHelper.formatInt(
                int.parse(model.consumablesEntity!.quantity)),
            model.consumablesEntity!.unitOfMeasurement,
            DateTimeHelper.formatInt(model.consumablesEntity!.reorderLevel),
            DateTimeHelper.formatInt(model.consumablesEntity!.reorderQuantity),
            model.consumablesEntity!.usageFrequency,
          ];
        }).toList();
      }
    }
    await ShareHelper.printDoc(data, headers);
  }
}
