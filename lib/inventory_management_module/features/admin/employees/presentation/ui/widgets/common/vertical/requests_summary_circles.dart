import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';

import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_font_weights.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';

import '../../../../../constants/ids.dart';
import '../../../../controller/employee_details_controller.dart';

//Youssef Ashraf
///Represents (mobille & vertical tablet ) Requsts Summary Circles weather Requests are pending , Approved ,etc..
class VerticalRequstsSummaryCircles extends GetView<EmployeeDetailsController> {
  const VerticalRequstsSummaryCircles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<EmployeeDetailsController>(
            id: AdminEmployeesIds.summaryCircles,
            builder: (controller) {
              return Row(
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
                                backgroundColor:
                                    RequestStatus.values[0].getName.tr.getColor,
                                child: SvgPicture.asset(
                                  width: 20.w,
                                  height: 20.h,
                                  RequestStatus.values[0].getAsset,
                                ),
                              ),
                              horizontalSpace(10),
                              Text(
                                RequestStatus.values[0].getName.tr,
                                style: context.isPhone
                                    ? AppTextStyles.font12DarkGrayCairo
                                    : AppTextStyles.font16MediumDarkGreyCairo,
                              ),
                              const Spacer(),
                              //count of current status
                              Text(
                                DateTimeHelper.formatInt(
                                  controller
                                      .getRequestNumbers(
                                          RequestStatus.values[0])
                                      .length,
                                ),
                                style: context.isPhone
                                    ? AppTextStyles.font14BlackCairoMedium
                                        .copyWith(
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
                                backgroundColor:
                                    RequestStatus.values[1].getName.tr.getColor,
                                child: SvgPicture.asset(
                                  width: 12.w,
                                  height: 12.h,
                                  RequestStatus.values[1].getAsset,
                                ),
                              ),
                              horizontalSpace(10),
                              Text(
                                RequestStatus.values[1].getName.tr,
                                style: context.isPhone
                                    ? AppTextStyles.font12DarkGrayCairo
                                    : AppTextStyles.font16MediumDarkGreyCairo,
                              ),
                              const Spacer(),

                              //count of current status
                              Text(
                                DateTimeHelper.formatInt(
                                  controller
                                      .getRequestNumbers(
                                          RequestStatus.values[1])
                                      .length,
                                ),
                                style: context.isPhone
                                    ? AppTextStyles.font14BlackCairoMedium
                                        .copyWith(
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
                                backgroundColor:
                                    RequestStatus.values[2].getName.tr.getColor,
                                child: SvgPicture.asset(
                                  width: 12.w,
                                  height: 12.h,
                                  RequestStatus.values[2].getAsset,
                                ),
                              ),
                              horizontalSpace(10),
                              Text(
                                RequestStatus.values[2].getName.tr,
                                style: context.isPhone
                                    ? AppTextStyles.font12DarkGrayCairo
                                    : AppTextStyles.font16MediumDarkGreyCairo,
                              ),
                              const Spacer(),
                              //count of current status
                              Text(
                                DateTimeHelper.formatInt(
                                  controller
                                      .getRequestNumbers(
                                          RequestStatus.values[2])
                                      .length,
                                ),
                                style: context.isPhone
                                    ? AppTextStyles.font14BlackCairoMedium
                                        .copyWith(
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
                                backgroundColor:
                                    RequestStatus.values[3].getName.tr.getColor,
                                child: SvgPicture.asset(
                                  width: 16.w,
                                  height: 16.h,
                                  RequestStatus.values[3].getAsset,
                                ),
                              ),
                              horizontalSpace(10),
                              Text(
                                RequestStatus.values[3].getName.tr,
                                style: context.isPhone
                                    ? AppTextStyles.font12DarkGrayCairo
                                    : AppTextStyles.font16MediumDarkGreyCairo,
                              ),
                              //count of current status
                              const Spacer(),
                              Text(
                                DateTimeHelper.formatInt(
                                  controller
                                      .getRequestNumbers(
                                          RequestStatus.values[3])
                                      .length,
                                ),
                                style: context.isPhone
                                    ? AppTextStyles.font14BlackCairoMedium
                                        .copyWith(
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
              );
            }),
      ],
    );
  }
}
