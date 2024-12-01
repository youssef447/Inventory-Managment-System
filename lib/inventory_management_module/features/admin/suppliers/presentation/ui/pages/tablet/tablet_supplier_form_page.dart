import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/enums/business_type.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../../core/widgets/attachments/attachment_card.dart';
import '../../../../../../../core/widgets/buttons/app_default_button.dart';
import '../../../../../../../core/widgets/buttons/default_switch_button.dart';
import '../../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../../core/widgets/dialog/default_dialog.dart';
import '../../../../../../../core/widgets/fields/labeled_dropDown_field.dart';
import '../../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../constants/suppliers_ids.dart';
import '../../../../domain/supplier_entity.dart';
import '../../../controller/supplier_form_controller.dart';
part '../../widgets/tablet/tablet_docs_forms.dart';

//Youssef Ashraf
///Represents The Suppliers Form in Tablet View
class TabletSupplierFormPage extends GetView<SupplierFormController> {
  final SupplierEntity? supplier;

  const TabletSupplierFormPage({super.key, this.supplier});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          controller.resetResources();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.isLandscapee ? 30.w : 20.w,
              vertical: 16.h,
            ),
            child: GetBuilder<SupplierFormController>(
                id: SuppliersIds.supplierForm,
                builder: (controller) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBar(
                          titles: [
                            supplier == null
                                ? 'Add New Supplier'
                                : 'Supplier Details'
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
                          'General Supplier Details'.tr,
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
                                controller: controller.supplierIDController,
                                label: 'Supplier ID',
                                readOnly: controller.automaticIds,
                              ),
                            ),
                            horizontalSpace(20),
                            Expanded(
                              child: LabeledFormField(
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller: controller.supplierNameController,
                                label: 'Supplier Name',
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
                                label: 'Business Type',
                                textButton:
                                    controller.selectedBusinessType?.getName,
                                onChanged: (value) {
                                  controller.updateBusinessType(value);
                                },
                                items: List.generate(
                                  BusinessType.values.length,
                                  (index) {
                                    return DropdownMenuItem(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      value: BusinessType.values[index],
                                      child: Text(
                                        BusinessType.values[index].getName.tr,
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
                                    controller.catalogOfProductsController,
                                label: 'Catalog Of Products',
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
                                controller: controller.taxNumController,
                                label: 'Tax Number',
                                readOnly: !controller.isEditable,
                              ),
                            ),
                            horizontalSpace(20),
                            const Spacer(),
                          ],
                        ),
                        verticalSpace(16),
                        Text(
                          'Point Of Contract'.tr,
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
                                controller: controller.firstNameController,
                                label: 'First Name',
                                readOnly: !controller.isEditable,
                              ),
                            ),
                            horizontalSpace(20),
                            Expanded(
                              child: LabeledFormField(
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller: controller.middleNameController,
                                label: 'Middle Name',
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
                                controller: controller.lastNameController,
                                label: 'Last Name',
                                readOnly: !controller.isEditable,
                              ),
                            ),
                            horizontalSpace(20),
                            Expanded(
                              child: LabeledFormField(
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller: controller.titleNameController,
                                label: 'Title',
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
                                controller: controller.phoneNumberController,
                                label: 'Phone Number',
                                readOnly: !controller.isEditable,
                              ),
                            ),
                            horizontalSpace(20),
                            Expanded(
                              child: LabeledFormField(
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller: controller.emailController,
                                label: 'Email',
                                readOnly: !controller.isEditable,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(16),
                        Text(
                          'Contract Details'.tr,
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
                                controller: controller.startDateController,
                                label: 'Contract Start Date',
                                readOnly: !controller.isEditable,
                                date: true,
                              ),
                            ),
                            horizontalSpace(20),
                            Expanded(
                              child: LabeledFormField(
                                backGroundColor: Get.isDarkMode
                                    ? AppColors.field
                                    : AppColors.white,
                                controller: controller.endDateController,
                                label: 'Contract End Date',
                                readOnly: !controller.isEditable,
                                date: true,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(16),
                        LabeledFormField(
                          backGroundColor: Get.isDarkMode
                              ? AppColors.field
                              : AppColors.white,
                          controller: controller.additionalNotesController,
                          label: 'Additional Notes',
                          readOnly: false,
                          expands: true,
                        ),
                        verticalSpace(40),
                        const TabletDocsForms(),
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
