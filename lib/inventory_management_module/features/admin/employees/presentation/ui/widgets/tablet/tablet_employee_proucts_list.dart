part of '../../pages/tablet/tablet_admin_employee_details_page.dart';

//Youssef Ashraf

///Represents The Employee Products List in Tablet View

class TabletEmployeeProuctsList extends StatelessWidget {
  const TabletEmployeeProuctsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeDetailsController>(
        id: AdminEmployeesIds.employeeDetails,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(EmployeeRequestStatus.values.length,
                      (index) {
                    return Padding(
                      padding: EdgeInsetsDirectional.only(
                          end: index == EmployeeRequestStatus.values.length - 1
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
              verticalSpace(30),
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
                    /*          AppDropdown(
                            showDropdownIcon: true,
                            onChanged: (value) {
                              //  controller.updateDepartmentFilter(value);
                            },
                            hintText: 'Inventory Type'.tr,
                            height: 37.h, width: 165.w,
                            //value: //controller.selectedDepartment,
                            textButton: 'Inventory Type',
                            color: AppColors.card,
                            items: List.generate(
                              Departments.values.length,
                              (index) {
                                return DropdownMenuItem(
                                  value: Departments.values[index],
                                  child: Text(
                                    Departments.values[index].getName.tr,
                                    style: AppTextStyles
                                        .font14SecondaryBlackCairoMedium,
                                  ),
                                );
                              },
                            ),
                          ), */
                    horizontalSpace(9),
                    RectangledFilterCard(
                      width: 112.w,
                      image: AppAssets.filter,
                      text: 'Filter',
                      color: AppColors.card,
                      textColor: AppColors.text,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              verticalSpace(30),
              //Requested Tab
              if (controller.currentCategoryIndex == 4)
                Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: const OrientationHelper(
                    portrait: VerticalRequstsSummaryCircles(),
                    landScape: HorizontalRequstsSummaryCircles(),
                  ),
                ),
              controller.getCurrentProducts().isEmpty
                  ? const NoDataGif()
                  : StaggeredGrid.count(
                      crossAxisCount: Get.width > 1200 ? 3 : 2,
                      mainAxisSpacing: 15.h,
                      crossAxisSpacing: context.isLandscapee ? 20.w : 16.w,
                      children: List.generate(
                        controller.currentCategoryIndex == 4
                            ? controller.requestedProducts.length
                            : controller.getCurrentProducts().length,
                        (index) {
                          return controller.currentCategoryIndex == 4
                              ? GestureDetector(
                                  onTap: () {
                                    context.navigateTo(
                                        Routes.employeeTrackRequestDetails,
                                        arguments: {
                                          RouteArguments.requestModel:
                                              controller
                                                  .requestedProducts[index],
                                        });
                                  },
                                  child: TabletRequestedProductCard(
                                    request:
                                        controller.requestedProducts[index],
                                  ),
                                )
                              : EmployeeProductCard(
                                  productEntity: controller
                                      .getCurrentProducts()[index]
                                      .productentity,
                                );
                        },
                      ),
                    )
            ],
          );
        });
  }
}
