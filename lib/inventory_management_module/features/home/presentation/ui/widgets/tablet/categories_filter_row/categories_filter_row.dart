part of '../../../page/tablet/tablet_home_page.dart';

//Youssef Ashraf
// Date: 7/11/2024
///Represents the categories Filter Row in home page
class TabletCategoriesFilterRow extends GetView<HomeController> {
  const TabletCategoriesFilterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      leftToRight: context.isArabic ? false : true,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: context.isTablett ? 0 : 8.w,
          bottom: 8.h,
          top: 8.h,
        ),
        child: Obx(
          () {
            return Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ...List.generate(InventoryCategories.values.length,
                          (index) {
                        final last =
                            index == InventoryCategories.values.length - 1;
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            controller.updateCategoryIndex(index);
                          },
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: last ? 0 : 37.w),
                            child: TabletCategoryFilterCard(
                              count: 10,
                              name: InventoryCategories.values[index].getName,
                              selected: controller.currentCategoryIndex.value ==
                                  index,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                //if current tab is requests
                if (context.isLandscapee)
                  Row(
                    children: [
                      if (controller.currentCategoryIndex.value == 2)
                        AppDefaultButton(
                          width: 112.w,
                          text: 'Track Request'.tr,
                          style: context.isPhone
                              ? AppTextStyles.font16BlackMediumCairo
                                  .copyWith(color: AppColors.textButton)
                              : AppTextStyles.font18BlackMediumCairo
                                  .copyWith(color: AppColors.textButton),
                          onPressed: () =>
                              context.navigateTo(Routes.trackRequest),
                        ),
                      horizontalSpace(9),
                      AppDefaultButton(
                        width: 112.w,
                        text: 'Approval'.tr,
                        onPressed: () {
                          context.navigateTo(Routes.approval);
                        },
                        style: !context.isTablett
                            ? AppTextStyles.font16BlackMediumCairo
                                .copyWith(color: AppColors.textButton)
                            : AppTextStyles.font18BlackMediumCairo
                                .copyWith(color: AppColors.textButton),
                      ),
                    ],
                  ),
                if (!context.isLandscapee)
                  Column(
                    children: [
                      if (controller.currentCategoryIndex.value == 2)
                        Padding(
                          padding: EdgeInsets.only(bottom: 9.0.h),
                          child: AppDefaultButton(
                            width: 125.w,
                            text: 'Track Request'.tr,
                            style: !context.isTablett
                                ? AppTextStyles.font16BlackMediumCairo
                                    .copyWith(color: AppColors.textButton)
                                : AppTextStyles.font18BlackMediumCairo
                                    .copyWith(color: AppColors.textButton),
                            onPressed: () =>
                                context.navigateTo(Routes.trackRequest),
                          ),
                        ),
                      AppDefaultButton(
                        width: 125.w,
                        text: 'Approval'.tr,
                        onPressed: () {
                          context.navigateTo(Routes.approval);
                        },
                        style: !context.isTablett
                            ? AppTextStyles.font16BlackMediumCairo
                                .copyWith(color: AppColors.textButton)
                            : AppTextStyles.font18BlackMediumCairo
                                .copyWith(color: AppColors.textButton),
                      ),
                    ],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
