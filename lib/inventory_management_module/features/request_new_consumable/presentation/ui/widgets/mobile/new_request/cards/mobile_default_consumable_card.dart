part of '../../../../pages/mobile/mobile_new_request_page.dart';

class MobileDefaultConsumableCard extends GetView<RequestConsumableController> {
  final ConsumablesEntity model;
  final RequestActions requestAction;

  const MobileDefaultConsumableCard(
      {super.key, required this.model, required this.requestAction});

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
                child: Text(
                  model.name,
                  style: AppTextStyles.font14BlackCairoMedium,
                ),
              ),
            ],
          ),
          verticalSpace(3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultRichText(
                      style: AppTextStyles.font12BlackMediumCairo,
                      label: 'Category',
                      value: model.category,
                    ),
                    verticalSpace(3),
                    DefaultRichText(
                      style: AppTextStyles.font12BlackMediumCairo,
                      label: 'Subcategory',
                      value: model.subcategory,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultRichText(
                        labelStyle:
                            AppTextStyles.font12SecondaryBlackCairoMedium,
                        style: AppTextStyles.font12BlackMediumCairo,
                        label: 'Date Recieved',
                        value: DateTimeHelper.formatDate(
                          model.dateReceived,
                        ),
                      ),
                      verticalSpace(3),
                      if (requestAction == RequestActions.returnConsumables)
                        DefaultRichText(
                          labelStyle:
                              AppTextStyles.font12SecondaryBlackCairoMedium,
                          style: AppTextStyles.font12BlackMediumCairo,
                          label: 'Date Return',
                          value: DateTimeHelper.formatDate(
                            model.dateReturn ?? DateTime.now(),
                          ),
                        ),
                      if (requestAction == RequestActions.expiredConsumables)
                        DefaultRichText(
                          labelStyle:
                              AppTextStyles.font12SecondaryBlackCairoMedium,
                          style: AppTextStyles.font12BlackMediumCairo,
                          label: 'Expiration Date',
                          value: DateTimeHelper.formatDate(
                            model.expirationDate ?? DateTime.now(),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
