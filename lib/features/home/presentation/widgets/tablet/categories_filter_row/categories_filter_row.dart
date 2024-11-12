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
    return Padding(
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
                    ...List.generate(InventoryCategories.categories.length,
                        (index) {
                      final last =
                          index == InventoryCategories.categories.length - 1;
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          controller.updateCategoryIndex(index);
                        },
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.only(end: last ? 0 : 37.w),
                          child: TabletCategoryFilterCard(
                            count: 10,
                            name: InventoryCategories.categories[index],
                            selected:
                                controller.currentCategoryIndex.value == index,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              //if current tab is requests
              if (controller.currentCategoryIndex.value == 2)
                AppDefaultButton(
                  text: 'Track Request'.tr,
                  style: context.isPhone
                      ? AppTextStyles.font16BlackMediumCairo
                      : AppTextStyles.font18BlackMediumCairo,
                  onPressed: () => Get.toNamed(Routes.trackRequest),
                ),
            ],
          );
        },
      ),
    );
  }
}
