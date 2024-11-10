part of '../../../pages/tablet/tablet_request_asset_page.dart';

class HorizontalRequestAssetCard extends StatelessWidget {
  final AssetsEntity model;
  const HorizontalRequestAssetCard({
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppAssets.phone, width: 60.w, height: 60.h),
          horizontalSpace(8),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.assetName,
                    style: AppTextStyles.font16BlackCairoRegular,
                  ),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      text: '${'Status'.tr}: ',
                      style: AppTextStyles.font10MediumGreyCairoMedium,
                      children: [
                        TextSpan(
                          text: model.availabilityStatus,
                          style: AppTextStyles.font10BlackCairoMedium.copyWith(
                            color: model.availabilityStatus.getColor,
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
                          text: model.availabilityStatus,
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
              )
            ],
          )
        ],
      ),
    );
  }
}
