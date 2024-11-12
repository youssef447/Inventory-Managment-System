

// by : mohamed ashraf
//date : 10 / 11 / 2024
//this widget response to loading and show data of assets in listView

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/helpers/spacing_helper.dart';
import 'package:inventory_management/features/approval/presentation/controller/approval_controller.dart';
import '../../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../constants/approval_id_constant.dart';
import '../card/mobile_approval_card.dart';


class MobileAllCategories extends GetView<ApprovalController> {
  const MobileAllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApprovalController>(
        id: ApprovalIdConstant.approval,
        builder: (controller) {
          return controller.loading
              ? const AppCircleProgress()
              : controller.approvalList.isEmpty
              ? const NoDataGif()
              : Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return verticalSpace(20);
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          controller.setApprovalDetails(
                              controller.approvalList[index]);

                          HapticFeedbackHelper.triggerHapticFeedback(
                            vibration: VibrateType.mediumImpact,
                            hapticFeedback: HapticFeedback.mediumImpact,
                          );
                          Get.toNamed(
                            Routes.assetsDetails,
                            arguments: {
                              'assetsModelIndex': index,
                              //'readOnly': readOnly,
                            },
                          );
                        },
                        child: MobileApprovalCard(index: index)
                    );
                  },
                  itemCount: controller.approvalList.length,
                )


              ]);
        });
  }
}
