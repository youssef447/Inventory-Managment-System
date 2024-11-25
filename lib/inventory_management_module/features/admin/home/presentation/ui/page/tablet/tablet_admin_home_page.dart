import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../../core/widgets/buttons/default_switch_button.dart';
import '../../../controller/admin_controller.dart';
import '../../widgets/tablet/button/home_row_buton.dart';
import '../../widgets/tablet/categories_admin_filter_row/categories_admin_filtter_row.dart';
import '../../widgets/tablet/search_filer/tablet_admin_search_filter.dart';

class TabletAdminHomePage extends GetView<AdminController> {
  const TabletAdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: context.isLandscapee
              ? EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h)
              : EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CustomAppBar(),
                  Expanded(
                    child: Row(
                      children: [
                        AnimatedToggleSwitch<bool>.size(
                          current: controller.isArabic,
                          values: const [false, true],
                          iconOpacity: 1,
                          height: 26.h,
                          indicatorSize: const Size.fromWidth(60),
                          customIconBuilder: (context, isArabic, global) =>
                              Text(
                            isArabic.value ? 'AR'.tr : 'ENG'.tr,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.lerp(
                                AppColors.primary,
                                AppColors.primary,
                                isArabic.animationValue,
                              ),
                            ),
                          ),
                          borderWidth: 1,
                          iconAnimationType: AnimationType.onHover,
                          style: ToggleStyle(
                            backgroundColor: AppColors.background,
                            indicatorColor: AppColors.secondaryPrimary,
                            borderColor: AppColors.border,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          selectedIconScale: 1.5,
                          onChanged: (value) {
                            controller.isArabic = value;
                            controller.toggleLanguage();
                          },
                        ),
                        const Spacer(),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: DefaultSwitchButton(
                              value: controller.isDarkModeEnabled,
                              onChanged: (bool value) async {
                                controller.toggleDarkMode();
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: DefaultSwitchButton(
                              value: controller.isAnimatable,
                              onChanged: (bool value) async {
                                controller.toggleAnimation();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              verticalSpace(20),
              const HomeAdminRowButton(),
              verticalSpace(20),
              const TabletCategoriesAdminFilterRow(),
              verticalSpace(20),
              const TabletAdminSearchFilter(),
              verticalSpace(20),
              Obx(
                () {
                  final index = controller.currentCategoryIndex.value;
                  return controller.tabletAdminTabs[index];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
