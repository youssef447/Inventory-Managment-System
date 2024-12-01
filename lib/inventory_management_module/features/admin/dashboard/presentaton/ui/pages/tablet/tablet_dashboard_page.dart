import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../features/admin/dashboard/presentaton/ui/widgets/common/charts/bar_chart_list.dart';
import '../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/enums/time_filter.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../../../../core/enums/departments.dart';
import '../../../../../../../core/enums/sort_options.dart';
import '../../../../constants/dashboard_ids.dart';
import '../../../controller/dashboard_controller.dart';
import '../../widgets/common/cards/horizontal_summary_header.dart';
import '../../widgets/common/charts/dashboard_circular_chart.dart';
part '../../widgets/tablet/filter_header.dart';
part '../../widgets/tablet/tablet_circular_chart.dart';

class TabletDashboardPage extends GetView<DashboardController> {
  const TabletDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.isLandscapee ? 30.w : 16.w,
            vertical: 16.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(
                  titles: ['Dashborad'],
                ),
                verticalSpace(30),
                const TabletFitlerHeader(),
                verticalSpace(15),
                const SizeAnimation(child: HorizontalSummaryHeader()),
                verticalSpace(15),
                const TabletCircularChart(),
                verticalSpace(15),
                const BarChartList(),
                verticalSpace(15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
