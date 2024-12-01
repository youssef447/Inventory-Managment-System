import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../core/widgets/buttons/app_default_button.dart';
import '../../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';

import '../../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../../../../../employee/home/presentation/ui/widgets/common/vertical/squared_filter_card.dart';
import '../../../../constants/ids.dart';
import '../../../../../../../core/enums/departments.dart';
import '../../../../../../../core/enums/sort_options.dart';
import '../../../controller/employees_controller.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../widgets/common/cards/employee_card.dart';
part '../../widgets/mobile/employee_search_filter.dart';
part '../../widgets/mobile/employee_filter_dialog.dart';

//Youssef Ashraf
///Represents The Employees List Page  in Mobile View
class MobileAdminEmployeesPage extends GetView<EmployeesController> {
  const MobileAdminEmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: GetBuilder<EmployeesController>(
              id: AdminEmployeesIds.employeesPage,
              builder: (controller) {
                return CustomScrollView(
                  slivers: [
                    controller.loading
                        ? const SliverFillRemaining(
                            child: AppCircleProgress(),
                          )
                        : controller.employees.isEmpty
                            ? SliverFillRemaining(
                                child: Column(
                                  children: [
                                    MobileCustomAppbar(
                                      title: 'Employees'.tr,
                                    ),
                                    const Expanded(child: NoDataGif()),
                                  ],
                                ),
                              )
                            : SliverMainAxisGroup(
                                slivers: [
                                  SliverToBoxAdapter(
                                    child: MobileCustomAppbar(
                                      title: 'Employees'.tr,
                                    ),
                                  ),
                                  SliverToBoxAdapter(child: verticalSpace(35)),
                                  SliverToBoxAdapter(
                                    child: Text(
                                      'Employees Information'.tr,
                                      style:
                                          AppTextStyles.font18BlackCairoMedium,
                                    ),
                                  ),
                                  SliverToBoxAdapter(child: verticalSpace(8)),
                                  const SliverToBoxAdapter(
                                      child: MobileEmployeeSearchFilter()),
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
                                            context.navigateTo(
                                                Routes.employeeDetails,
                                                arguments: {
                                                  RouteArguments.userEntity:
                                                      controller
                                                              .employeesFilters[
                                                          index],
                                                });
                                          },
                                          child: EmployeeCard(
                                            employee: controller
                                                .employeesFilters[index],
                                          ),
                                        );
                                      },
                                      itemCount:
                                          controller.employeesFilters.length,
                                    ),
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
