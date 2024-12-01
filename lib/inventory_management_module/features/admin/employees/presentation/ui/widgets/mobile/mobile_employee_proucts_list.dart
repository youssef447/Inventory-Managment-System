part of '../../pages/mobile/mobile_admin_employee_details_page.dart';

//Youssef Ashraf
///Represents The Employee Products List in Employee Details Page
class MobileEmployeeProductsList extends StatelessWidget {
  const MobileEmployeeProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeDetailsController>(
        id: AdminEmployeesIds.employeeDetails,
        builder: (controller) {
          return SliverMainAxisGroup(
            slivers: [
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(EmployeeRequestStatus.values.length,
                        (index) {
                      return Padding(
                        padding: EdgeInsetsDirectional.only(
                            end:
                                index == EmployeeRequestStatus.values.length - 1
                                    ? 0
                                    : 35.w),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            controller.updateCategoryIndex(index);
                          },
                          child: MobileCategoryFilterCard(
                            count: 12,
                            name: EmployeeRequestStatus.values[index].getName,
                            selected: controller.currentCategoryIndex == index,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: verticalSpace(30),
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
                              controller:
                                  controller.searchEmployeeProductsController,
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
                      horizontalSpace(9),
                      SquaredChipCard(
                        icon: AppAssets.filter,
                        color: AppColors.card,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: verticalSpace(30),
              ),

              //Requested Tab
              if (controller.currentCategoryIndex == 4)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.h),
                    child: const VerticalRequstsSummaryCircles(),
                  ),
                ),
              SliverPadding(
                padding: EdgeInsets.only(
                  bottom: 12.h,
                ),
                sliver: SliverList.separated(
                  separatorBuilder: (_, __) => verticalSpace(16),
                  itemBuilder: (context, index) {
                    return controller.currentCategoryIndex == 4
                        ? GestureDetector(
                            onTap: () {
                              context.navigateTo(
                                  Routes.employeeTrackRequestDetails,
                                  arguments: {
                                    RouteArguments.requestModel:
                                        controller.requestedProducts[index],
                                  });
                            },
                            child: MobileRequestedProductCard(
                              request: controller.requestedProducts[index],
                            ),
                          )
                        : EmployeeProductCard(
                            productEntity: controller
                                .getCurrentProducts()[index]
                                .productentity,
                          );
                  },
                  itemCount: controller.currentCategoryIndex == 4
                      ? controller.requestedProducts.length
                      : controller.getCurrentProducts().length,
                ),
              ),
            ],
          );
        });
  }
}
