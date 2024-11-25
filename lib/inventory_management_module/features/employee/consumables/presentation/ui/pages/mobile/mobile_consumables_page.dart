// by : mohamed ashraf
//date : 10 / 11 / 2024
//this widget response to loading and show data of assets in listView

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import '../../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
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
              ? const SliverFillRemaining(
                  child: AppCircleProgress(),
                )
              : controller.consumablesList.isEmpty
                  ? const SliverFillRemaining(
                      child: NoDataGif(),
                    )
                  : SliverPadding(
                      padding: EdgeInsets.only(
                        bottom: 12.h,
                      ),
                      sliver: SliverList.separated(
                        separatorBuilder: (_, __) => verticalSpace(16),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                controller.setConsumablesDetails(
                                    controller.consumablesList[index]);
                                HapticFeedbackHelper.triggerHapticFeedback(
                                  vibration: VibrateType.mediumImpact,
                                  hapticFeedback: HapticFeedback.mediumImpact,
                                );

                                context.navigateTo(
                                  Routes.consumablesDetails,
                                  arguments: {
                                    RouteArguments.consumablesModelIndex: index,
                                    //'readOnly': readOnly,
                                  },
                                );
                              },
                              child: MobileConsumableCard(index: index));
                        },
                        itemCount: controller.consumablesList.length,
                      ));
        });
  }
}
