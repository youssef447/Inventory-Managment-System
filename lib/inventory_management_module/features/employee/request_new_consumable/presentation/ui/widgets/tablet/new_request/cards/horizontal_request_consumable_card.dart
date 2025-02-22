part of '../../../../pages/tablet/tablet_new_request_page.dart';

//Youssef Ashraf
///Represents The Horizontal Default (Request Consumable Actions) Consumable Card in Horizontal Tablet View
class HorizontalRequestConsumableCard extends StatelessWidget {
  final ConsumablesEntity model;
  const HorizontalRequestConsumableCard({
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
                width: 45.w,
                height: 60.h,
                fit: BoxFit.fill,
              ),
              horizontalSpace(8),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model.name,
                          style: AppTextStyles.font16BlackCairoRegular,
                        ),
                        const Spacer(),
                        RichText(
                          text: TextSpan(
                            text: '${'Status'.tr}: ',
                            style: AppTextStyles.font10MediumGreyCairoMedium,
                            children: [
                              TextSpan(
                                text: model.status,
                                style: AppTextStyles.font10BlackCairoMedium
                                    .copyWith(
                                  color: model.status.getColor,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    verticalSpace(3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '${'Category'.tr}: ',
                            style: AppTextStyles.font12MediumGreyCairoMedium,
                            children: [
                              TextSpan(
                                text: model.category,
                                style: AppTextStyles.font12MediumGreyCairoMedium
                                    .copyWith(
                                  color: AppColors.darkWhiteShadow,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        RichText(
                          text: TextSpan(
                            text: '${'Specifications'.tr}: ',
                            style: AppTextStyles.font12MediumGreyCairoMedium,
                            children: [
                              TextSpan(
                                text: 'Download'.tr,
                                style: AppTextStyles.font12MediumGreyCairoMedium
                                    .copyWith(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '${'Sub Category'.tr}: ',
                            style: AppTextStyles.font12MediumGreyCairoMedium,
                            children: [
                              TextSpan(
                                text: model.subcategory,
                                style: AppTextStyles.font12MediumGreyCairoMedium
                                    .copyWith(
                                  color: AppColors.darkWhiteShadow,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        RichText(
                          text: TextSpan(
                            text: '${'Available Stock'.tr}: ',
                            style: AppTextStyles.font12MediumGreyCairoMedium,
                            children: [
                              TextSpan(
                                text: DateTimeHelper.formatInt(
                                  model.availableQuantity,
                                ),
                                style: AppTextStyles.font12MediumGreyCairoMedium
                                    .copyWith(
                                  color: AppColors.darkWhiteShadow,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: '${'Requires Approvals'.tr}: ',
                  style: AppTextStyles.font12MediumGreyCairoMedium,
                  children: [
                    TextSpan(
                      text: model.requiresApproval ? 'Yes'.tr : 'No'.tr,
                      style: AppTextStyles.font12MediumGreyCairoMedium.copyWith(
                        color: AppColors.darkWhiteShadow,
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              RichText(
                text: TextSpan(
                  text: '${'Last Update'.tr}: ',
                  style: AppTextStyles.font12MediumGreyCairoMedium,
                  children: [
                    TextSpan(
                      text: DateTimeHelper.formatDate(model.lastUpdate),
                      style: AppTextStyles.font12MediumGreyCairoMedium.copyWith(
                        color: AppColors.darkWhiteShadow,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
