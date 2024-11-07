import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../../core/helpers/date_time_helper.dart';
import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/helpers/spacing_helper.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_weights.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/buttons/app_default_button.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

import '../../../../requests/presentation/ui/pages/mobile/mobile_requests_page.dart';
import '../../../../requests/presentation/ui/pages/tablet/tablet_requests_page.dart';
import '../../../constants/inventory_categories.dart';
import '../../../controller/home_controller.dart';
import '../../widgets/tablet/search_filter/tablet_search_filter.dart';
part '../../widgets/tablet/cards/category_filter_card.dart';
part '../../widgets/tablet/categories_filter_row/categories_filter_row.dart';

class TabletHomePage extends GetView<HomeController> {
  const TabletHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.isLandscapee
            ? EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h)
            : EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                verticalSpace(20),
                const TabletCategoriesFilterRow(),
                verticalSpace(20),
                const TabletSearchFilter(),
                verticalSpace(20),
                Obx(
                  () {
                    if (controller.currentCategoryIndex.value == 0) {
                      return const SizedBox();
                    }
                    if (controller.currentCategoryIndex.value == 1) {
                      return const SizedBox();
                    }
                    return const ResponsiveHelper(
                      mobileWidget: TabletRequestsPage(),
                      tabletWidget: MobileRequestsPage(),
                    );
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
