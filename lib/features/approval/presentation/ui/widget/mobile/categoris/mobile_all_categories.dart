

// by : mohamed ashraf
//date : 10 / 11 / 2024
//this widget response to loading and show data of assets in listView

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/helpers/spacing_helper.dart';
import 'package:inventory_management/features/approval/presentation/controller/approval_controller.dart';
import '../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../domain/approval_entity.dart';
import '../../../constants/approval_id_constant.dart';
import '../../../pages/mobile/mobile_approval_details_page.dart';
import '../card/mobile_approval_card.dart';


class MobileAllCategories extends GetView<ApprovalController> {
  final List<ApprovalEntity> list;
  const MobileAllCategories({super.key ,required this.list});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApprovalController>(
        id: ApprovalIdConstant.approval,
        builder: (controller) {
          return controller.loading
              ? const AppCircleProgress()
              : list.isEmpty
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
                              list[index]);

                          HapticFeedbackHelper.triggerHapticFeedback(
                            vibration: VibrateType.mediumImpact,
                            hapticFeedback: HapticFeedback.mediumImpact,
                          );
                          GetDialogHelper.generalDialog(
                              context: context, child: MobileApprovalDetailsPage(index: index,));
                          // Get.toNamed(
                          //   Routes.assetsDetails,
                          //   arguments: {
                          //     'assetsModelIndex': index,
                          //     //'readOnly': readOnly,
                          //   },
                          // );
                        },
                        child: MobileApprovalCard(index: index)
                    );
                  },
                  itemCount: list.length,
                )


              ]);
        });
  }
}
