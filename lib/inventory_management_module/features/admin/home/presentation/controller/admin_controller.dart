import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../products/presentation/ui/pages/mobile/mobile_products_tab_page.dart';
import '../../../../products/presentation/ui/pages/tablet/tablet_products_tab_page.dart';
import '../../../assets/presentation/ui/pages/mobile/mobile_assets_admin_page.dart';
import '../../../assets/presentation/ui/pages/tablet/tablet_assets_page.dart';
import '../../../consumable/presentation/ui/pages/mobile/mobile_consumable_admin_page.dart';
import '../../../consumable/presentation/ui/pages/tablet/tablet_consumable_page.dart';
import '../../../orders/presentation/ui/pages/mobile/mobile_order_page.dart';
import '../../../orders/presentation/ui/pages/tablet/tablet_order_page.dart';
import '../../../storage/presentation/ui/pages/mobile/mobile_storage_page.dart';
import '../../../storage/presentation/ui/pages/tablet/tablet_storage_page.dart';
import '../../../suppliers/presentation/ui/pages/mobile/mobile_suppliers_page.dart';
import '../../../suppliers/presentation/ui/pages/tablet/tablet_suppliers_page.dart';

class AdminController extends GetxController {
  //------------Tabs------------
  final List<Widget> mobileAdminTabs = [
    const MobileProductsTabPage(),
    const MobileAssetsAdminPage(),
    const MobileConsumableAdminPage(),
    const MobileOrderPage(),
    const MobileSuppliersPage(),
    const MobileStoragePage(),
  ];
  final List<Widget> tabletAdminTabs = [
    const TabletProductsTabPage(),
    const TabletAdminAssetsPage(),
    const TabletConsumablePage(),
    const TabletOrderPage(),
    const TabletSuppliersPage(),
    const TabletStoragePage(),
  ];

  //------------Category Filter Row------------

  RxInt currentCategoryIndex = 0.obs;

  ///updates category filter row index to filter table
  updateCategoryIndex(int index) {
    currentCategoryIndex.value = index;
  }

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

  //----------------- TextController

  TextEditingController searchController = TextEditingController();
}
