import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../../core/widgets/buttons/app_default_button.dart';
import '../../../../../../../core/widgets/buttons/default_switch_button.dart';
import '../../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../../core/widgets/dialog/default_dialog.dart';
import '../../../../../../../core/widgets/fields/labeled_dropDown_field.dart';
import '../../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../constants/storage_ids.dart';
import '../../../../domain/storage_location_entity.dart';
import '../../../controller/storage_form_controller.dart';
import '../../widgets/common/assign_employee_section.dart';

class TabletStorageFormPage extends GetView<StorageFormController> {
  final StorageLocationAndQuantityEntity? storage;

  const TabletStorageFormPage({super.key, this.storage});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          controller.resetResources();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.isLandscapee ? 30.w : 20.w,
              vertical: 16.h,
            ),
            child: GetBuilder<StorageFormController>(
                id: StorageIds.storageForm,
                builder: (controller) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBar(
                          titles: [
                            storage == null
                                ? 'Add New Storage'
                                : 'Storage Details'
                          ],
                        ),
                        verticalSpace(17),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4.r),
                              child: Image.asset(
                                AppAssets.image,
                                width: 65.w,
                                height: 65.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Spacer(),
                            if (controller.isEditable)
                              Row(
                                children: [
                                  Text(
                                    'Create Automatic IDs'.tr,
                                    style: AppTextStyles.font14BlackCairoMedium,
                                  ),
                                  DefaultSwitchButton(
                                      value: controller.automaticIds,
                                      onChanged: (v) {
                                        controller.toggleAutomaticIds(
                                          v,
                                        );
                                      })
                                ],
                              ),
                            if (!controller.isEditable)
                              RectangledFilterCard(
                                color: AppColors.primary,
                                image: AppAssets.edit,
                                text: 'Edit',
                                onTap: () {
                                  controller.toggleEdit();
                                },
                              ),
                          ],
                        ),
                        verticalSpace(17),
                        Text(
                          'General Storage Details'.tr,
                          style: AppTextStyles.font18BlackCairoMedium,
                        ),
                        verticalSpace(16),
                        Row(
                          children: [
                            Expanded(
                              child: LabeledFormField(
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller: controller.locationIDController,
                                label: 'Location ID',
                                readOnly: controller.automaticIds,
                              ),
                            ),
                            horizontalSpace(20),
                            Expanded(
                              child: LabeledFormField(
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller: controller.locationNameController,
                                label: 'Location Name',
                                readOnly: !controller.isEditable,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(16),
                        Row(
                          children: [
                            Expanded(
                              child: LabeledFormField(
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller: controller.countryController,
                                label: 'Country',
                                readOnly: !controller.isEditable,
                              ),
                            ),
                            horizontalSpace(20),
                            Expanded(
                              child: LabeledFormField(
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller:
                                    controller.stateOrProvinceController,
                                label: 'State Or Province',
                                readOnly: !controller.isEditable,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(16),
                        Row(
                          children: [
                            Expanded(
                              child: LabeledFormField(
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller: controller.cityController,
                                label: 'City',
                                readOnly: !controller.isEditable,
                              ),
                            ),
                            horizontalSpace(20),
                            Expanded(
                              child: LabeledFormField(
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller: controller.postalCodeController,
                                label: 'Postal Code',
                                readOnly: !controller.isEditable,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(16),
                        Row(
                          children: [
                            Expanded(
                              child: LabeledDropdownField(
                                disabled: !controller.isEditable,
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller: TextEditingController(),
                                label: 'Location Type',
                                textButton: controller.selectedLocationType,
                                onChanged: (value) {
                                  controller.updateLocationType(value);
                                },
                                items: List.generate(
                                  controller.dummyLocationTypes.length,
                                  (index) {
                                    return DropdownMenuItem(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      value:
                                          controller.dummyLocationTypes[index],
                                      child: Text(
                                        controller.dummyLocationTypes[index],
                                        style: AppTextStyles
                                            .font14SecondaryBlackCairoMedium,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            horizontalSpace(20),
                            Expanded(
                              child: LabeledFormField(
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller:
                                    controller.storageCapacityController,
                                label: 'Storage Capacity',
                                readOnly: !controller.isEditable,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(16),
                        Row(
                          children: [
                            Expanded(
                              child: LabeledFormField(
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller:
                                    controller.conditionOfStorageController,
                                label: 'Condition Of Storage',
                                readOnly: !controller.isEditable,
                              ),
                            ),
                            horizontalSpace(20),
                            Expanded(
                              child: LabeledDropdownField(
                                disabled: !controller.isEditable,
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller: TextEditingController(),
                                label: 'Environment Control Type',
                                textButton: controller.selectedEnvControlType,
                                onChanged: (value) {
                                  controller.updateEnvControlType(value);
                                },
                                items: List.generate(
                                  controller.dummyEnvControlTypes.length,
                                  (index) {
                                    return DropdownMenuItem(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      value: controller
                                          .dummyEnvControlTypes[index],
                                      child: Text(
                                        controller.dummyEnvControlTypes[index],
                                        style: AppTextStyles
                                            .font14SecondaryBlackCairoMedium,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(16),
                        Row(
                          children: [
                            Expanded(
                              child: LabeledDropdownField(
                                disabled: !controller.isEditable,
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller: TextEditingController(),
                                label: 'Products',
                                textButton: controller.selectedProduct,
                                onChanged: (value) {
                                  controller.updateProduct(value);
                                },
                                items: List.generate(
                                  controller.dummyProducts.length,
                                  (index) {
                                    return DropdownMenuItem(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      value: controller.dummyProducts[index],
                                      child: Text(
                                        controller.dummyProducts[index],
                                        style: AppTextStyles
                                            .font14SecondaryBlackCairoMedium,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            horizontalSpace(20),
                            Expanded(
                              child: LabeledDropdownField(
                                disabled: !controller.isEditable,
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller: TextEditingController(),
                                label: 'Accessibility Level',
                                textButton: controller.selectedAcessLevel,
                                onChanged: (value) {
                                  controller.updateAccessLevel(value);
                                },
                                items: List.generate(
                                  controller.dummyAcessLevels.length,
                                  (index) {
                                    return DropdownMenuItem(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      value: controller.dummyAcessLevels[index],
                                      child: Text(
                                        controller.dummyAcessLevels[index],
                                        style: AppTextStyles
                                            .font14SecondaryBlackCairoMedium,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(16),
                        Row(
                          children: [
                            Expanded(
                              child: LabeledFormField(
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller: controller.equipmentAvailable,
                                label: 'Equiment Available',
                                readOnly: !controller.isEditable,
                              ),
                            ),
                            horizontalSpace(20),
                            const Spacer(),
                          ],
                        ),
                        verticalSpace(16),
                        LabeledFormField(
                          backGroundColor: Get.isDarkMode
                              ? AppColors.field
                              : AppColors.white,
                          controller: controller.additionalNotesController,
                          label: 'Additional Notes',
                          readOnly: !controller.isEditable,
                          expands: true,
                        ),
                        verticalSpace(40),
                        const AssignEmployeeSection(),
                        verticalSpace(40),
                        if (controller.isEditable)
                          Column(
                            children: [
                              verticalSpace(16),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: AppDefaultButton(
                                  text: 'Submit'.tr,
                                  color: AppColors.primary,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    GetDialogHelper.generalDialog(
                                      context: Get.context!,
                                      child: const DefaultDialog(
                                        title: 'Success',
                                        subTitle: 'Data Has Been Saved',
                                        lottieAsset: AppAssets.success,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
