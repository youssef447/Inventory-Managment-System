// by : mohamed ashraf
//date : 10 / 11 / 2024
//this widget response to loading and show data of assets in listView

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/helpers/spacing_helper.dart';
import 'package:inventory_management/features/approval/presentation/controller/approval_controller.dart';
import '../../../../../../../core/animations/scale_animation.dart';
import '../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../domain/approval_entity.dart';
import '../../../constants/approval_id_constant.dart';
import '../../../pages/tablet/tablet_approval_details_page.dart';
import '../card/approval_card_horizontal_tablet.dart';
import '../card/approval_card_vertical_tablet.dart';

class AllCategories extends GetView<ApprovalController> {
  const AllCategories({super.key,required this.list});
  final List<ApprovalEntity> list;
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 0.95;
    final double itemHeightVertical = (size.height - kToolbarHeight) / 1.3;
    final double itemWidth = size.width / 2;

    return GetBuilder<ApprovalController>(
        id: ApprovalIdConstant.approval,
        builder: (controller) {
          return controller.loading
              ? const AppCircleProgress()
              : list.isEmpty
                  ? const NoDataGif()
                  : ScaleAnimation(
                    child: Column(
                                  children: [
                      (controller.listViewSelect && context.isLandscape) ?
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
                                Get.toNamed(
                                  Routes.assetsDetails,
                                  arguments: {
                                    'assetsModelIndex': index,
                                    //'readOnly': readOnly,
                                  },
                                );
                              },
                              child: ApprovalCardHorizontalTablet(index: index ,list:list)
                          );
                        },
                        itemCount: list.length,
                      ):
                        GridView.builder(
                          gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: context.isLandscape? 4 : 3,
                                crossAxisSpacing:context.isLandscape? 20 : 24,
                                 childAspectRatio: context.isLandscape ? (itemWidth / itemHeight) : (itemWidth / itemHeightVertical) ,
                                  mainAxisSpacing: 16,
                               ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
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
                                    child:  TabletApprovalDetailsPage(index: index,),
                                    context: context,
                                  );
                                  // Get.toNamed(
                                  //   Routes.approvalDetails,
                                  //   arguments: {
                                  //     'approvalModelIndex': index,
                                  //     //'readOnly': readOnly,
                                  //   },
                                  // );
                                },
                                child: ApprovalCardVerticalTablet(index: index, list:list)
                            );
                          },
                          itemCount: list.length,
                        )

                      ]),
                  );
        });
  }
}
