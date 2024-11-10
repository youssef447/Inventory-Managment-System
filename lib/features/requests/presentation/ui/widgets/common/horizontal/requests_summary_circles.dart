import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../constants/request_status_constants.dart';
import '../../../../controller/requests_controller.dart';

class HorizontalRequstsSummaryCircles extends GetView<RequestsController> {
  const HorizontalRequstsSummaryCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
      decoration: BoxDecoration(
          color: AppColors.card, borderRadius: BorderRadius.circular(2.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          RequestStatusConstants.requestsStatus.length,
          (index) {
            return Row(
              children: [
                CircleAvatar(
                  radius: 17.r,
                  backgroundColor: RequestStatusConstants
                      .requestsStatus[index].getName.getColor,
                  child: SvgPicture.asset(
                    RequestStatusConstants.requestsStatus[index].getAsset,
                  ),
                ),
                horizontalSpace(10),
                Text(
                  RequestStatusConstants.requestsStatus[index].getName.tr,
                  style: AppTextStyles.font16MediumDarkGreyCairo,
                ),
                horizontalSpace(30),
                //count of current status
                Text(
                  '05',
                  style: AppTextStyles.font22BlackBoldCairo,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
