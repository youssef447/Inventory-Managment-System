import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/constants/enums.dart';
import 'package:inventory_management/core/extensions/extensions.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../..//Assets/domain/entity/assets_entity.dart';

import '../../../../../../core/helpers/orientation_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../../core/widgets/loading.dart';
import '../../../../../../core/widgets/no_data_gif.dart';
import '../../../../constants/ids_constants.dart';
import '../../../controller/request_assets_controller.dart';
import '../../widgets/common/request_assets_search_filter.dart';
part '../../widgets/tablet/cards/horizontal_request_asset_card.dart';
part '../../widgets/tablet/cards/vertical_request_asset_card.dart';

class TabletRequestAssetsPage extends GetView<RequestAssetsController> {
  const TabletRequestAssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: context.isLandscapee
            ? EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h)
            : EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h),
        child: SafeArea(
          child: GetBuilder<RequestAssetsController>(
              id: RequestAssetsIds.requestAssetsPage,
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(
                      titles: ['New Request'.tr, 'Request Asset'.tr],
                    ),
                    controller.loading
                        ? const AppCircleProgress()
                        : controller.assets.isEmpty
                            ? const NoDataGif()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  verticalSpace(21),
                                  Text(
                                    'Asset Information'.tr,
                                    style: AppTextStyles.font18BlackCairoMedium,
                                  ),
                                  verticalSpace(21),
                                  const RequestAssetsSearchFilter(),
                                  verticalSpace(21),
                                  GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing:
                                          context.isLandscapee ? 20.w : 36.w,
                                    ),
                                    itemBuilder: (context, index) {
                                      return OrientationHelper(
                                        landScape: HorizontalRequestAssetCard(
                                          model: controller.assets[index],
                                        ),
                                        portrait: VerticalRequestAssetCard(
                                          model: controller.assets[index],
                                        ),
                                      );
                                    },
                                  )
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
