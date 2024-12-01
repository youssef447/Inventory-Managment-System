// By: Youssef Ashraf
// Objectives: This file is responsible for providing a widget that displays bar chart data in the dashboard.

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../core/extensions/extensions.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';

import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../domain/chart_data_entity.dart';

class DashboardColumnBarChart extends StatelessWidget {
  final String title;
  final String titleIconAsset;
  final List<ChartDataEntity> data;
  final double? intervalNum;
  final List<Widget>? dropDowns;

  const DashboardColumnBarChart({
    super.key,
    required this.title,
    required this.titleIconAsset,
    required this.data,
    this.intervalNum,
    this.dropDowns,
  });

  @override
  Widget build(BuildContext context) {
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
                          titleIconAsset,
                          color: AppColors.icon,
                        ),
                      ),
                      horizontalSpace(4),
                      Text(
                        title,
                        style: AppTextStyles.font16BlackRegularCairo,
                      ),
                      const Spacer(),
                      if (context.isTablett && dropDowns != null)
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(
                              dropDowns!.length,
                              (index) {
                                final lastIndex =
                                    dropDowns!.length - 1 == index;
                                return Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      end: lastIndex ? 0 : 10.w),
                                  child: dropDowns![index],
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                  verticalSpace(12),
                  if (!context.isTablett && dropDowns != null)
                    Padding(
                      padding: EdgeInsets.only(bottom: 12.h, top: 7.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: List.generate(
                          dropDowns!.length,
                          (index) {
                            final lastIndex = dropDowns!.length - 1 == index;
                            return Padding(
                              padding: EdgeInsetsDirectional.only(
                                  end: lastIndex ? 0 : 10.w),
                              child: dropDowns![index],
                            );
                          },
                        ),
                      ),
                    ),
                  Divider(
                    color: AppColors.chatBackground,
                    thickness: 1.w,
                  ),
                  verticalSpace(16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: data.length * Get.width / 4,
                      child: SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        // isTransposed: true,
                        //margin: EdgeInsets.zero,
                        backgroundColor: AppColors.card,
                        primaryXAxis: CategoryAxis(
                          labelStyle: AppTextStyles.font10BlackRegularInter,
                          majorTickLines: const MajorTickLines(size: 0),
                          axisLine: AxisLine(
                            color: AppColors.secondaryBlack,
                          ),
                          initialZoomPosition: 1,
                          majorGridLines: const MajorGridLines(width: 0),
                        ),
                        primaryYAxis: NumericAxis(
                          numberFormat: NumberFormat.compact(
                            locale: Get.locale.toString(),
                          ),
                          labelIntersectAction: AxisLabelIntersectAction.wrap,
                          majorTickLines: const MajorTickLines(
                            size: 0,
                          ),
                          axisLine: const AxisLine(color: Colors.transparent),
                          // interval: 2,
                          majorGridLines: MajorGridLines(
                            //   width: 0.7.w,
                            color: AppColors.secondaryBlack,
                            dashArray: const <double>[5, 5],
                          ),
                        ),
                        series: <CartesianSeries<ChartDataEntity, String>>[
                          ColumnSeries<ChartDataEntity, String>(
                            animationDuration: 1000,
                            dataSource: data,
                            //use dataa to test long list
                            xValueMapper: (ChartDataEntity data, _) =>
                                Get.locale.toString().contains('ar')
                                    ? data.xAxisLabelArabic
                                    : data.xAxisLabel,
                            yValueMapper: (ChartDataEntity data, _) =>
                                data.yAxisLabel,
                            pointColorMapper: (ChartDataEntity data, _) =>
                                AppColors.primary,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
