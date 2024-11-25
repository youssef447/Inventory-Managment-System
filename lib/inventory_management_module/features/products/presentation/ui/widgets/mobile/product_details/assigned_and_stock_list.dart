part of '../../../pages/mobile/mobile_product_details_page.dart';

class AssignedAndStockList extends GetView<ProductsController> {
  const AssignedAndStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
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
                !context.isTablett
                    ? SquaredChipCard(
                        icon: AppAssets.filter,
                        color: AppColors.card,
                      )
                    : RectangledFilterCard(
                        width: 112.w,
                        image: AppAssets.download,
                        text: 'Download',
                        color: AppColors.primary,
                        onTap: () {},
                      ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: verticalSpace(15),
        ),
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
        /*  Obx(() => SliverPadding(
              padding: EdgeInsets.only(
                bottom: 12.h,
              ),
              sliver: SliverList.separated(
                separatorBuilder: (_, __) => verticalSpace(16),
                itemBuilder: (context, index) {
                  return MobileRequestCard(
                    request: controller.currentCategoryIndex.value == 0
                        ? controller.requestsOfAssets[index]
                        : controller.requestsOfConsumables[index],
                  );
                },
                itemCount: controller.currentCategoryIndex.value == 0
                    ? controller.requestsOfAssets.length
                    : controller.requestsOfConsumables.length,
              ),
            )) */
      ],
    );
  }
}
