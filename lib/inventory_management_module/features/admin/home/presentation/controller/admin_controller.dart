import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../products/presentation/ui/pages/mobile/mobile_products_tab_page.dart';
import '../../../../products/presentation/ui/pages/tablet/tablet_products_tab_page.dart';
import '../../../assets/presentation/ui/pages/tablet/tablet_assets_page.dart';

class AdminController extends GetxController {
  //------------Tabs------------
  final List<Widget> mobileAdminTabs = [
    const MobileProductsTabPage(),

    /*  const Text('data'),
    const Text('data'),
    const Text('data'),
    const Text('data'),
    const Text('data'), */
  ];
  final List<Widget> tabletAdminTabs = [
    const TabletProductsTabPage(),
    const TabletAdminAssetsPage(),
    const Text('Consumable'),
    const Text('order'),
    const Text('suppliers'),
    const Text('Stprage :ocation'),
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
