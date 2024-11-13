part of '../../../../pages/tablet/tablet_new_request_page.dart';

class HorizontalDefaultAssetCard extends GetView<RequestAssetsController> {
  final AssetsEntity model;
  const HorizontalDefaultAssetCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                model.image,
                /* width: 60.w,
                height: 60.h, */
                fit: BoxFit.fill,
              ),
              horizontalSpace(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.assetName,
                      style: AppTextStyles.font16BlackCairoRegular,
                    ),
                    verticalSpace(3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultRichText(
                              labelStyle:
                                  AppTextStyles.font12SecondaryBlackCairoMedium,
                              style: AppTextStyles.font12BlackMediumCairo,
                              label: 'Category',
                              value: model.availabilityStatus,
                            ),
                            DefaultRichText(
                              labelStyle:
                                  AppTextStyles.font12SecondaryBlackCairoMedium,
                              style: AppTextStyles.font12BlackMediumCairo,
                              label: 'Subcategory',
                              value: model.subcategory,
                            ),
                          ],
                        ),
                        horizontalSpace(3),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultRichText(
                                labelStyle: AppTextStyles
                                    .font12SecondaryBlackCairoMedium,
                                style: AppTextStyles.font12BlackMediumCairo,
                                label: 'Date Recieved',
                                value: DateTimeHelper.formatDate(
                                    model.dateReceived),
                              ),
                              if (controller.requestAction ==
                                      RequestActions.routineMaintenance ||
                                  controller.requestAction ==
                                      RequestActions.repairAsset)
                                DefaultRichText(
                                  labelStyle: AppTextStyles
                                      .font12SecondaryBlackCairoMedium,
                                  style: AppTextStyles.font12BlackMediumCairo,
                                  label: 'Maintenance Frequency',
                                  value: model.maintenanceFrequency ??
                                      'Not Applicable',
                                ),
                              if (controller.requestAction ==
                                  RequestActions.returnAsset)
                                DefaultRichText(
                                  labelStyle: AppTextStyles
                                      .font12SecondaryBlackCairoMedium,
                                  style: AppTextStyles.font12BlackMediumCairo,
                                  label: 'Date Return',
                                  value: DateTimeHelper.formatDate(
                                      model.dateReturn ?? DateTime.now()),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
