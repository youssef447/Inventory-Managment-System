part of '../../../../pages/tablet/tablet_track_requests_page.dart';

class HorizontalTrackRequestCard extends StatelessWidget {
  final RequestEntity model;

  const HorizontalTrackRequestCard({
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
                model.assetsEntity.image,
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
                      model.assetsEntity.assetName,
                      style: AppTextStyles.font16BlackCairoRegular,
                    ),
                    verticalSpace(2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '${'Request ID'.tr}: ',
                            style: AppTextStyles.font14BlackCairoMedium,
                            children: [
                              TextSpan(
                                text: model.requestId,
                                style: AppTextStyles
                                    .font12darkWhiteShadowCairoMedium,
                              )
                            ],
                          ),
                        ),
                        horizontalSpace(4),
                        Flexible(
                          child: RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: '${'Request Type'.tr}: ',
                              style: AppTextStyles.font14BlackCairoMedium,
                              children: [
                                TextSpan(
                                  text: model.requestType,
                                  style: AppTextStyles
                                      .font12darkWhiteShadowCairoMedium,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        text: '${'Request Date'.tr}: ',
                        style: AppTextStyles.font14BlackCairoMedium,
                        children: [
                          TextSpan(
                            text: DateTimeHelper.formatDate(model.requestDate),
                            style:
                                AppTextStyles.font12darkWhiteShadowCairoMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: RichText(
              text: TextSpan(
                text: '${'Last Update'.tr}: ',
                style: AppTextStyles.font14BlackCairoMedium,
                children: [
                  TextSpan(
                    text: DateTimeHelper.formatDate(
                        model.assetsEntity.lastUpdate),
                    style: AppTextStyles.font12darkWhiteShadowCairoMedium,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
