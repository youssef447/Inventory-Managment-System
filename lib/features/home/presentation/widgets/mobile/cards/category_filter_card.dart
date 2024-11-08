part of '../../../page/mobile/mobile_home_page.dart';

//Youssef Ashraf
// Date: 7/11/2024
///Represents the category filter card as part of category filter row in home page
class MobileCategoryFilterCard extends StatelessWidget {
  final String name;
  final bool selected;
  final int count;
  const MobileCategoryFilterCard({
    super.key,
    required this.name,
    required this.selected,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = context.isTablett;
    return Padding(
      padding: EdgeInsetsDirectional.only(end: context.isTablett ? 37.w : 0),
      child: Row(children: [
        Container(
          height: isTablet ? 48.h : 32.h,
          width: isTablet ? 48.h : 32.h,
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : AppColors.card,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Center(
            child: Text(
              DateTimeHelper.formatInt(count),
              style: isTablet
                  ? AppTextStyles.font20SecondaryBlackSemiBoldCairo.copyWith(
                      fontWeight: selected
                          ? AppFontWeights.semiBold
                          : AppFontWeights.medium,
                      color: selected
                          ? AppColors.textButton
                          : AppColors.inverseBase)
                  : AppTextStyles.font14BlackCairo.copyWith(
                      color: selected
                          ? AppColors.textButton
                          : AppColors.inverseBase,
                      fontWeight: selected
                          ? AppFontWeights.semiBold
                          : AppFontWeights.medium,
                    ),
            ),
          ),
        ),
        horizontalSpace(isTablet ? 16.w : 4.w),
        Text(
          name.tr,
          style: isTablet
              ? AppTextStyles.font20SecondaryBlackSemiBoldCairo.copyWith(
                  fontWeight: selected
                      ? AppFontWeights.semiBold
                      : AppFontWeights.medium,
                  color:
                      selected ? AppColors.textButton : AppColors.inverseBase)
              : AppTextStyles.font14BlackCairo.copyWith(
                  color:
                      selected ? AppColors.textButton : AppColors.inverseBase,
                  fontWeight: selected
                      ? AppFontWeights.semiBold
                      : AppFontWeights.medium,
                ),
        ),
      ]),
    );
  }
}
