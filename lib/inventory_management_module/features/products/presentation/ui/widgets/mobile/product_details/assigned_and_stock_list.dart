part of '../../../pages/mobile/mobile_product_details_page.dart';

class MobileAssignedAndStockList extends GetView<ProductsController> {
  const MobileAssignedAndStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        Obx(
          () {
            return SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(controller.assignStockFilters.length,
                    (index) {
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
                        selected:
                            controller.currentCategoryIndex.value == index,
                      ),
                    ),
                  );
                }),
              ),
            );
          },
        ),
        SliverToBoxAdapter(
          child: verticalSpace(15),
        ),
        SliverToBoxAdapter(
          child: SlideAnimation(
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
                        hintStyle:
                            AppTextStyles.font12SecondaryBlackCairoMedium,
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
                SquaredChipCard(
                  icon: AppAssets.filter,
                  color: AppColors.inverseBase,
                  iconColor: AppColors.icon,
                  onTap: () {
                    if (controller.currentCategoryIndex.value == 0) {
                      GetDialogHelper.generalDialog(
                          child: const AssignFilterDialog(), context: context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: verticalSpace(15),
        ),
        Obx(() => SliverPadding(
              padding: EdgeInsets.only(
                bottom: 12.h,
              ),
              sliver: SliverList.separated(
                separatorBuilder: (_, __) => verticalSpace(16),
                itemBuilder: (context, index) {
                  return controller.currentCategoryIndex.value == 0
                      ? VerticalAssignedUserCard(
                          assignedUser: controller.dummyAssignedUsers[index])
                      : InStockCard(product: controller.dummyInStock[index]);
                },
                itemCount: controller.currentCategoryIndex.value == 0
                    ? controller.dummyAssignedUsers.length
                    : controller.dummyInStock.length,
              ),
            ))
      ],
    );
  }
}
