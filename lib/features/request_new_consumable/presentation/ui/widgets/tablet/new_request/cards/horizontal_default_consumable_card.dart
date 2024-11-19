part of '../../../../pages/tablet/tablet_new_request_page.dart';

//Youssef Ashraf
///Represents The Horizontal Default (Return and Expiration Consumables Actions) Consumable Card in Horizontal Tablet View
class HorizontalDefaultConsumableCard
    extends GetView<RequestConsumableController> {
  final ConsumablesEntity model;
  const HorizontalDefaultConsumableCard({
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                model.image,
                width: 45.w,
                height: 60.h,
                fit: BoxFit.fill,
              ),
              horizontalSpace(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: AppTextStyles.font16BlackCairoRegular,
                    ),
                    verticalSpace(3),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultRichText(
                                labelStyle: AppTextStyles
                                    .font12SecondaryBlackCairoMedium,
                                style: AppTextStyles.font12BlackMediumCairo,
                                label: 'Category',
                                value: model.status,
                              ),
                              DefaultRichText(
                                labelStyle: AppTextStyles
                                    .font12SecondaryBlackCairoMedium,
                                style: AppTextStyles.font12BlackMediumCairo,
                                label: 'Subcategory',
                                value: model.subcategory,
                              ),
                            ],
                          ),
                        ),
                        horizontalSpace(3),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultRichText(
                                labelStyle: AppTextStyles
                                    .font12SecondaryBlackCairoMedium,
                                style: AppTextStyles.font12BlackMediumCairo,
                                label: 'Date Recieved',
                                value: DateTimeHelper.formatDate(
                                  model.dateReceived,
                                ),
                              ),
                              if (controller.requestAction ==
                                  RequestActions.returnConsumables)
                                DefaultRichText(
                                  labelStyle: AppTextStyles
                                      .font12SecondaryBlackCairoMedium,
                                  style: AppTextStyles.font12BlackMediumCairo,
                                  label: 'Date Return',
                                  value: DateTimeHelper.formatDate(
                                    model.dateReturn ?? DateTime.now(),
                                  ),
                                ),
                              if (controller.requestAction ==
                                  RequestActions.expiredConsumables)
                                DefaultRichText(
                                  labelStyle: AppTextStyles
                                      .font12SecondaryBlackCairoMedium,
                                  style: AppTextStyles.font12BlackMediumCairo,
                                  label: 'Expiration Date',
                                  value: DateTimeHelper.formatDate(
                                    model.expirationDate ?? DateTime.now(),
                                  ),
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
