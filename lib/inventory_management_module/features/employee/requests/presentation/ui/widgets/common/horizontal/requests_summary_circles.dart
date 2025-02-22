import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../constants/ids_constants.dart';
import '../../../../controller/requests_controller.dart';

//Youssef Ashraf
///Represents (windows & tablet landscape )  Requsts Summary Circles weather Requests are pending , Approved ,etc..
class HorizontalRequstsSummaryCircles extends GetView<RequestsController> {
  const HorizontalRequstsSummaryCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestsController>(
        id: RequestsIds.summaryCircles,
        builder: (controller) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
            decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(2.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                RequestStatus.values.length - 2,
                (index) {
                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 17.r,
                        backgroundColor:
                            RequestStatus.values[index].getName.tr.getColor,
                        child: SvgPicture.asset(
                          RequestStatus.values[index].getAsset,
                          width: index == 0 ? 24.w : 16.w,
                          height: index == 0 ? 24.h : 16.h,
                        ),
                      ),
                      horizontalSpace(10),
                      Text(
                        RequestStatus.values[index].getName.tr,
                        style: AppTextStyles.font16MediumDarkGreyCairo,
                      ),
                      horizontalSpace(30),
                      //count of current status
                      Text(
                        DateTimeHelper.formatInt(
                          controller.getPendingRequestNumbers(
                            RequestStatus.values[index],
                          ),
                        ),
                        style: AppTextStyles.font22BlackBoldCairo,
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        });
  }
}
