// by : Mohamed Ashraf
//date : 10/11/2024

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/fields/date_field.dart';
import '../../../../../../../core/widgets/fields/text_single_field.dart';
import '../../../controller/assets_controller.dart';


class MobileAssetsDetails extends GetView<AssetsController> {
  const MobileAssetsDetails({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: PopScope(
          onPopInvoked: (didPop) {
            controller.resetAssetsDetails();
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: SvgPicture.asset(
                            AppAssets.arrowBack,
                          )),
                      Text(
                        'Asset Details'.tr,
                        style: AppTextStyles.font26BlackSemiBoldCairo,
                      ),
                    ],
                  ),
                  verticalSpace(20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppAssets.image,
                        width: 65.w,
                        height: 65.h,
                      ),
                      horizontalSpace(4),
                      Text(
                        controller.assetsList[index].brand +
                            controller.assetsList[index].model,
                        style: AppTextStyles.font14BlackCairoMedium,
                      ),
                      verticalSpace(3),
                    ],
                  ),
                  verticalSpace(16),
                  TextSingleField(
                    typeName: 'Status'.tr,
                    controller: controller.statusController,
                    isReadOnly: true,
                    style: AppTextStyles.font16BlackRegularCairo.copyWith(
                        color: controller.assetsList[index].status.getColor),
                  ),
                  verticalSpace(12),
                  TextSingleField(
                    typeName: 'Asset ID'.tr,
                    controller: controller.assetIdController,
                    isReadOnly: true,
                  ),
                  verticalSpace(12),
                  TextSingleField(
                    typeName: 'Category'.tr,
                    controller: controller.categoryController,
                    isReadOnly: true,
                  ),
                  verticalSpace(12),
                  TextSingleField(
                    typeName: 'Subcategory'.tr,
                    controller: controller.subcategoryController,
                    isReadOnly: true,
                  ),
                  verticalSpace(12),
                  TextSingleField(
                    typeName: 'Model'.tr,
                    controller: controller.modelController,
                    isReadOnly: true,
                  ),
                  verticalSpace(12),
                  TextSingleField(
                    typeName: 'Brand'.tr,
                    controller: controller.brandController,
                    isReadOnly: true,
                  ),
                  verticalSpace(12),
                  TextSingleField(
                    typeName: 'Quantity'.tr,
                    controller: controller.quantityController,
                    isReadOnly: true,
                  ),
                  verticalSpace(12),
                  TextSingleField(
                    typeName: 'Maintenance Frequency'.tr,
                    controller: controller.maintenanceFrequencyController,
                    isReadOnly: true,
                  ),
                  verticalSpace(12),
                  DateField(
                    dateController: controller.dateReceivedController,
                    headerName: 'Date Received'.tr,
                  ),
                  verticalSpace(12),
                  DateField(
                    dateController: controller.dateReturnController,
                    headerName: 'Date Return'.tr,
                  ),
                  verticalSpace(40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
