import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_font_weights.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/buttons/app_default_button.dart';
import '../../../../../../home/controller/home_controller.dart';
import '../../../../../../home/presentation/widgets/common/horizontal/rectangled_filter_card.dart';
import '../../../../../constants/request_status_constants.dart';

class VerticalRequstsSummaryCircles extends GetView<HomeController> {
  const VerticalRequstsSummaryCircles({super.key});

  @override
  Widget build(BuildContext context) {
    final isRequest = controller.currentCategoryIndex.value == 2;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(2.r)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: context.isPhone ? 10 : 17.r,
                          backgroundColor: RequestStatusConstants
                              .requestsStatus[0].getName.getColor,
                          child: SvgPicture.asset(
                            width: 20.w,
                            height: 20.h,
                            RequestStatusConstants.requestsStatus[0].getAsset,
                          ),
                        ),
                        horizontalSpace(10),
                        Text(
                          RequestStatusConstants.requestsStatus[0].getName.tr,
                          style: context.isPhone
                              ? AppTextStyles.font12DarkGrayCairo
                              : AppTextStyles.font16MediumDarkGreyCairo,
                        ),
                        const Spacer(),
                        //count of current status
                        Text(
                          '05',
                          style: context.isPhone
                              ? AppTextStyles.font14BlackCairoMedium.copyWith(
                                  fontWeight: AppFontWeights.extraBold,
                                )
                              : AppTextStyles.font22BlackBoldCairo,
                        ),
                      ],
                    ),
                    verticalSpace(context.isPhone ? 30 : 10),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: context.isPhone ? 10 : 17.r,
                          backgroundColor: RequestStatusConstants
                              .requestsStatus[1].getName.getColor,
                          child: SvgPicture.asset(
                            width: 16.w,
                            height: 16.h,
                            RequestStatusConstants.requestsStatus[1].getAsset,
                          ),
                        ),
                        horizontalSpace(10),
                        Text(
                          RequestStatusConstants.requestsStatus[1].getName.tr,
                          style: context.isPhone
                              ? AppTextStyles.font12DarkGrayCairo
                              : AppTextStyles.font16MediumDarkGreyCairo,
                        ),
                        const Spacer(),

                        //count of current status
                        Text(
                          '05',
                          style: context.isPhone
                              ? AppTextStyles.font14BlackCairoMedium.copyWith(
                                  fontWeight: AppFontWeights.extraBold,
                                )
                              : AppTextStyles.font22BlackBoldCairo,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            horizontalSpace(context.isPhone ? 7 : 16),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(2.r)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: context.isPhone ? 10 : 17.r,
                          backgroundColor: RequestStatusConstants
                              .requestsStatus[2].getName.getColor,
                          child: SvgPicture.asset(
                            width: 12.w,
                            height: 12.h,
                            RequestStatusConstants.requestsStatus[2].getAsset,
                          ),
                        ),
                        horizontalSpace(10),
                        Text(
                          RequestStatusConstants.requestsStatus[2].getName.tr,
                          style: context.isPhone
                              ? AppTextStyles.font12DarkGrayCairo
                              : AppTextStyles.font16MediumDarkGreyCairo,
                        ),
                        const Spacer(),
                        //count of current status
                        Text(
                          '05',
                          style: context.isPhone
                              ? AppTextStyles.font14BlackCairoMedium.copyWith(
                                  fontWeight: AppFontWeights.extraBold,
                                )
                              : AppTextStyles.font22BlackBoldCairo,
                        ),
                      ],
                    ),
                    verticalSpace(context.isPhone ? 30 : 10),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: context.isPhone ? 10 : 17.r,
                          backgroundColor: RequestStatusConstants
                              .requestsStatus[3].getName.getColor,
                          child: SvgPicture.asset(
                            width: 20.w,
                            height: 20.h,
                            RequestStatusConstants.requestsStatus[3].getAsset,
                          ),
                        ),
                        horizontalSpace(10),
                        Text(
                          RequestStatusConstants.requestsStatus[3].getName.tr,
                          style: context.isPhone
                              ? AppTextStyles.font12DarkGrayCairo
                              : AppTextStyles.font16MediumDarkGreyCairo,
                        ),
                        //count of current status
                        const Spacer(),
                        Text(
                          '05',
                          style: context.isPhone
                              ? AppTextStyles.font14BlackCairoMedium.copyWith(
                                  fontWeight: AppFontWeights.extraBold,
                                )
                              : AppTextStyles.font22BlackBoldCairo,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (isRequest && !context.isTablett)
          Padding(
            padding: EdgeInsets.only(
              top: context.isPhone ? 10.h : 20.h,
            ),
            child: Row(
              children: [
                Expanded(
                  child: AppDefaultButton(
                    text: 'Track Request'.tr,
                    style: context.isPhone
                        ? AppTextStyles.font16BlackMediumCairo
                        : AppTextStyles.font18BlackMediumCairo,
                    onPressed: () {},
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: RectangledFilterCard(
                    image: AppAssets.add,
                    text: 'Request',
                    onTap: () {},
                    color: AppColors.primary,
                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}
