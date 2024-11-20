// by : mohamed ashraf
//date : 10 / 11 / 2024
//this widget response to loading and show data of assets in listView

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/routes/route_arguments.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/buttons/app_default_button.dart';
import '../../../../../../core/widgets/loading.dart';
import '../../../../../../core/widgets/no_data_gif.dart';
import '../../../controller/assets_controller.dart';
import '../../constants/assets_id_constant.dart';
import '../../widget/mobile/mobile_assets_card.dart';

class MobileAssetsPage extends GetView<AssetsController> {
  const MobileAssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssetsController>(
        init: AssetsController(),
        id: AssetsIdConstant.assetsData,
        builder: (controller) {
          return controller.loading
              ? const SliverFillRemaining(
                  child: AppCircleProgress(),
                )
              : controller.assetsList.isEmpty
                  ? const SliverFillRemaining(
                      child: NoDataGif(),
                    )
                  : SliverMainAxisGroup(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: AppDefaultButton(
                              text: 'Approval'.tr,
                              textColor: AppColors.textButton,
                              onPressed: () {
                                Get.toNamed(Routes.approval);
                              },
                              style: context.isPhone
                                  ? AppTextStyles.font16BlackMediumCairo
                                  : AppTextStyles.font18BlackMediumCairo,
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(child: verticalSpace(12)),
                        SliverPadding(
                          padding: EdgeInsets.only(
                            bottom: 12.h,
                          ),
                          sliver: SliverList.separated(
                            separatorBuilder: (_, __) => verticalSpace(16),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    controller.setAssetsDetails(
                                        controller.assetsList[index]);

                                    HapticFeedbackHelper.triggerHapticFeedback(
                                      vibration: VibrateType.mediumImpact,
                                      hapticFeedback:
                                          HapticFeedback.mediumImpact,
                                    );
                                    Get.toNamed(
                                      Routes.assetsDetails,
                                      arguments: {
                                        RouteArguments.assetsModelIndex: index,
                                        //'readOnly': readOnly,
                                      },
                                    );
                                  },
                                  child: MobileAssetsCard(index: index));
                            },
                            itemCount: controller.assetsList.length,
                          ),
                        )
                      ],
                    );
        });
  }
}
