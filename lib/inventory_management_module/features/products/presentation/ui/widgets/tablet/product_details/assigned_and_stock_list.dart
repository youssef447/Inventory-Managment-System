part of '../../../pages/tablet/tablet_product_details_page.dart';

class TabletAssignedAndStockList extends GetView<ProductsController> {
  const TabletAssignedAndStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
                  List.generate(controller.assignStockFilters.length, (index) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(
                      end: index == controller.assignStockFilters.length - 1
                          ? 0
                          : 35.w),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      controller.updateCategoryIndex(index);
                    },
                    child: MobileCategoryFilterCard(
                      count: 12,
                      name: controller.assignStockFilters[index],
                      selected: controller.currentCategoryIndex.value == index,
                    ),
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
            ],
          ),
        ),
        verticalSpace(15),
        Obx(() => StaggeredGrid.count(
              crossAxisCount: Get.width > 1200 ? 3 : 2,
              mainAxisSpacing: 15.h,
              crossAxisSpacing: context.isLandscapee ? 20.w : 36.w,
              children: List.generate(
                controller.currentCategoryIndex.value == 0
                    ? controller.dummyAssignedUsers.length
                    : controller.dummyInStock.length,
                (index) {
                  return controller.currentCategoryIndex.value == 0
                      ? OrientationHelper(
                          portrait: VerticalAssignedUserCard(
                            assignedUser: controller.dummyAssignedUsers[index],
                          ),
                          landScape: HorizontalAssignedUserCard(
                            assignedUser: controller.dummyAssignedUsers[index],
                          ),
                        )
                      : InStockCard(product: controller.dummyInStock[index]);
                },
              ),
            ))
      ],
    );
  }
}
