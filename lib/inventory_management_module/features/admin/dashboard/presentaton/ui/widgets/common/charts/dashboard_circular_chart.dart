// By: Youssef Ashraf

// Objectives: This file is responsible for providing a chart widget that displays the requests data in the dashboard.

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../core/extensions/extensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../domain/chart_data_entity.dart';

class DashboardCircularChart extends StatelessWidget {
  final int totalCount;
  final List<ChartDataEntity> data;
  final double? width;
  final double? height;
  final String title, circleTitle, circleImage;

  const DashboardCircularChart({
    super.key,
    required this.totalCount,
    required this.data,
    required this.title,
    required this.circleTitle,
    required this.circleImage,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    var isTablet = context.isTablett;

    return data.isEmpty
        ? const NoDataGif()
        : Container(
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.primary,
                        radius: 13.r,
                        child: SvgPicture.asset(
                          circleImage,
                          color: AppColors.icon,
                        ),
                      ),
                      horizontalSpace(4),
                      Text(
                        title,
                        style: AppTextStyles.font16BlackRegularCairo,
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.chatBackground,
                    thickness: 1.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: width,
                              height: height,
                              child: SfCircularChart(
                                margin: EdgeInsets.zero,
                                series: <CircularSeries<ChartDataEntity,
                                    String>>[
                                  DoughnutSeries<ChartDataEntity, String>(
                                    innerRadius: '70%',
                                    dataSource: data,
                                    pointColorMapper:
                                        (ChartDataEntity data, _) =>
                                            data.chartItemColor,
                                    xValueMapper: (ChartDataEntity data, _) =>
                                        data.xAxisLabel,
                                    yValueMapper: (ChartDataEntity data, _) =>
                                        data.yAxisLabel,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateTimeHelper.formatInt(totalCount),
                                    style: isTablet
                                        ? AppTextStyles
                                            .font16SecondaryBlackCairo
                                        : AppTextStyles
                                            .font12SecondaryBlackCairoMedium,
                                  ),
                                  verticalSpace(10),
                                  Text(
                                    circleTitle.tr,
                                    style: isTablet
                                        ? context.isLandscapee
                                            ? AppTextStyles
                                                .font16SecondaryBlackCairo
                                            : AppTextStyles
                                                .font12BlackMediumCairo
                                        : AppTextStyles
                                            .font12SecondaryBlackCairoMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...data.map(
                              (e) => Padding(
                                padding: EdgeInsetsDirectional.only(
                                  bottom: 16.h,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 11.w,
                                      height: 11.h,
                                      decoration: BoxDecoration(
                                        color: e.chartItemColor,
                                        borderRadius:
                                            BorderRadius.circular(2.r),
                                      ),
                                    ),
                                    horizontalSpace(8),
                                    Expanded(
                                      child: Text(
                                        Get.locale.toString().contains('ar')
                                            ? e.xAxisLabelArabic
                                            : e.xAxisLabel,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: isTablet
                                            ? AppTextStyles
                                                .font16SecondaryBlackCairo
                                            : AppTextStyles
                                                .font14SecondaryBlackCairo,
                                      ),
                                    ),
                                    Text(
                                      DateTimeHelper.formatInt(e.yAxisLabel),
                                      style: isTablet
                                          ? AppTextStyles
                                              .font16BlackSemiBoldCairo
                                          : AppTextStyles
                                              .font14BlackSemiBoldCairo,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
