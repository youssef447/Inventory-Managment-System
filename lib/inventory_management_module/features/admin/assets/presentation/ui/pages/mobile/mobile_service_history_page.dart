import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import 'package:inventory_management/inventory_management_module/features/admin/employees/presentation/ui/pages/mobile/mobile_admin_employee_details_page.dart';

import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../../employees/presentation/ui/pages/tablet/tablet_admin_employee_details_page.dart';
import '../../../../domin/service_entity.dart';
import '../../../controller/admin_assets_controller.dart';

class MobileServiceHistoryPage extends GetView<AdminAssetsController> {
  final ServiceEntity serviceEntity;
  const MobileServiceHistoryPage({super.key, required this.serviceEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.isLandscapee ? 34.w : 16.w,
                vertical: 16.h,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(16),
                    CustomAppBar(
                      titles:  const ['Asset','Service History'],
                      titleNavigations: [
                            () => Navigator.of(context).pop(),
                      ],
                    ),
                    verticalSpace(12),
                    MobileAdminEmployeeDetailsCard(
                      userEntity: serviceEntity.userEntity,
                    ),
                    verticalSpace(12),
                    Row(
                      children: [
                        Text(
                          'Repair Details'.tr,
                          style: AppTextStyles.font18BlackCairoRegular,
                        ),
                     Spacer(),
                        DefaultRichText(
                          label: 'Status'.tr,
                          value: serviceEntity.status,
                          labelStyle: AppTextStyles.font14SecondaryBlackCairoMedium
                              .copyWith(color: AppColors.secondaryBlack),
                          style: AppTextStyles.font14SecondaryBlackCairoMedium.copyWith(
                            color: serviceEntity.status.getColor,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(24),
                    LabeledFormField(
                      backGroundColor: AppColors.card,
                      controller: controller.issueTypeController,
                      label: 'Issue Type'.tr
                      ),
                    verticalSpace(12),
                    LabeledFormField(
                      backGroundColor: AppColors.card,
                        controller: controller.requestRepairDateController,
                        label: 'Request Repair Date'.tr,
                      date: true,
                    ),
                    verticalSpace(12),
                    LabeledFormField(
                        backGroundColor: AppColors.card,
                        expands: true,
                        controller: controller.descriptionController,
                        label: 'Description'.tr
                    ),
                    verticalSpace(24),
                    Text(
                      'Maintenance Details'.tr,
                      style: AppTextStyles.font18BlackCairoRegular,
                    ),
                    verticalSpace(12),
                    LabeledFormField(
                        backGroundColor: AppColors.card,
                        controller: controller.maintenanceIDController,
                        label: 'Maintenance ID'.tr
                    ),
                    verticalSpace(12),
                    LabeledFormField(
                      backGroundColor: AppColors.card,
                      controller: controller.maintenanceStartDateController,
                      label: 'Maintenance Start Date'.tr,
                      date: true,
                    ),
                    verticalSpace(12),
                    LabeledFormField(
                      backGroundColor: AppColors.card,
                      controller: controller.maintenanceEndDateController,
                      label: 'Maintenance End Date'.tr,
                      date: true,
                    ),
                    verticalSpace(12),
                    LabeledFormField(
                      backGroundColor: AppColors.card,
                      controller: controller.nextScheduledMaintenanceController,
                      label: 'Next Scheduled Maintenance'.tr,
                      date: true,
                    ),
                    verticalSpace(24),
                    Text(
                      'Service Provider Information'.tr,
                      style: AppTextStyles.font18BlackCairoRegular,
                    ),
                    verticalSpace(12),
                    LabeledFormField(
                      backGroundColor: AppColors.card,
                      controller: controller.serviceProviderController,
                      label: 'Service Provider'.tr,
                      date: true,
                    ),
                    verticalSpace(12),
                    LabeledFormField(
                      backGroundColor: AppColors.card,
                      controller: controller.serviceProviderFirstNameController,
                      label: 'First Name'.tr,
                      date: true,
                    ),
                    verticalSpace(12),
                    LabeledFormField(
                      backGroundColor: AppColors.card,
                      controller: controller.serviceProviderLastNameController,
                      label: 'Last Name'.tr,
                      date: true,
                    ),
                    verticalSpace(24),
                    LabeledFormField(
                      backGroundColor: AppColors.card,
                      controller: controller.descriptionOrIssueReportedController,
                      label: 'Description or Issue Reported'.tr,
                      expands: true,
                    ),
                    verticalSpace(24),
                    LabeledFormField(
                      backGroundColor: AppColors.card,
                      controller: controller.wasAPartReplacedController,
                      label: 'Was A Part Replaced ?'.tr,
                      expands: true,
                    ),
                    verticalSpace(24),
                    LabeledFormField(
                      backGroundColor: AppColors.card,
                      controller: controller.warrantyCoverageController,
                      label: 'Warranty Coverage'.tr,
                      date: true,
                    ),
                      verticalSpace(32),
                    LabeledFormField(
                      backGroundColor: AppColors.card,
                      controller: controller.warrantyExpirationDateController,
                      label: 'Warranty Expiration Date'.tr,
                      date: true,
                    ),
                    verticalSpace(16),
                    Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        'Maintenance Approved By'.tr,
                        style: AppTextStyles.font16TextMediumCairo,
                      ),
                    ),
                    verticalSpace(8),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundImage: NetworkImage(
                            serviceEntity.userEntity.profileImage,
                          ),
                        ),
                        horizontalSpace(4),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${serviceEntity.userEntity.firstName} ${serviceEntity.userEntity.lastName}',
                                style: context.isTablett ? AppTextStyles.font16BlackCairoRegular : AppTextStyles.font12BlackCairoRegular ,
                              ),
                              Text(
                                serviceEntity.userEntity.jobTitle,
                                style: context.isTablett ? AppTextStyles.font16BlackCairoRegular : AppTextStyles.font12BlackCairoRegular ,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(16),
                    LabeledFormField(
                      backGroundColor: AppColors.card,
                      controller: controller.dateOfApprovalController,
                      label: 'Date Of Approval'.tr,
                      date: true,
                    ),
                    verticalSpace(35),

                  ],
                ),
              ),
            ))
    );
  }
}
