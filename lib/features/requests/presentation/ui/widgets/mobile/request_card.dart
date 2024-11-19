part of '../../pages/mobile/mobile_requests_page.dart';

class MobileRequestCard extends GetView<RequestsController> {
  final RequestEntity request;
  const MobileRequestCard({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    return SizeAnimation(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(color: AppColors.card),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppAssets.image,
                  width: 65.w,
                  height: 65.h,
                ),
                horizontalSpace(4),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${'Request ID'.tr} : ${DateTimeHelper.formatInt(int.parse(request.requestId))}',
                        style: AppTextStyles.font14BlackCairoMedium,
                      ),
                      verticalSpace(3),
                      Text(
                        '${'Request Type'.tr} : ${request.requestType}',
                        style: AppTextStyles.font12SecondaryBlackCairoMedium,
                      ),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                      text: '${'Status'.tr} :',
                      style: AppTextStyles.font12SecondaryBlackCairoMedium,
                      children: [
                        TextSpan(
                          text: request.status.tr,
                          style: AppTextStyles.font12SecondaryBlackCairoMedium
                              .copyWith(color: request.status.tr.getColor),
                        )
                      ]),
                ),
              ],
            ),
            verticalSpace(3),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                        text: '${'Expected Delivery'.tr} :',
                        style: AppTextStyles.font12SecondaryBlackCairoMedium,
                        children: [
                          TextSpan(
                            text: DateTimeHelper.formatDate(
                                request.expectedRecieved),
                            style: AppTextStyles.font12BlackMediumCairo,
                          )
                        ]),
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                        text: '${'Priority'.tr} :',
                        style: AppTextStyles.font12SecondaryBlackCairoMedium,
                        children: [
                          TextSpan(
                            text: request.priority,
                            style: AppTextStyles.font12BlackMediumCairo,
                          )
                        ]),
                  ),
                ),
              ],
            ),
            verticalSpace(3),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                        text: '${'Quantity'.tr} :',
                        style: AppTextStyles.font12SecondaryBlackCairoMedium,
                        children: [
                          TextSpan(
                            text: DateTimeHelper.formatInt(request.quantity),
                            style: AppTextStyles.font12BlackMediumCairo,
                          )
                        ]),
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: Text(
                    '${'Request Data'.tr} : ${DateTimeHelper.formatDate(request.requestDate)}',
                    style: AppTextStyles.font12SecondaryBlackCairoMedium,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
