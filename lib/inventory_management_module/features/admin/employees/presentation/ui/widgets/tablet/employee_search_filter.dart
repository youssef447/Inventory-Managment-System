part of '../../pages/tablet/tablet_admin_employees_page.dart';

//Youssef Ashraf
///Represents The Employee Search Filter in Tablet View
class TabletEmployeeSearchFilter extends GetView<EmployeesController> {
  const TabletEmployeeSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                hintStyle: AppTextStyles.font16SecondaryBlackCairoMedium,
                controller: controller.searchController,
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
        horizontalSpace(10),
        Row(
          children: [
            GetBuilder<EmployeesController>(
                id: AdminEmployeesIds.employeeFilter,
                builder: (controller) {
                  return AppDropdown(
                    showDropdownIcon: true,
                    textButton: controller.selectedDepartment?.getName,
                    width: 150.w,
                    style: AppTextStyles.font14BlackRegularCairo,
                    color: AppColors.card,
                    height: 40.h,
                    value: controller.selectedDepartment,
                    onChanged: (value) {
                      controller.updateDepartmentFilter(value, true);
                    },
                    items: List.generate(
                      Departments.values.length,
                      (index) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          value: Departments.values[index],
                          child: Text(
                            Departments.values[index].getName.tr,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                    hintText: 'Department'.tr,
                  );
                }),
            horizontalSpace(9),
            AppDropdown(
              showDropdownIcon: false,
              iconColor: AppColors.inverseBase,
              width: context.isLandscapee ? 100.w : 55.w,
              image: AppAssets.sort,
              style: AppTextStyles.font14BlackRegularCairo,
              color: AppColors.card,
              height: 40.h,
              onChanged: (value) {
                controller.applySort(value, true);
              },
              items: List.generate(
                SortOptions.values.length,
                (index) {
                  return DropdownMenuItem(
                    alignment: AlignmentDirectional.centerStart,
                    value: SortOptions.values[index],
                    child: Text(
                      SortOptions.values[index].getName.tr,
                      style: AppTextStyles.font14SecondaryBlackCairoMedium,
                    ),
                  );
                },
              ),
              textButton: context.isLandscapee ? 'Sort'.tr : null,
            ),
          ],
        )
      ],
    );
  }
}
