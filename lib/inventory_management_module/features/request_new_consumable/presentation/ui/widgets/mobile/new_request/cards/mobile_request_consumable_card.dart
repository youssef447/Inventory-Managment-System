part of '../../../../pages/mobile/mobile_new_request_page.dart';

class MobileRequestConsumableCard extends StatelessWidget {
  final ConsumablesEntity model;

  const MobileRequestConsumableCard({
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
                width: 45.w,
                height: 60.h,
                fit: BoxFit.fill,
              ),
              horizontalSpace(8),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      model.name,
                      style: AppTextStyles.font14BlackCairoMedium,
                    ),
                    const Spacer(),
                    DefaultRichText(
                      style: AppTextStyles.font12BlackMediumCairo,
                      label: 'Status',
                      value: model.status,
                    ),
                  ],
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
                    verticalSpace(3),
                    DefaultRichText(
                      style: AppTextStyles.font12BlackMediumCairo,
                      label: 'Requires Approvals',
                      value: model.requiresApproval ? 'Yes'.tr : 'No'.tr,
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
                      RichText(
                        text: TextSpan(
                          text: '${'Specifications'.tr}: ',
                          style: AppTextStyles.font12SecondaryBlackCairoMedium,
                          children: [
                            TextSpan(
                              text: 'Download'.tr,
                              style:
                                  AppTextStyles.font12BlackMediumCairo.copyWith(
                                decoration: TextDecoration.underline,
                                color: AppColors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                      verticalSpace(3),
                      DefaultRichText(
                        style: AppTextStyles.font12BlackMediumCairo,
                        label: 'Available Stock',
                        value:
                            DateTimeHelper.formatInt(model.availableQuantity),
                      ),
                      verticalSpace(3),
                      DefaultRichText(
                        style: AppTextStyles.font12BlackMediumCairo,
                        label: 'Last Update',
                        value: DateTimeHelper.formatDate(model.lastUpdate),
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
