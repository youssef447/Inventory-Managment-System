import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import '../../../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../../../../employee/home/presentation/ui/page/mobile/mobile_home_page.dart';
import '../../../../../../assets/presentation/ui/widget/tablet/cards/asset_assigned_user_card.dart';
import '../../../../controller/admin_consumable_controller.dart';
import '../cards/consumable_assigned_user_card.dart';



class TabletConsumableAssigned
    extends GetView<ConsumableAssetsController> {
  const TabletConsumableAssigned({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              List.generate(
                  controller.assignFilters.length, (index) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.updateCategoryIndex(index);
                  },
                  child: MobileCategoryFilterCard(
                    count: 12,
                    name: controller.assignFilters[index],
                    selected: controller.currentCategoryIndex.value == index,
                  ),
                );
              }),
            );
          },
        ),
        verticalSpace(15),
        SlideAnimation(
          leftToRight: context.isArabic ? false : true,
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: SizedBox(
                    height: 37.h,
                    child: AppTextFormField(
                      backGroundColor: AppTheme.isDark ?? false
                          ? AppColors.field
                          : AppColors.white,
                      maxLines: 1,
                      hintText: 'Search Here...'.tr,
                      collapsed: true,
                      hintStyle: AppTextStyles.font12SecondaryBlackCairoMedium,
                      // AppTextStyles.font16SecondaryBlackCairoMedium,
                      controller: controller.searchDetailsController,
                      onChanged: (value) {},
                      contentPadding: context.isTablett
                          ? EdgeInsets.symmetric(
                        vertical: 2.h,
                      )
                          : null,
                      prefixIcon: SvgPicture.asset(
                        AppAssets.search,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                  ),
                ),
              ),
              horizontalSpace(9),
              RectangledFilterCard(
                width: 112.w,
                image: AppAssets.filter,
                text: 'Filter',
                color: AppColors.card,
                onTap: () {},
              ),
              horizontalSpace(9),
              RectangledFilterCard(
                width: 112.w,
                image: AppAssets.sort,
                text: 'Sort',
                color: AppColors.card,
                onTap: () {},
              ),
            ],
          ),
        ),
        verticalSpace(15),
        // if you want add more tab navigate wrap it with Obx()
        StaggeredGrid.count(
          crossAxisCount: Get.width > 1200 ? 3 : 2,
          mainAxisSpacing: 15.h,
          crossAxisSpacing: context.isLandscapee ? 20.w : 36.w,
          children: List.generate(
            controller.dummyAssignedUsers.length,
                (index) {
              return  ConsumableAssignedUserCard(assignedUser: controller.dummyAssignedUsers[index],);
            },
          ),
        )
      ],
    );
  }
}
