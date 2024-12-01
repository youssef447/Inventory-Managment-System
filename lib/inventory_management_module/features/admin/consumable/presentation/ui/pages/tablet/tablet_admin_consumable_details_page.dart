import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../features/employee/consumables/domain/entity/consumables_entity.dart';
import '../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../core/helpers/orientation_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../widget/tablet/consumable_details/horizontal_consumable_details_card.dart';
import '../../widget/tablet/consumable_details/tablet_consumable_assigned.dart';
import '../../widget/tablet/consumable_details/vertical_consumable_details_card.dart';

class TabletAdminConsumableDetailsPage extends StatelessWidget {
  final ConsumablesEntity consumablesEntity;
  const TabletAdminConsumableDetailsPage(
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
                CustomAppBar(
                  titles: const ['Consumables', 'Consumables Details'],
                  titleNavigations: [
                    () => Navigator.of(context).pop(),
                  ],
                ),
                verticalSpace(12),
                SizeAnimation(
                  child: OrientationHelper(
                      landScape: HorizontalConsumableDetailsCard(
                        consumable: consumablesEntity,
                      ),
                      portrait: VerticalConsumableDetailsCard(
                        consumable: consumablesEntity,
                      )),
                ),
                verticalSpace(22),
                const TabletConsumableAssigned(),
              ],
            ),
          ),
        )));
  }
}
