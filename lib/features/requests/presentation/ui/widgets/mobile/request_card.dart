part of '../../pages/mobile/mobile_requests_page.dart';

class MobileRequestCard extends GetView<RequestsController> {
  final int index;
  const MobileRequestCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${'Request ID'.tr} : ${DateTimeHelper.formatInt(int.parse(controller.requests[index].requestId))}',
                    style: AppTextStyles.font14BlackCairoMedium,
                  ),
                  verticalSpace(3),
                  Text(
                    '${'Request Type'.tr} : ${controller.requests[index].requestType}',
                    style: AppTextStyles.font12SecondaryBlackCairoMedium,
                  ),
                ],
              ),
              Expanded(
                child: RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                      text: '${'Status'.tr} :',
                      style: AppTextStyles.font12SecondaryBlackCairoMedium,
                      children: [
                        TextSpan(
                          text: controller.requests[index].status.tr,
                          style: AppTextStyles.font12SecondaryBlackCairoMedium
                              .copyWith(
                                  color: controller
                                      .requests[index].status.tr.getColor),
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
                      text: '${'Expected Delivery'.tr} :',
                      style: AppTextStyles.font12SecondaryBlackCairoMedium,
                      children: [
                        TextSpan(
                          text: DateTimeHelper.formatDate(
                              controller.requests[index].expectedRecieved),
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
                          text: controller.requests[index].priority,
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
                          text: DateTimeHelper.formatInt(
                              controller.requests[index].quantity),
                          style: AppTextStyles.font12BlackMediumCairo,
                        )
                      ]),
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: Text(
                  '${'Request Data'.tr} : ${DateTimeHelper.formatDate(controller.requests[index].requestDate)}',
                  style: AppTextStyles.font12SecondaryBlackCairoMedium,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
