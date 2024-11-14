import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/loading.dart';
import '../../../../../../core/widgets/no_data_gif.dart';

import '../../../../../consumables/domain/entity/consumables_entity.dart';
import '../../../../constants/ids_constants.dart';
import '../../../controller/request_consumable_controller.dart';
import '../../widgets/common/request_assets_search_filter.dart';
part '../../widgets/mobile/request_asset/cards/mobile_request_asset_card.dart';

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
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.until(
                                (route) => route.isFirst,
                              );
                            },
                            child: SvgPicture.asset(
                              context.isArabic
                                  ? AppAssets.arrowForward
                                  : AppAssets.arrowBack,
                              width: 24.w,
                              height: 24.h,
                              color: AppColors.text,
                            ),
                          ),
                          horizontalSpace(8),
                          Text(
                            controller.requestAction.getName.tr,
                            style: AppTextStyles.font26BlackSemiBoldCairo,
                          ),
                        ],
                      ),
                      controller.loading
                          ? const AppCircleProgress()
                          : controller.consumables.isEmpty
                              ? const NoDataGif()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpace(24),
                                    Text(
                                      'Asset Information'.tr,
                                      style:
                                          AppTextStyles.font18BlackCairoMedium,
                                    ),
                                    verticalSpace(8),
                                    const RequestConsumableSearchFilter(),
                                    verticalSpace(8),
                                    ListView.separated(
                                      separatorBuilder: (_, __) =>
                                          verticalSpace(
                                        15,
                                      ),
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: controller.consumables.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            controller.setResources(
                                                controller.consumables[index]);
                                            Get.toNamed(
                                              Routes.newRequestAsset,
                                              arguments: {
                                                'assetModel': controller
                                                    .consumables[index]
                                              },
                                            );
                                          },
                                          child: MobileRequestConsumableCard(
                                            model:
                                                controller.consumables[index],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
