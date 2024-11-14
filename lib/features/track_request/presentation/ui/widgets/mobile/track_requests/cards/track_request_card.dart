part of '../../../../pages/mobile/mobile_track_requests_page.dart';

class MobileTrackRequestCard extends StatelessWidget {
  final RequestEntity model;

  const MobileTrackRequestCard({
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
                model.assetsEntity!.image,
                /* width: 60.w,
                height: 60.h, */
                fit: BoxFit.fill,
              ),
              horizontalSpace(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          model.assetsEntity!.assetName,
                          style: AppTextStyles.font14BlackCairoRegular,
                        ),
                        const Spacer(),
                        RichText(
                          text: TextSpan(
                            text: '${'Request Date'.tr}: ',
                            style:
                                AppTextStyles.font12BlackMediumCairo.copyWith(
                              fontSize: 11.sp,
                            ),
                            children: [
                              TextSpan(
                                text: DateTimeHelper.formatDate(
                                  model.requestDate,
                                ),
                                style: AppTextStyles
                                    .font10SecondaryBlackCairoMedium
                                    .copyWith(
                                  fontSize: 11.sp,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    verticalSpace(3),
                    RichText(
                      text: TextSpan(
                        text: '${'Request ID'.tr}: ',
                        style: AppTextStyles.font12BlackMediumCairo.copyWith(
                          fontSize: 11.sp,
                        ),
                        children: [
                          TextSpan(
                            text: model.requestId,
                            style: AppTextStyles.font10SecondaryBlackCairoMedium
                                .copyWith(
                              fontSize: 11.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '${'Request Name'.tr}: ',
                        style: AppTextStyles.font12BlackMediumCairo.copyWith(
                          fontSize: 11.sp,
                        ),
                        children: [
                          TextSpan(
                            text: model.assetsEntity!.model,
                            style: AppTextStyles.font10SecondaryBlackCairoMedium
                                .copyWith(
                              fontSize: 11.sp,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(3),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: RichText(
              text: TextSpan(
                text: '${'Last Update'.tr}: ',
                style: AppTextStyles.font12BlackMediumCairo,
                children: [
                  TextSpan(
                    text: DateTimeHelper.formatDate(
                        model.assetsEntity!.lastUpdate),
                    style: AppTextStyles.font10SecondaryBlackCairoMedium,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
