import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../constants/ids.dart';
import '../../../../../../../core/enums/departments.dart';
import '../../../../../../../core/enums/sort_options.dart';
import '../../../controller/employees_controller.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../widgets/common/cards/employee_card.dart';
part '../../widgets/tablet/employee_search_filter.dart';

//Youssef Ashraf
///Represents The Employees List Page  in Tablet View
class TabletAdminEmployeesPage extends GetView<EmployeesController> {
  const TabletAdminEmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        controller.resetResources();
      },
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.isLandscapee ? 30.w : 16.w,
                vertical: 16.h,
              ),
              child: GetBuilder<EmployeesController>(
                  id: AdminEmployeesIds.employeesPage,
                  builder: (controller) {
                    return controller.loading
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomAppBar(
                                titles: const ['Employees'],
                                titleNavigations: [
                                  () => Navigator.of(context).pop(),
                                ],
                              ),
                              const Expanded(
                                child: AppCircleProgress(),
                              ),
                            ],
                          )
                        : controller.employees.isEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  verticalSpace(16),
                                  CustomAppBar(
                                    titles: const ['Employees'],
                                    titleNavigations: [
                                      () => Navigator.of(context).pop(),
                                    ],
                                  ),
                                  const Expanded(
                                    child: NoDataGif(),
                                  ),
                                ],
                              )
                            : SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomAppBar(
                                      titles: const ['Employees'],
                                      titleNavigations: [
                                        () => Navigator.of(context).pop(),
                                      ],
                                    ),
                                    verticalSpace(12),
                                    const TabletEmployeeSearchFilter(),
                                    verticalSpace(12),
                                    StaggeredGrid.count(
                                      crossAxisCount: Get.width > 1200 ? 4 : 3,
                                      mainAxisSpacing: 15.h,
                                      crossAxisSpacing:
                                          context.isLandscapee ? 20.w : 16.w,
                                      children: List.generate(
                                        controller.employeesFilters.length,
                                        (index) {
                                          return GestureDetector(
                                            onTap: () {
                                              context.navigateTo(
                                                  Routes.employeeDetails,
                                                  arguments: {
                                                    RouteArguments
                                                        .userEntity: controller
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
                                      ),
                                    ),
                                    verticalSpace(12),
                                  ],
                                ),
                              );
                  }),
            ),
          ),
        );
      }),
    );
  }
}
