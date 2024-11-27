import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/animations/size_animation.dart';
import 'package:inventory_management/inventory_management_module/core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../../features/admin/employees/enums/departments.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../employee/home/domain/user_entity.dart';
import '../../../../../../employee/home/presentation/ui/widgets/common/vertical/squared_filter_card.dart';
import '../../../../../home/presentation/ui/page/mobile/mobile_admin_home_page.dart';
import '../../../../constants/ids.dart';
import '../../../controller/employee_details_controller.dart';
import '../../widgets/common/employee_product_card.dart';
part '../../widgets/tablet/employee_details_card.dart';
part '../../widgets/tablet/tablet_employee_proucts_list.dart';

class TabletAdminEmployeeDetailsPage extends StatelessWidget {
  final UserEntity userEntity;
  const TabletAdminEmployeeDetailsPage({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.isLandscapee ? 30.w : 16.w,
            vertical: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),
              CustomAppBar(
                titles: const ['Employees', 'Details'],
                titleNavigations: [
                  () => Navigator.of(context).pop(),
                ],
              ),
              verticalSpace(30),
              TabletEmployeeDetailsCard(
                userEntity: userEntity,
              ),
              verticalSpace(30),
              const TabletEmployeeProuctsList(),
            ],
          ),
        ),
      ),
    );
  }
}
