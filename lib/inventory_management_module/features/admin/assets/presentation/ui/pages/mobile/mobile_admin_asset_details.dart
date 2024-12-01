import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../..//core/extensions/extensions.dart';
import '../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../core/helpers/orientation_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../../../../../employee/Assets/domain/entity/assets_entity.dart';
import '../../../../../employees/presentation/ui/pages/mobile/mobile_admin_employee_details_page.dart';
import '../../widget/mobile/assets_details/mobile_assigned_and_service_history_list.dart';
import '../../widget/mobile/card/mobile_assets_details_card.dart';
import '../../widget/tablet/assets_details/assigned_and_service_history_list.dart';
import '../../widget/tablet/assets_details/horizontal_assets_details_card.dart';
import '../../widget/tablet/assets_details/vertical_assets_details_card.dart';

class MobileAdminAssetDetails extends StatelessWidget {
  final AssetsEntity assetsEntity;
  const MobileAdminAssetDetails({super.key, required this.assetsEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.isLandscapee ? 34.w : 16.w,
            vertical: 16.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(16),
                MobileCustomAppbar(
                  title: 'Asset Details'.tr,
                ),
                verticalSpace(12),
                SizeAnimation(
                    child: MobileAssetsDetailsCard(
                  assets: assetsEntity,
                )),
                verticalSpace(22),
                const MobileAssignedAndServiceHistoryList(),
              ],
            ),
          ),
        )));
  }
}
