import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_font_weights.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/buttons/app_default_button.dart';
import '../../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../../../home/controller/home_controller.dart';
import '../../../../../constants/request_status_constants.dart';
import '../../../../controller/requests_controller.dart';

class VerticalRequstsSummaryCircles extends GetView<HomeController> {
  const VerticalRequstsSummaryCircles({super.key});

  @override
  Widget build(BuildContext context) {
    final isRequest = controller.currentCategoryIndex.value == 2;
    final requestController = Get.find<RequestsController>();

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
                              .requestsStatus[0].getName.tr.getColor,
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
                              .requestsStatus[1].getName.tr.getColor,
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
                              .requestsStatus[2].getName.tr.getColor,
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
                              .requestsStatus[3].getName.tr.getColor,
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
                    onPressed: () => Get.toNamed(Routes.trackRequest),
                  ),
                ),
                horizontalSpace(10),
                Obx(
                  () => Expanded(
                    child: AppDropdown(
                      showDropdownIcon: false,
                      image: AppAssets.add,
                      textAlign: TextAlign.center,
                      width: 112.w,
                      style: context.isPhone
                          ? AppTextStyles.font16BlackMediumCairo
                              .copyWith(color: AppColors.textButton)
                          : AppTextStyles.font18BlackMediumCairo
                              .copyWith(color: AppColors.textButton),
                      color: AppColors.primary,
                      height: 37.h,
                      onChanged: (value) {
                        Get.toNamed(
                          Routes.requestAsset,
                          arguments: {'action': value},
                        );
                      },
                      items: List.generate(
                        requestController.currentCategoryIndex.value == 0
                            ? controller.requestAssetActions.length
                            : controller.requestConsumablesActions.length,
                        (index) {
                          return DropdownMenuItem(
                            alignment: AlignmentDirectional.centerStart,
                            value: requestController
                                        .currentCategoryIndex.value ==
                                    0
                                ? controller.requestAssetActions[index]
                                : controller.requestConsumablesActions[index],
                            child: Text(
                              requestController.currentCategoryIndex.value == 0
                                  ? controller
                                      .requestAssetActions[index].getName
                                  : controller
                                      .requestConsumablesActions[index].getName,
                              style:
                                  AppTextStyles.font14SecondaryBlackCairoMedium,
                            ),
                          );
                        },
                      ),
                      textButton: 'Request'.tr,
                    ),
                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}
