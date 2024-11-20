import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/enums/requests_enums.dart';
import '../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/routes/route_arguments.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../../../../../core/widgets/loading.dart';
import '../../../../../../core/widgets/no_data_gif.dart';

import '../../../../../consumables/domain/entity/consumables_entity.dart';
import '../../../../constants/ids_constants.dart';
import '../../../controller/request_consumable_controller.dart';
import '../../widgets/common/request_consumable_search_filter/request_consumable_search_filter.dart';
part '../../widgets/mobile/new_request/cards/mobile_request_consumable_card.dart';
part '../../widgets/mobile/new_request/cards/mobile_default_consumable_card.dart';

//Youssef Ashraf
///Represents The Available Consumables Based On Consumable Request Action in Mobile View
class MobileNewConsumableRequestPage
    extends GetView<RequestConsumableController> {
  const MobileNewConsumableRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          child: GetBuilder<RequestConsumableController>(
              id: RequestConsumablesIds.requestConsumablePage,
              builder: (controller) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: MobileCustomAppbar(
                        title: controller.requestAction.getName.tr,
                      ),
                    ),
                    controller.loading
                        ? const SliverFillRemaining(
                            child: AppCircleProgress(),
                          )
                        : controller.consumables.isEmpty
                            ? const SliverFillRemaining(
                                child: NoDataGif(),
                              )
                            : SliverMainAxisGroup(
                                slivers: [
                                  SliverToBoxAdapter(child: verticalSpace(24)),
                                  SliverToBoxAdapter(
                                    child: Text(
                                      'Asset Information'.tr,
                                      style:
                                          AppTextStyles.font18BlackCairoMedium,
                                    ),
                                  ),
                                  SliverToBoxAdapter(child: verticalSpace(8)),
                                  const SliverToBoxAdapter(
                                      child: RequestConsumableSearchFilter()),
                                  SliverToBoxAdapter(child: verticalSpace(8)),
                                  SliverPadding(
                                    padding: EdgeInsets.only(
                                      bottom: 12.h,
                                    ),
                                    sliver: SliverList.separated(
                                      separatorBuilder: (_, __) =>
                                          verticalSpace(16),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            controller.setResources(
                                                controller.consumables[index]);
                                            Get.toNamed(
                                              Routes.newRequestConsumable,
                                              arguments: {
                                                RouteArguments.consumableModel:
                                                    controller
                                                        .consumables[index]
                                              },
                                            );
                                          },
                                          child: controller.requestAction ==
                                                  RequestActions
                                                      .requestConsumables
                                              ? MobileRequestConsumableCard(
                                                  model: controller
                                                      .consumables[index],
                                                )
                                              : MobileDefaultConsumableCard(
                                                  model: controller
                                                      .consumables[index],
                                                ),
                                        );
                                      },
                                      itemCount: controller.consumables.length,
                                    ),
                                  ),
                                ],
                              ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
