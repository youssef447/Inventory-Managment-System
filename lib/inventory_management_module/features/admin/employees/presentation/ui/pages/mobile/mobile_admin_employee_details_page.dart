import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/animations/scale_animation.dart';
import '../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../core/enums/departments.dart';
import '../../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../employee/home/domain/user_entity.dart';
import '../../../../../../employee/home/presentation/ui/widgets/common/vertical/squared_filter_card.dart';
import '../../../../../../employee/requests/entities/request_entity.dart';
import '../../../../../../products/enums/product_enums.dart';
import '../../../../../home/presentation/ui/page/mobile/mobile_admin_home_page.dart';
import '../../../../constants/ids.dart';
import '../../../controller/employee_details_controller.dart';
import '../../widgets/common/buttons/requested_approval_buttons.dart';
import '../../widgets/common/cards/employee_product_card.dart';
import '../../widgets/common/vertical/requests_summary_circles.dart';
part '../../widgets/mobile/cards/employee_details_card.dart';
part '../../widgets/mobile/cards/requested_product_card.dart';
part '../../widgets/mobile/mobile_employee_proucts_list.dart';

class MobileAdminEmployeeDetailsPage extends StatelessWidget {
  final UserEntity userEntity;
  const MobileAdminEmployeeDetailsPage({super.key, required this.userEntity});

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
          child: GetBuilder<EmployeeDetailsController>(
              id: AdminEmployeesIds.employeeDetails,
              builder: (controller) {
                return controller.loading
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(16),
                          const MobileCustomAppbar(
                            title: 'Details',
                          ),
                          verticalSpace(30),
                          MobileAdminEmployeeDetailsCard(
                            userEntity: userEntity,
                          ),
                          verticalSpace(30),
                          const Expanded(child: AppCircleProgress()),
                        ],
                      )
                    : controller.employeeProducts.isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const MobileCustomAppbar(
                                title: 'Details',
                              ),
                              verticalSpace(30),
                              MobileAdminEmployeeDetailsCard(
                                userEntity: userEntity,
                              ),
                              verticalSpace(30),
                              const Expanded(child: NoDataGif()),
                            ],
                          )
                        : CustomScrollView(
                            slivers: [
                              SliverToBoxAdapter(
                                child: verticalSpace(16),
                              ),
                              const SliverToBoxAdapter(
                                child: MobileCustomAppbar(
                                  title: 'Details',
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: verticalSpace(30),
                              ),
                              SliverToBoxAdapter(
                                child: MobileAdminEmployeeDetailsCard(
                                  userEntity: userEntity,
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: verticalSpace(30),
                              ),
                              const MobileEmployeeProductsList(),
                            ],
                          );
              }),
        ),
      ),
    );
  }
}
