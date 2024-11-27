part of '../../pages/mobile/mobile_admin_employees_page.dart';

//Youssef Ashraf
///Represents The Employee Search Filter in Tablet View
class MobileEmployeeSearchFilter extends GetView<EmployeesController> {
  const MobileEmployeeSearchFilter({super.key});

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
        horizontalSpace(9),
        SquaredChipCard(
          icon: AppAssets.filter,
          color: AppColors.card,
          onTap: () {
            GetDialogHelper.generalDialog(
              context: context,
              child: const EmployeeFilterDialog(),
            );
          },
        ),
      ],
    );
  }
}
