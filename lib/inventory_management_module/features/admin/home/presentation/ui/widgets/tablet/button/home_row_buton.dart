// by : Mohamed Ashraf , Youssef Ashraf
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/widgets/buttons/app_default_button.dart';

import '../../../../../../../../core/routes/app_routes.dart';

class HomeAdminRowButton extends StatelessWidget {
  const HomeAdminRowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isTablett
        ? Row(
            children: [
              AppDefaultButton(
                text: 'My Request'.tr,
                onPressed: () {
                  context.navigateTo(Routes.home);
                },
              ),
              const Spacer(),
              AppDefaultButton(
                text: 'Employee'.tr,
                onPressed: () {
                  context.navigateTo(Routes.employees);
                },
              ),
              horizontalSpace(10),
              AppDefaultButton(
                text: 'Approval'.tr,
                onPressed: () {
                  context.navigateTo(Routes.adminHomeApproval);
                },
              ),
              horizontalSpace(10),
              AppDefaultButton(
                text: 'Dashboard'.tr,
                onPressed: () {
                  context.navigateTo(Routes.dashboard);
                },
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppDefaultButton(
                text: 'MyRequest'.tr,
                width: 100,
                height: 37.h,
                onPressed: () {
                  context.navigateTo(Routes.home);
                },
              ),
              verticalSpace(20),
              Row(
                children: [
                  AppDefaultButton(
                    text: 'Employee'.tr,
                    width: 100,
                    height: 37.h,
                    onPressed: () {
                      context.navigateTo(Routes.employees);
                    },
                  ),
                  horizontalSpace(10),
                  AppDefaultButton(
                    text: 'Approval'.tr,
                    width: 100,
                    height: 37.h,
                    onPressed: () {
                      context.navigateTo(Routes.adminHomeApproval);
                    },
                  ),
                  horizontalSpace(10),
                  AppDefaultButton(
                    text: 'Dashboard'.tr,
                    width: 100,
                    height: 37.h,
                    onPressed: () {
                      context.navigateTo(Routes.dashboard);
                    },
                  ),
                ],
              ),
            ],
          );
  }
}
