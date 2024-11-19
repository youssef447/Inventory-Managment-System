part of '../../../../pages/tablet/tablet_track_requests_page.dart';

class VerticalTrackRequestCard extends StatelessWidget {
  final RequestEntity model;
  final bool isConsumable;

  const VerticalTrackRequestCard({
    super.key,
    required this.model,
    required this.isConsumable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 12.w,
        right: 12.w,
        top: 12.h,
        bottom: 8.h,
      ),
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
                isConsumable
                    ? model.consumablesEntity!.image
                    : model.assetsEntity!.image,
                fit: BoxFit.fill,
                width: 45.w,
                height: 60.h,
              ),
              horizontalSpace(8),
              Expanded(
                child: Text(
                  isConsumable
                      ? model.consumablesEntity!.name
                      : model.assetsEntity!.assetName,
                  style: AppTextStyles.font16BlackCairoRegular,
                ),
              ),
            ],
          ),
          verticalSpace(10),
          RichText(
            text: TextSpan(
              text: '${'Request ID'.tr}: ',
              style: AppTextStyles.font14BlackCairoMedium,
              children: [
                TextSpan(
                  text: model.requestId,
                  style: AppTextStyles.font14darkWhiteShadowCairoMedium,
                )
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: '${'Request Type'.tr}: ',
              style: AppTextStyles.font14BlackCairoMedium,
              children: [
                TextSpan(
                  text: model.requestType,
                  style: AppTextStyles.font14darkWhiteShadowCairoMedium,
                )
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: '${'Request Date'.tr}: ',
              style: AppTextStyles.font14BlackCairoMedium,
              children: [
                TextSpan(
                  text: DateTimeHelper.formatDate(model.requestDate),
                  style: AppTextStyles.font14darkWhiteShadowCairoMedium,
                )
              ],
            ),
          ),
          verticalSpace(14),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: RichText(
              text: TextSpan(
                text: '${'Last Update'.tr}: ',
                style: AppTextStyles.font14BlackCairoMedium,
                children: [
                  TextSpan(
                    text: DateTimeHelper.formatDate(
                      isConsumable
                          ? model.consumablesEntity!.lastUpdate
                          : model.assetsEntity!.lastUpdate,
                    ),
                    style: AppTextStyles.font14darkWhiteShadowCairoMedium,
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
