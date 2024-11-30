part of '../../pages/mobile/mobile_dashboard_page.dart';

class MobileFitlerHeader extends StatelessWidget {
  const MobileFitlerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        id: DashboardIds.dashboardHeaderFilter,
        builder: (controller) {
          return Row(
            children: [
              Expanded(
                child: AppDropdown(
                  showDropdownIcon: false,
                  iconColor: AppColors.text,
                  image: AppAssets.sort,
                  style: AppTextStyles.font14BlackRegularCairo,
                  color: AppColors.card,
                  height: 40.h,
                  onChanged: (value) {},
                  items: List.generate(
                    MinimumMaximumSortOptions.values.length,
                    (index) {
                      return DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        value: MinimumMaximumSortOptions.values[index],
                        child: Text(
                          MinimumMaximumSortOptions.values[index].getName.tr,
                          style: AppTextStyles.font14SecondaryBlackCairoMedium,
                        ),
                      );
                    },
                  ),
                  textButton: 'Sort'.tr,
                ),
              ),
              horizontalSpace(9),
              AppDropdown(
                showDropdownIcon: true,
                textButton: controller.selectedDepartment?.getName,
                style: AppTextStyles.font14BlackRegularCairo,
                color: AppColors.card,
                height: 40.h,
                width: 136.w,
                value: controller.selectedDepartment,
                onChanged: (value) {
                  controller.updateDepartmentFilter(value);
                },
                items: List.generate(
                  Departments.values.length,
                  (index) {
                    return DropdownMenuItem(
                      alignment: AlignmentDirectional.centerStart,
                      value: Departments.values[index],
                      child: Text(
                        Departments.values[index].getName.tr,
                        style: AppTextStyles.font14SecondaryBlackCairoMedium,
                      ),
                    );
                  },
                ),
                hintText: 'Department'.tr,
              ),
              horizontalSpace(9),
              Expanded(
                child: AppDropdown(
                  showDropdownIcon: true,
                  iconColor: AppColors.black,
                  style: AppTextStyles.font14BlackRegularCairo,
                  color: AppColors.card,
                  width: 94.w,
                  height: 40.h,
                  value: controller.selectedTimeFilter,
                  textButton: controller.selectedTimeFilter?.getName,
                  onChanged: (value) {
                    controller.updateTimeFilter(value);
                  },
                  items: List.generate(
                    TimeFilter.values.length,
                    (index) {
                      return DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        value: TimeFilter.values[index],
                        child: Text(
                          TimeFilter.values[index].getName.tr,
                          style: AppTextStyles.font14SecondaryBlackCairoMedium,
                        ),
                      );
                    },
                  ),
                  hintText: 'Time'.tr,
                ),
              ),
            ],
          );
        });
  }
}
