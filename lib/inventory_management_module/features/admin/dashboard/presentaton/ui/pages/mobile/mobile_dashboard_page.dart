import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';

import '../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/enums/departments.dart';
import '../../../../../../../core/enums/sort_options.dart';
import '../../../../../../../core/enums/time_filter.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../constants/dashboard_ids.dart';
import '../../../controller/dashboard_controller.dart';
import '../../widgets/common/cards/vertical_summary_header.dart';
import '../../widgets/common/charts/bar_chart_list.dart';
import '../../widgets/common/charts/dashboard_circular_chart.dart';
part '../../widgets/mobile/filter_header.dart';
part '../../widgets/mobile/mobile_circular_chart.dart';

class MobileDashboardPage extends StatelessWidget {
  const MobileDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const MobileCustomAppbar(
                    title: 'Dashboard',
                  ),
                  verticalSpace(30),
                  const MobileFitlerHeader(),
                  verticalSpace(15),
                  const SizeAnimation(child: VerticalSummaryHeader()),
                  verticalSpace(15),
                  const MobileCircularChart(),
                  verticalSpace(15),
                  const BarChartList(),
                ],
              ),
            ),
          ),
        ));
  }
}
