import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/di/injection.dart';
import '../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/enums/inventory_categories.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_font_weights.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../constants/ids.dart';

import '../../../controller/home_controller.dart';
import '../../widgets/common/vertical/squared_filter_card.dart';
import '../../widgets/tablet/search_filter/filter_dialog.dart';
part '../../widgets/mobile/cards/category_filter_card.dart';
part '../../widgets/mobile/categories_filter_row/categories_filter_row.dart';
part '../../widgets/mobile/search_filter/mobile_search_filter.dart';

//Youssef Ashraf
///Represents The Home Page in Mobile View
class MobileHomePage extends GetView<HomeController> {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: SafeArea(
          child: GetBuilder<HomeController>(
            id: HomeIds.home,
            builder: (controller) {
              return Obx(() {
                final index = controller.currentCategoryIndex.value;
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: isAdmin
                          ? Row(mainAxisSize: MainAxisSize.min, children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.popUntil(
                                      context, (route) => route.isFirst);
                                },
                                child: SvgPicture.asset(
                                  context.isArabic
                                      ? AppAssets.arrowForward
                                      : AppAssets.arrowBack,
                                  width: 24.w,
                                  height: 24.h,
                                  color: AppColors.text,
                                ),
                              ),
                              horizontalSpace(8),
                              const CustomAppBar(),
                            ])
                          : const CustomAppBar(),
                    ),
                    SliverToBoxAdapter(child: verticalSpace(20)),
                    const SliverToBoxAdapter(
                        child: MobileCategoriesFilterRow()),
                    SliverToBoxAdapter(child: verticalSpace(20)),
                    const SliverToBoxAdapter(child: MobileSearchFilter()),
                    SliverToBoxAdapter(child: verticalSpace(20)),
                    controller.mobileHomeTabs[index],
                  ],
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
