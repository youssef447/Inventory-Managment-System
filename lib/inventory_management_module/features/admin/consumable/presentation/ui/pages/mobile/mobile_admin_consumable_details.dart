import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import 'package:inventory_management/inventory_management_module/features/employee/consumables/domain/entity/consumables_entity.dart';
import '../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../widget/mobile/card/mobile_consumable_details_card.dart';
import '../../widget/mobile/consumble_details/mobile_assigned_consumable.dart';
import '../../widget/tablet/consumable_details/tablet_consumable_assigned.dart';

class MobileAdminConsumableDetails extends StatelessWidget {
  final ConsumablesEntity consumablesEntity;

  const MobileAdminConsumableDetails(
      {super.key, required this.consumablesEntity});

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
                  title: 'Consumable Details'.tr,
                ),
                verticalSpace(12),
                SizeAnimation(
                    child: MobileConsumableDetailsCard(
                  consumable: consumablesEntity,
                )),
                verticalSpace(22),
                const MobileAssignedConsumable(),
              ],
            ),
          ),
        )));
  }
}
