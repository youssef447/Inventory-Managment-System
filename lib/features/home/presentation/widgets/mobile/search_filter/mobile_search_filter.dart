// Date: 5/8/2024
// By: Youssef Ashraf
// Last update: 6/8/2024
// Objectives: This file is responsible for providing the search filter widget which has search field and filter buttons in Mobile view.
part of '../../../page/mobile/mobile_home_page.dart';

class MobileSearchFilter extends GetView<HomeController> {
  final VoidCallback? onButtonTap;

  const MobileSearchFilter({
    super.key,
    this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      leftToRight: context.isArabic ? false : true,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 12.h,
        ),
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
                      hintStyle: AppTextStyles.font12SecondaryBlackCairoMedium,
                      controller: controller.searchController,
                      onChanged: (value) {
                        /*   if (index == 1) {
                            Get.find<AttendanceController>()
                                .searchAttendance(value);
                          } else if (index == 2) {
                            Get.find<RequestsController>().searchRequest(value);
                          } else if (index == 3) {
                            Get.find<ApprovalsController>()
                                .searchApprovalRequest(value);
                          } else if (index == 4) {
                            print('value $value');
                            Get.find<RequestTypeController>()
                                .searchRequestType(value);
                          } else if (index == 5) {
                            Get.find<LocationController>()
                                .searchLocation(value);
                          } */
                      },
                      contentPadding: context.isTablett
                          ? EdgeInsets.symmetric(
                              vertical: 2.h,
                            )
                          : null,
                      prefixIcon: SvgPicture.asset(
                        AppAssets.search,
                        width: 16.0.w,
                        height: 16.0.h,
                      ),
                    ),
                  ),
                ),
              ),
              horizontalSpace(9),
              Row(
                children: [
                  SquaredChipCard(
                    icon: AppAssets.filter,
                    color: AppColors.card,
                    onTap: () {},
                  ),
                  horizontalSpace(9),
                  SquaredChipCard(
                    icon: AppAssets.download,
                    color: AppColors.primary,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
