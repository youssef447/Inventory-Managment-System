part of '../../../../pages/tablet/tablet_new_request_page.dart';

class VerticalDefaultAssetCard extends GetView<RequestAssetsController> {
  final AssetsEntity model;

  const VerticalDefaultAssetCard({
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
            children: [
              Image.asset(
                model.image,
                width: 45.w,
                height: 60.h,
                fit: BoxFit.fill,
              ),
              horizontalSpace(8),
              Expanded(
                child: Text(
                  model.assetName,
                  style: AppTextStyles.font16BlackCairoRegular,
                ),
              ),
            ],
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
          DefaultRichText(
            labelStyle: AppTextStyles.font12SecondaryBlackCairoMedium,
            style: AppTextStyles.font12BlackMediumCairo,
            label: 'Date Recieved',
            value: DateTimeHelper.formatDate(
              model.dateReceived,
            ),
          ),
          verticalSpace(3),
          if (controller.requestAction == RequestActions.returnAsset)
            DefaultRichText(
              labelStyle: AppTextStyles.font12SecondaryBlackCairoMedium,
              style: AppTextStyles.font12BlackMediumCairo,
              label: 'Date Return',
              value: DateTimeHelper.formatDate(
                model.dateReturn ?? DateTime.now(),
              ),
            ),
          if (controller.requestAction == RequestActions.routineMaintenance ||
              controller.requestAction == RequestActions.repairAsset)
            DefaultRichText(
              labelStyle: AppTextStyles.font12SecondaryBlackCairoMedium,
              style: AppTextStyles.font12BlackMediumCairo,
              label: 'Maintenance Frequency',
              value: model.maintenanceFrequency ?? 'Not Applicable',
            ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: DefaultRichText(
              labelStyle: AppTextStyles.font12SecondaryBlackCairoMedium,
              style: AppTextStyles.font12BlackMediumCairo,
              label: 'Last Update',
              value: DateTimeHelper.formatDate(model.lastUpdate),
            ),
          ),
        ],
      ),
    );
  }
}
