part of '../../pages/mobile/mobile_admin_employees_page.dart';

//Youssef Ashraf
///Represents The Employee Filter Dialog in Mobile View
class EmployeeFilterDialog extends GetView<EmployeesController> {
  const EmployeeFilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width * 0.6,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.dialog,
          borderRadius: BorderRadius.circular(8.r),
        ),
        constraints: BoxConstraints(
          maxHeight: Get.height * 0.35,
        ),
        child: GetBuilder<EmployeesController>(
            id: AdminEmployeesIds.employeeFilter,
            builder: (controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: AppColors.primary,
                          radius: 16,
                          child: SvgPicture.asset(
                            AppAssets.filter,
                            width: 16,
                            height: 16,
                            color: Colors.black,
                          )),
                      horizontalSpace(8),
                      Text(
                        'Filter'.tr,
                        style: AppTextStyles.font20BlackCairoMedium,
                      ),
                    ],
                  ),
                  verticalSpace(24),
                  AppDropdown(
                    showDropdownIcon: true,
                    onChanged: (value) {
                      controller.updateDepartmentFilter(value);
                    },
                    hintText: 'Department'.tr,
                    height: 44.h,
                    value: controller.selectedDepartment,
                    textButton: controller.selectedDepartment?.getName,
                    items: List.generate(
                      Departments.values.length,
                      (index) {
                        return DropdownMenuItem(
                          value: Departments.values[index],
                          child: Text(
                            Departments.values[index].getName.tr,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                  ),
                  verticalSpace(15),
                  AppDropdown(
                    showDropdownIcon: true,
                    onChanged: (value) {
                      controller.applySort(value);
                    },
                    hintText: 'Sort By'.tr,
                    height: 44.h,
                    value: controller.selectedSortOption,
                    textButton: controller.selectedSortOption?.getName,
                    items: List.generate(
                      SortOptions.values.length,
                      (index) {
                        return DropdownMenuItem(
                          value: SortOptions.values[index],
                          child: Text(
                            SortOptions.values[index].getName.tr,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                  ),
                  verticalSpace(15),
                  Row(
                    children: [
                      Expanded(
                          child: AppDefaultButton(
                        text: 'Reset'.tr,
                        color: AppColors.grey,
                        onPressed: () {
                          controller.resetFilter();
                        },
                      )),
                      horizontalSpace(16),
                      Expanded(
                        child: AppDefaultButton(
                          text: 'Apply'.tr,
                          textColor: controller.applyEnabled
                              ? AppColors.secondaryBlack
                              : AppColors.textButton,
                          color: controller.applyEnabled
                              ? AppColors.primary
                              : AppColors.grey,
                          onPressed: () {
                            if (controller.applyEnabled == false) return;
                            Navigator.of(context, rootNavigator: true).pop();
                            controller.applyFilter();
                          },
                        ),
                      )
                    ],
                  )
                ],
              );
            }));
  }
}
