part of '../../../pages/tablet/tablet_new_order_page.dart';

class TabletProductSearchFilter extends GetView<NewOrderController> {
  const TabletProductSearchFilter({super.key});

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
        if (!context.isLandscapee)
          SquaredChipCard(
            icon: AppAssets.filter,
            color: AppColors.card,
            onTap: () {
              GetDialogHelper.generalDialog(
                context: context,
                child: const SizedBox(),
              );
            },
          ),
        if (context.isLandscapee)
          RectangledFilterCard(
            image: AppAssets.filter,
            color: AppColors.card,
            text: 'Fitler'.tr,
            onTap: () {
              GetDialogHelper.generalDialog(
                context: context,
                child: const SizedBox(),
              );
            },
          ),
        horizontalSpace(9),
        RectangledFilterCard(
          color: AppColors.primary,
          text: 'New Product',
          width: 142.w,
          image: AppAssets.add,
          onTap: () {
            GetDialogHelper.generalDialog(
              child: const AddProductDialog(),
              context: context,
            );
          },
        ),
      ],
    );
  }
}
