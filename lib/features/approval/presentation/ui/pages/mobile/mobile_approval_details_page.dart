// by : Mohamed Ashraf
// date : 14/11/2024


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/helpers/spacing_helper.dart';
import 'package:inventory_management/core/theme/app_colors.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../controller/approval_controller.dart';
import '../../widget/common/approval_buttons.dart';
import '../../widget/mobile/card/mobile_approval_card.dart';

class MobileApprovalDetailsPage extends GetView<ApprovalController> {
  final int index;

  const MobileApprovalDetailsPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [
                  GestureDetector(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(
                        AppAssets.arrowBack,
                      )),
                  Text(
                    'Approvals'.tr,
                    style: AppTextStyles.font24MediumBlackCairo,
                  )
                ]),
                verticalSpace(16),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: 36.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primary),
                    child: SvgPicture.asset(
                      AppAssets.download,
                      color: AppColors.icon,
                    ),
                  ),
                ),
                verticalSpace(16),
                Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    height: 140.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.base),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Approvals'.tr,
                          style: AppTextStyles.font20MediumBlackCairo,
                        ),
                        verticalSpace(16),
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 26,
                              backgroundImage: AssetImage(AppAssets.user),
                            ),
                            horizontalSpace(12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MobileRichTextRow(
                                    type: 'Department'.tr, value: 'Marketing'),
                                verticalSpace(4),
                                MobileRichTextRow(
                                    type: 'Job Title'.tr,
                                    value: ' Marketing Manager'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
                verticalSpace(12),
                Align(
                  alignment: AlignmentDirectional.bottomStart,

                  child: Text(
                    'Request Information'.tr,
                    style: AppTextStyles.font18BlackCairoMedium,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.base),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppAssets.phone,
                        width: 65.w,
                        height: 65.h,
                        fit: BoxFit.fill,
                      ),
                      verticalSpace(8),
                      LabeledFormField(
                        controller: controller.approvalIdController,
                        label: 'Request ID'.tr,
                      ),
                      verticalSpace(8),

                      LabeledFormField(
                        controller: controller.priorityController,
                        label: 'Request Type'.tr,
                      ),
                      verticalSpace(8),
                      LabeledFormField(
                        controller: controller.expectedDeliveryDateController,
                        readOnly: false,
                        date: true,
                        label: 'Expected Delivery'.tr,
                        hintText: 'Expected Delivery'.tr,
                      ),
                      verticalSpace(8),
                      LabeledFormField(
                        controller: controller.expectedReturnDateController,
                        readOnly: false,
                        date: true,
                        label: 'Return Date'.tr,
                        hintText: 'Return Date'.tr,
                      ),
                      verticalSpace(8),
                    ],
                  )
                ),
                verticalSpace(16),
                Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text(
                    'Item Information'.tr,
                    style: AppTextStyles.font18BlackCairoMedium,
                  ),
                ),
                verticalSpace(8),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.base),
                  child: Column(
                    children: [

                      LabeledFormField(
                        controller: controller.categoryController,
                        label: 'Category'.tr,
                      ),
                      verticalSpace(8),

                      LabeledFormField(
                        controller: controller.subcategoryController,
                        label: 'SubCategory'.tr,
                      ),
                      verticalSpace(8),

                      LabeledFormField(
                        controller: controller.modelController,
                        label: 'Model'.tr,
                      ),
                      verticalSpace(8),

                      LabeledFormField(
                        controller: controller.brandController,
                        label: 'Brand'.tr,
                      ),
                      verticalSpace(8),

                      verticalSpace(8),
                      LabeledFormField(
                        controller: controller.quantityController,
                        label: 'Quantity'.tr,
                      ),
                    ],
                  ),
                ),
                verticalSpace(16),
                Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text(
                    'Additional Details'.tr,
                    style: AppTextStyles.font18BlackCairoMedium,
                  ),
                ),
                verticalSpace(8),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.base),
                  child: LabeledFormField(
                    controller: controller.additionalNoteController,
                    expands: true,
                    readOnly: false,
                    label: 'Notes and Comments'.tr,
                    hintText: 'Text here'.tr,
                  ),
                ),
                verticalSpace(24),


                 ApprovalButtons(approvalId:  controller.allApprovalList[index].approvalId,),
                verticalSpace(24),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
