part of '../../../../pages/tablet/tablet_new_request_page.dart';

class VerticalRequestAssetCard extends StatelessWidget {
  final AssetsEntity model;

  const VerticalRequestAssetCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                model.image,
                width: 65.w,
                height: 65.h,
                fit: BoxFit.fill,
              ),
              horizontalSpace(8),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.assetName,
                      style: AppTextStyles.font16BlackCairoRegular,
                    ),
                    const Spacer(),
                    DefaultRichText(
                      labelStyle: AppTextStyles.font12SecondaryBlackCairoMedium,
                      style: AppTextStyles.font12BlackMediumCairo,
                      label: 'Status',
                      valueColor: model.availabilityStatus.getColor,
                      value: model.availabilityStatus,
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(3),
          DefaultRichText(
            labelStyle: AppTextStyles.font12SecondaryBlackCairoMedium,
            style: AppTextStyles.font12BlackMediumCairo,
            label: 'Requires Approvals',
            value: model.requiresApprovals ? 'Yes'.tr : 'No'.tr,
          ),
          verticalSpace(3),
          DefaultRichText(
            labelStyle: AppTextStyles.font12SecondaryBlackCairoMedium,
            style: AppTextStyles.font12BlackMediumCairo,
            label: 'Category',
            value: model.category,
          ),
          verticalSpace(3),
          DefaultRichText(
            labelStyle: AppTextStyles.font12SecondaryBlackCairoMedium,
            style: AppTextStyles.font12BlackMediumCairo,
            label: 'Subcategory',
            value: model.subcategory,
          ),
          verticalSpace(3),
          RichText(
            text: TextSpan(
              text: '${'Specifications'.tr}: ',
              style: AppTextStyles.font14SecondaryBlackCairoMedium,
              children: [
                TextSpan(
                  text: 'Download'.tr,
                  style: AppTextStyles.font14BlackCairoMedium.copyWith(
                    decoration: TextDecoration.underline,
                    color: AppColors.blue,
                  ),
                )
              ],
            ),
          ),
          verticalSpace(3),
          DefaultRichText(
            labelStyle: AppTextStyles.font12SecondaryBlackCairoMedium,
            style: AppTextStyles.font12BlackMediumCairo,
            label: 'Available Stock',
            value: DateTimeHelper.formatInt(model.availableQuantity),
          ),
          verticalSpace(3),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: DefaultRichText(
              labelStyle: AppTextStyles.font12SecondaryBlackCairoMedium,
              style: AppTextStyles.font12BlackMediumCairo,
              label: 'Last Update',
              value: DateTimeHelper.formatDate(model.lastUpdate),
            ),
          )
        ],
      ),
    );
  }
}
