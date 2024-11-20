// by : Mohamed Ashraf
//dater : 14/11/2024
// this widget show row of approval and rejected button

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/helpers/spacing_helper.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../requests/presentation/ui/widgets/common/vertical/requests_summary_circles.dart';
import '../../../controller/approval_controller.dart';
import '../../constants/approval_id_constant.dart';
import '../../widget/mobile/categoris/mobile_all_categories.dart';
import '../../widget/tablet/approval_categories_filter.dart';
import '../../widget/tablet/approval_search_filter.dart';

class MobileApprovalPage extends GetView<ApprovalController> {
  const MobileApprovalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: GetBuilder<ApprovalController>(
            id: ApprovalIdConstant.approval,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () => Get.back(),
                                child: SvgPicture.asset(
                                  AppAssets.arrowBack,
                                )),
                            Text(
                              'Approval'.tr,
                              style: AppTextStyles.font26BlackSemiBoldCairo,
                            ),
                          ],
                        ),
                        verticalSpace(20),
                        verticalSpace(24),
                        const ApprovalCategoriesFilter(),
                        verticalSpace(16),
                        const ApprovalSearchFilter(),
                        const VerticalRequstsSummaryCircles(),
                        verticalSpace(16),
                        Obx(
                          () {
                            if (controller.currentCategoryIndex.value == 0) {
                              return MobileAllCategories(
                                  list: controller.allApprovalList);
                            }
                            if (controller.currentCategoryIndex.value == 1) {
                              return MobileAllCategories(
                                  list: controller.approvedList);
                            }
                            if (controller.currentCategoryIndex.value == 2) {
                              return MobileAllCategories(
                                  list: controller.rejectedList);
                            }
                            return MobileAllCategories(
                                list: controller.canceledList);
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
