// by : mohamed ashraf
//date : 10 / 11 / 2024
//this widget response to loading and show data of assets in listView

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/widgets/loading.dart';
import '../../../../../../core/widgets/no_data_gif.dart';
import '../../../constants/consumables_id_constant.dart';
import '../../../controller/consumables_controller.dart';
import '../../widget/mobile/mobile_consumable_card.dart';


class MobileConsumablesPage extends GetView<ConsumablesController> {
  const MobileConsumablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConsumablesController>(
        init: ConsumablesController(),
        id: ConsumablesIdConstant.consumablesData,
        builder: (controller) {
          return controller.loading
              ? const AppCircleProgress()
              : controller.consumablesList.isEmpty
              ? const NoDataGif()
              : Column(children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      HapticFeedbackHelper.triggerHapticFeedback(
                        vibration: VibrateType.mediumImpact,
                        hapticFeedback: HapticFeedback.mediumImpact,
                      );

                      Get.toNamed(
                        Routes.consumablesDetails,
                        arguments: {
                          'consumablesModelIndex': index,
                          //'readOnly': readOnly,
                        },
                      );
                    },
                    child: MobileConsumableCard(index: index));
              },
              separatorBuilder: (_, __) => SizedBox(
                height: 16.h,
              ),
              itemCount: controller.consumablesList.length,
            )
          ]);
        });
  }
}
