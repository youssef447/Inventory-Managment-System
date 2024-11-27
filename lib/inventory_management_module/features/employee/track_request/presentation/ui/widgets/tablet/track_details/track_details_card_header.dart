part of '../../../pages/tablet/tablet_track_request_details_page.dart';

class TrackDetailsCardHeader extends StatelessWidget {
  final RequestEntity model;
  final bool isConsumable;

  const TrackDetailsCardHeader({
    super.key,
    required this.model,
    required this.isConsumable,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: '${'Request Type'.tr}: ',
                  style: AppTextStyles.font14SecondaryBlackCairoMedium,
                  children: [
                    TextSpan(
                      text: model.requestType.getName,
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
                      text: model.priority.tr,
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
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: '${'Category'.tr}: ',
                  style: AppTextStyles.font14SecondaryBlackCairoMedium,
                  children: [
                    TextSpan(
                      text: isConsumable
                          ? model.consumablesEntity!.category
                          : model.assetsEntity!.category,
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
                      text: isConsumable
                          ? model.consumablesEntity!.subcategory
                          : model.assetsEntity!.subcategory,
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
                      text: isConsumable
                          ? model.consumablesEntity!.model
                          : model.assetsEntity!.model,
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
                      text: isConsumable
                          ? model.consumablesEntity!.brand
                          : model.assetsEntity!.brand,
                      style: AppTextStyles.font14BlackCairoMedium,
                    )
                  ],
                ),
              ),
            ],
          ),
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
