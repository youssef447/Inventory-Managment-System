import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../../../core/animations/size_animation.dart';
import '../../../../../../core/enums/requests_enums.dart';
import '../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../core/helpers/orientation_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../core/widgets/appbar/default_rich_text.dart';
import '../../../../../../core/widgets/loading.dart';
import '../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../consumables/domain/entity/consumables_entity.dart';
import '../../../../constants/ids_constants.dart';
import '../../../controller/request_consumable_controller.dart';
import '../../widgets/common/request_assets_search_filter.dart';
part '../../widgets/tablet/new_request/cards/horizontal_request_consumable_card.dart';
part '../../widgets/tablet/new_request/cards/vertical_request_asset_card.dart';
part '../../widgets/tablet/new_request/cards/vertical_default_asset_card.dart';
part '../../widgets/tablet/new_request/cards/horizontal_default_consumable_card.dart';

class TabletNewConsumableRequestPage
    extends GetView<RequestConsumableController> {
  const TabletNewConsumableRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: context.isLandscapee
            ? EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h)
            : EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h),
        child: SafeArea(
          child: GetBuilder<RequestConsumableController>(
              id: RequestConsumablesIds.requestConsumablePage,
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(
                      titles: [
                        'New Request'.tr,
                        controller.requestAction.getName.tr
                      ],
                    ),
                    controller.loading
                        ? const Expanded(child: AppCircleProgress())
                        : controller.consumables.isEmpty
                            ? const Expanded(child: NoDataGif())
                            : SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpace(21),
                                    Text(
                                      'Asset Information'.tr,
                                      style:
                                          AppTextStyles.font18BlackCairoMedium,
                                    ),
                                    verticalSpace(21),
                                    const RequestConsumableSearchFilter(),
                                    verticalSpace(21),
                                    SizeAnimation(
                                      child: StaggeredGrid.count(
                                        crossAxisCount:
                                            Get.width > 1200 ? 3 : 2,
                                        mainAxisSpacing: 15.h,
                                        crossAxisSpacing:
                                            context.isLandscapee ? 20.w : 36.w,
                                        children: List.generate(
                                          controller.consumables.length,
                                          (index) {
                                            return GestureDetector(
                                              onTap: () {
                                                controller.setResources(
                                                    controller
                                                        .consumables[index]);
                                                Get.toNamed(
                                                  Routes.newRequestConsumable,
                                                  arguments: {
                                                    'model': controller
                                                        .consumables[index]
                                                  },
                                                );
                                              },
                                              child: controller.requestAction ==
                                                      RequestActions
                                                          .requestConsumables
                                                  ? OrientationHelper(
                                                      landScape:
                                                          HorizontalRequestConsumableCard(
                                                        model: controller
                                                            .consumables[index],
                                                      ),
                                                      portrait:
                                                          VerticalRequestConsumableCard(
                                                        model: controller
                                                            .consumables[index],
                                                      ),
                                                    )
                                                  : OrientationHelper(
                                                      landScape:
                                                          HorizontalDefaultConsumableCard(
                                                        model: controller
                                                            .consumables[index],
                                                      ),
                                                      portrait:
                                                          VerticalDefaultConsumableCard(
                                                        model: controller
                                                            .consumables[index],
                                                      ),
                                                    ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
