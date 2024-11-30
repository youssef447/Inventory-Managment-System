import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../approval/presentation/ui/widget/tablet/approval_search_filter.dart';
import '../../../../../../employee/requests/presentation/ui/widgets/common/vertical/requests_summary_circles.dart';
import '../../../controller/admin_approval_controller.dart';
import '../../constants/approval_id_constant.dart';
import '../../widget/common/approval_admin_categories_filter.dart';
import '../tablet/admin_approval_filtter_list.dart';

class MobileAdminHomeApprovalPage extends StatelessWidget {
  const MobileAdminHomeApprovalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: GetBuilder<AdminApprovalController>(
            id: ApprovalAdminIdConstant.approval,
            builder: (controller) {
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
                                onTap: () => Navigator.of(context).pop(),
                                child: SvgPicture.asset(
                                  AppAssets.arrowBack,
                                )),
                            Text(
                              'Approval'.tr,
                              style: AppTextStyles.font26BlackSemiBoldCairo,
                            ),
                          ],
                        ),


                        const ApprovalAdminCategoriesFilter(),
                        const ApprovalSearchFilter(),
                        const SizeAnimation(
                          child: VerticalRequstsSummaryCircles()
                        ),

                        verticalSpace(16),
                        Obx(() {
                          if (controller.currentCategoryIndex == 0) {
                            return AdminApprovalFilterList(
                                loading: controller.loading,
                                list: controller.requestedProducts);
                          }
                          if (controller.currentCategoryIndex == 1) {
                            return AdminApprovalFilterList(
                                loading: controller.loading,
                                list: controller.getApprovedRequestsNumbers());
                          } else if (controller.currentCategoryIndex == 2) {
                            return AdminApprovalFilterList(
                                loading: controller.loading,
                                list: controller.getPendingRequestsNumbers());
                          } else if (controller.currentCategoryIndex == 3) {
                            return AdminApprovalFilterList(
                                loading: controller.loading,
                                list: controller.getRejectedRequestsNumbers());
                          }
                          else if (controller.currentCategoryIndex == 4) {
                            return AdminApprovalFilterList(
                                loading: controller.loading,
                                list: controller.getCanceledNumbers());
                          } else {
                            return AdminApprovalFilterList(
                                loading: controller.loading,
                                list: controller.getRetrievedRequestsNumbers());
                          }
                        })
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
