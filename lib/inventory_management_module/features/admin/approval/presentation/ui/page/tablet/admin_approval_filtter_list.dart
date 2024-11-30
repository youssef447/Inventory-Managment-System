// by : mohamed ashraf
// date : 30/11/2024

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';

import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../employee/requests/entities/request_entity.dart';
import '../../../controller/admin_approval_controller.dart';
import '../../constants/approval_id_constant.dart';
import '../../widget/common/approval_categories_card.dart';
import '../mobile/card/mobile_admin_approval_card.dart';

class AdminApprovalFilterList extends StatelessWidget {
  AdminApprovalFilterList(
      {super.key, required this.list, required this.loading});

  List<RequestEntity> list;
  bool loading;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const AppCircleProgress()
        : list.isEmpty
            ? const NoDataGif()
            :  GetBuilder<AdminApprovalController>(
                 id:  ApprovalAdminIdConstant.changeListview,
              builder: (controller) {
                return controller.gridViewSelect ? StaggeredGrid.count(
                    crossAxisCount: context.isTablett ? Get.width > 1200 ? 3 : 2 : 1,
                    mainAxisSpacing: 15.h,
                    crossAxisSpacing: context.isLandscapee ? 20.w : 16.w,
                    children: List.generate(
                      list.length,
                      (index) {
                        return GestureDetector(onTap: () {
                          context
                              .navigateTo(Routes.adminApprovalDetails, arguments: {
                            RouteArguments.adminApprovalDetailsArg: list[index],
                          });
                        }, child: context.isTablett ? ApprovalCategoriesCard(
                          request: list[index],
                        ) : MobileAdminApprovalCard(
                          request: list[index],

                        ));
                      },
                    ),
                  ) : Text('data');
              }
            );
  }
}
