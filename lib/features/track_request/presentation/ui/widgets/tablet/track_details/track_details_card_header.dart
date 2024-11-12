part of '../../../pages/tablet/tablet_track_request_details_page.dart';

class TrackDetailsCardHeader extends StatelessWidget {
  final RequestEntity model;
  const TrackDetailsCardHeader({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: '${'Request Type'.tr}: ',
                style: AppTextStyles.font14SecondaryBlackCairoMedium,
                children: [
                  TextSpan(
                    text: model.requestType,
                    style: AppTextStyles.font14BlackCairoMedium,
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: '${'Priority'.tr}: ',
                style: AppTextStyles.font14SecondaryBlackCairoMedium,
                children: [
                  TextSpan(
                    text: model.priority,
                    style: AppTextStyles.font14BlackCairoMedium,
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: '${'Request Delivery'.tr}: ',
                style: AppTextStyles.font14SecondaryBlackCairoMedium,
                children: [
                  TextSpan(
                    text: DateTimeHelper.formatDate(model.dateReturn),
                    style: AppTextStyles.font14BlackCairoMedium,
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: '${'Quantity'.tr}: ',
                style: AppTextStyles.font14SecondaryBlackCairoMedium,
                children: [
                  TextSpan(
                    text: DateTimeHelper.formatInt(model.quantity),
                    style: AppTextStyles.font14BlackCairoMedium,
                  )
                ],
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: '${'Category'.tr}: ',
                style: AppTextStyles.font14SecondaryBlackCairoMedium,
                children: [
                  TextSpan(
                    text: model.assetsEntity.category,
                    style: AppTextStyles.font14BlackCairoMedium,
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: '${'Subcategory'.tr}: ',
                style: AppTextStyles.font14SecondaryBlackCairoMedium,
                children: [
                  TextSpan(
                    text: model.assetsEntity.subcategory,
                    style: AppTextStyles.font14BlackCairoMedium,
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: '${'Model'.tr}: ',
                style: AppTextStyles.font14SecondaryBlackCairoMedium,
                children: [
                  TextSpan(
                    text: model.assetsEntity.model,
                    style: AppTextStyles.font14BlackCairoMedium,
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: '${'Brand'.tr}: ',
                style: AppTextStyles.font14SecondaryBlackCairoMedium,
                children: [
                  TextSpan(
                    text: model.assetsEntity.brand,
                    style: AppTextStyles.font14BlackCairoMedium,
                  )
                ],
              ),
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            text: '${'Request Date'.tr}: ',
            style: AppTextStyles.font14SecondaryBlackCairoMedium,
            children: [
              TextSpan(
                text: DateTimeHelper.formatDate(model.requestDate),
                style: AppTextStyles.font14BlackCairoMedium,
              )
            ],
          ),
        ),
      ],
    );
  }
}
