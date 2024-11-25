// by : Mohamed Ashraf
// date : 14/11/2024
import '../../../../../../core/extensions/extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/helpers/orientation_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/widgets/appbar/custom_app_bar.dart';

import '../../../../../employee/requests/presentation/ui/widgets/common/horizontal/requests_summary_circles.dart';
import '../../../../../employee/requests/presentation/ui/widgets/common/vertical/requests_summary_circles.dart';
import '../../../controller/approval_controller.dart';
import '../../constants/approval_id_constant.dart';
import '../../widget/tablet/approval_categories_filter.dart';
import '../../widget/tablet/approval_search_filter.dart';
import '../../widget/tablet/categories/all_categories.dart';

class TabletApprovalPage extends GetView<ApprovalController> {
  const TabletApprovalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: GetBuilder<ApprovalController>(
            id: ApprovalIdConstant.approval,
            builder: (controller) {
              return Padding(
                padding: context.isLandscapee
                    ? EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h)
                    : EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBar(
                          titles: [
                            'Approval'.tr,
                          ],
                        ),
                        verticalSpace(24),
                        const ApprovalCategoriesFilter(),
                        verticalSpace(16),
                        const OrientationHelper(
                          landScape: HorizontalRequstsSummaryCircles(),
                          portrait: VerticalRequstsSummaryCircles(),
                        ),
                        const ApprovalSearchFilter(),
                        verticalSpace(16),
                        Obx(
                          () {
                            if (controller.currentCategoryIndex.value == 0) {
                              return AllCategories(
                                  list: controller.allApprovalList);
                            }
                            if (controller.currentCategoryIndex.value == 1) {
                              return AllCategories(
                                  list: controller.approvedList);
                            }
                            if (controller.currentCategoryIndex.value == 2) {
                              return AllCategories(
                                  list: controller.rejectedList);
                            }
                            return AllCategories(list: controller.canceledList);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
