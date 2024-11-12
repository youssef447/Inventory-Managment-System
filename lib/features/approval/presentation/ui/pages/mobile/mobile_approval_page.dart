import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/helpers/spacing_helper.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../requests/presentation/ui/widgets/common/vertical/requests_summary_circles.dart';
import '../../../controller/approval_controller.dart';
import '../../widget/mobile/categoris/mobile_all_categories.dart';
import '../../widget/tablet/approval_categories_filter.dart';
import '../../widget/tablet/approval_search_filter.dart';

class MobileApprovalPage extends GetView<ApprovalController> {
  const MobileApprovalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
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
                        return const MobileAllCategories();
                      }
                      if (controller.currentCategoryIndex.value == 1) {
                        return const Text('data222');
                      }
                      return const Text('data33');
                    },
                  ),


                ],
              ),
            ),
          ),
        )
    );
  }
}
