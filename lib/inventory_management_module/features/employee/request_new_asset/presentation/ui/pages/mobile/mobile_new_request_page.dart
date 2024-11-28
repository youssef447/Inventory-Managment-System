import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../Assets/domain/entity/assets_entity.dart';
import '../../../../constants/ids_constants.dart';
import '../../../controller/request_assets_controller.dart';
import '../../widgets/common/request_search_filter/request_assets_search_filter.dart';
part '../../widgets/mobile/new_request/cards/mobile_request_asset_card.dart';
part '../../widgets/mobile/new_request/cards/mobile_default_asset_card.dart';

//Youssef Ashraf
///Represents The Available Assets Based On Consumable Request Action in Mobile View
class MobileNewRequestPage extends GetView<RequestAssetsController> {
  final RequestActions requestAction;

  const MobileNewRequestPage({
    super.key,
    required this.requestAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          child: GetBuilder<RequestAssetsController>(
            id: RequestAssetsIds.requestAssetsPage,
            builder: (controller) {
              return CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: MobileCustomAppbar(
                    title: requestAction.getName.tr,
                  ),
                ),
                controller.loading
                    ? const SliverFillRemaining(
                        child: AppCircleProgress(),
                      )
                    : controller.assets.isEmpty
                        ? const SliverFillRemaining(
                            child: NoDataGif(),
                          )
                        : SliverMainAxisGroup(
                            slivers: [
                              SliverToBoxAdapter(child: verticalSpace(8)),
                              const SliverToBoxAdapter(
                                  child: RequestAssetsSearchFilter()),
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
                                          controller.assets[index],
                                        );
                                        context.navigateTo(
                                          Routes.newRequestAsset,
                                          arguments: {
                                            RouteArguments.assetModel:
                                                controller.assets[index],
                                            RouteArguments.requestAction:
                                                requestAction,
                                          },
                                        );
                                      },
                                      child: requestAction ==
                                              RequestActions.requestAsset
                                          ? MobileRequestAssetCard(
                                              model: controller.assets[index],
                                            )
                                          : MobileDefaultAssetCard(
                                              model: controller.assets[index],
                                              requestAction: requestAction,
                                            ),
                                    );
                                  },
                                  itemCount: controller.assets.length,
                                ),
                              ),
                            ],
                          ),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
