// by : mohamed ashraf

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../controller/assets_controller.dart';

class MobileAssetsCard extends GetView<AssetsController> {
  final int index;

  const MobileAssetsCard({
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
                    '${'Asset ID'.tr} : ${controller.assetsList[index].assetId}',
                    style: AppTextStyles.font14BlackCairoMedium,
                  ),
                  verticalSpace(3),
                  RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                        text: '${'Assets Name'.tr} : ',
                        style: AppTextStyles.font12SecondaryBlackCairoMedium,
                        children: [
                          TextSpan(
                              text: controller.assetsList[index].brand +
                                  controller.assetsList[index].model,
                              style: AppTextStyles.font12BlackCairo)
                        ]),
                  ),
                ],
              ),
              Expanded(
                child: RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                      text: '${'Status'.tr} : ',
                      style: AppTextStyles.font12SecondaryBlackCairoMedium,
                      children: [
                        TextSpan(
                          text: controller.assetsList[index].status,
                          style: AppTextStyles.font12SecondaryBlackCairoMedium
                              .copyWith(
                                  color: controller
                                      .assetsList[index].status.getColor),
                        )
                      ]),
                ),
              ),
            ],
          ),
          verticalSpace(3),
          RichText(
            text: TextSpan(
                text: '${'Category'.tr} : ',
                style: AppTextStyles.font12SecondaryBlackCairoMedium,
                children: [
                  TextSpan(
                      text: controller.assetsList[index].category,
                      style: AppTextStyles.font12BlackMediumCairo)
                ]),
          ),
          verticalSpace(3),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: '${'Quantity'.tr} : ',
                    style: AppTextStyles.font12SecondaryBlackCairoMedium,
                    children: [
                      TextSpan(
                        text: controller.assetsList[index].quantity,
                        style: AppTextStyles.font12BlackMediumCairo,
                      )
                    ]),
              ),
              const Spacer(),
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: '${'Date Receive'.tr} : ',
                    style: AppTextStyles.font12SecondaryBlackCairoMedium,
                    children: [
                      TextSpan(
                        text: DateTimeHelper.formatDate(
                            controller.assetsList[index].dateReceived),
                        style: AppTextStyles.font12BlackMediumCairo,
                      )
                    ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
