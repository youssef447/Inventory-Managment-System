import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/constants/app_assets.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';

import '../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../../core/widgets/buttons/app_default_button.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../core/widgets/dialog/default_dialog.dart';
import '../../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../../employees/presentation/ui/pages/tablet/tablet_admin_employee_details_page.dart';
import '../../../../domin/service_entity.dart';
import '../../../controller/admin_assets_controller.dart';

class TabletServiceHistoryPage extends GetView<AdminAssetsController> {
  final ServiceEntity serviceEntity;
  const TabletServiceHistoryPage({super.key, required this.serviceEntity});

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
                    TabletEmployeeDetailsCard(
                      userEntity: serviceEntity.userEntity,
                    ),
                    verticalSpace(12),
                    Row(
                      children: [
                        Text(
                          'Repair Details'.tr,
                          style: AppTextStyles.font22BlackBoldCairo,
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
                    verticalSpace(12),
                    Row(
                      children: [
                        Expanded(
                          child: LabeledFormField(
                            backGroundColor: AppColors.card,
                            controller: controller.issueTypeController,
                            label: 'Issue Type'.tr
                            ),
                        ),
                        horizontalSpace(15),
                        Expanded(
                          child: LabeledFormField(
                            backGroundColor: AppColors.card,
                              controller: controller.requestRepairDateController,
                              label: 'Request Repair Date'.tr,
                            date: true,
                          ),
                        )
                      ],
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
                      style: AppTextStyles.font22BlackBoldCairo,
                    ),
                    verticalSpace(12),
                    Row(
                      children: [
                        Expanded(
                          child: LabeledFormField(
                              backGroundColor: AppColors.card,
                              controller: controller.maintenanceIDController,
                              label: 'Maintenance ID'.tr
                          ),
                        ),
                        horizontalSpace(15),
                        Expanded(
                          child: LabeledFormField(
                            backGroundColor: AppColors.card,
                            controller: controller.maintenanceStartDateController,
                            label: 'Maintenance Start Date'.tr,
                            date: true,
                          ),
                        )
                      ],
                    ),
                    verticalSpace(12),
                    Row(
                      children: [
                        Expanded(
                          child: LabeledFormField(
                            backGroundColor: AppColors.card,
                            controller: controller.maintenanceEndDateController,
                            label: 'Maintenance End Date'.tr,
                            date: true,
                          ),
                        ),
                        horizontalSpace(15),
                        Expanded(
                          child: LabeledFormField(
                            backGroundColor: AppColors.card,
                            controller: controller.nextScheduledMaintenanceController,
                            label: 'Next Scheduled Maintenance'.tr,
                            date: true,
                          ),
                        )
                      ],
                    ),
                    verticalSpace(24),
                    Text(
                      'Service Provider Information'.tr,
                      style: AppTextStyles.font22BlackBoldCairo,
                    ),
                    verticalSpace(12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              LabeledFormField(
                                backGroundColor: AppColors.card,
                                controller: controller.serviceProviderController,
                                label: 'Service Provider'.tr,
                                date: true,
                              ),
                              horizontalSpace(15),
                              LabeledFormField(
                                backGroundColor: AppColors.card,
                                controller: controller.serviceProviderFirstNameController,
                                label: 'First Name'.tr,
                                date: true,
                              ),
                            ],
                          ),
                        ),
                        horizontalSpace(15),
                        Expanded(
                          child: LabeledFormField(
                            backGroundColor: AppColors.card,
                            controller: controller.serviceProviderLastNameController,
                            label: 'Last Name'.tr,
                            date: true,
                          ),
                        ),


                      ],
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              LabeledFormField(
                                backGroundColor: AppColors.card,
                                controller: controller.warrantyCoverageController,
                                label: 'Warranty Coverage'.tr,
                                date: true,
                              ),
                                verticalSpace(32),
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
                              )
                            ],
                          ),
                        ),
                        horizontalSpace(15),
                        Expanded(
                          child: Column(
                            children: [
                              LabeledFormField(
                                backGroundColor: AppColors.card,
                                controller: controller.warrantyExpirationDateController,
                                label: 'Warranty Expiration Date'.tr,
                                date: true,
                              ),
                              verticalSpace(34),
                              LabeledFormField(
                                backGroundColor: AppColors.card,
                                controller: controller.dateOfApprovalController,
                                label: 'Date Of Approval'.tr,
                                date: true,
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                   verticalSpace(42),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: AppDefaultButton(
                        text: 'Next'.tr,
                        color: AppColors.primary,
                        onPressed: () {
                          GetDialogHelper.generalDialog(
                            child: DefaultDialog(
                                width: context.isPhone ? 343.w : 411.w,
                                showButtons: true,
                                icon: AppAssets.canceled,
                                title: 'Unassign'.tr,
                                subTitle:
                                'Are You sure You Want to Unassign This Asset?'
                                    .tr,
                                onConfirm: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                }),
                            context: context,
                          );

                        },
                      ),
                    )


                  ],
                ),
              ),
            ))
    );
  }
}
