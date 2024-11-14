import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';
import '../../../../../core/animations/horizontal_animation.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../Assets/presentation/ui/pages/mobile/mobile_assets_page.dart';
import '../../../../consumables/presentation/ui/pages/mobile/mobile_consumables_page.dart';
import '../../../../requests/presentation/ui/pages/mobile/mobile_requests_page.dart';

import '../../../../../core/helpers/date_time_helper.dart';
import '../../../../../core/helpers/spacing_helper.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_weights.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../constants/inventory_categories.dart';
import '../../../controller/home_controller.dart';
import '../../widgets/common/vertical/squared_filter_card.dart';
part '../../widgets/mobile/cards/category_filter_card.dart';
part '../../widgets/mobile/categories_filter_row/categories_filter_row.dart';
part '../../widgets/mobile/search_filter/mobile_search_filter.dart';

class MobileHomePage extends GetView<HomeController> {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: context.isLandscapee
            ? EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h)
            : context.isTablett
                ? EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h)
                : EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                verticalSpace(20),
                const MobileCategoriesFilterRow(),
                verticalSpace(20),
                const MobileSearchFilter(),
                verticalSpace(20),
                Obx(
                  () {
                    if (controller.currentCategoryIndex.value == 0) {
                      return const MobileAssetsPage();
                    }
                    if (controller.currentCategoryIndex.value == 1) {
                      return const MobileConsumablesPage();
                    }
                    return const MobileRequestsPage();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
