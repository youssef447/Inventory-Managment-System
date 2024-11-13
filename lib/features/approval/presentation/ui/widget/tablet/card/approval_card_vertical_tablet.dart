//by : Mohamed Ashraf
//date :11/11/2024

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/helpers/spacing_helper.dart';
import 'package:inventory_management/core/theme/app_colors.dart';
import 'package:inventory_management/features/approval/presentation/controller/approval_controller.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../common/approval_buttons.dart';
import '../../common/rich_text_row.dart';

class ApprovalCardVerticalTablet extends GetView<ApprovalController> {
  final int index;
  const ApprovalCardVerticalTablet({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  const EdgeInsets.only(top: 10,right: 17,left: 17),
      decoration: BoxDecoration(
        color: AppColors.base,
            borderRadius: BorderRadius.circular(16)
      ),
      child: SingleChildScrollView(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(radius: 26,backgroundImage: AssetImage(AppAssets.user),),
                horizontalSpace(12),
                 Expanded(child: Text('Mai Mohamed',style:  AppTextStyles.font18BlackMediumCairo,)),
              ],
            ),
            verticalSpace(10),
            RichTextRow(type: 'Request Date'.tr, value:DateTimeHelper.formatDate(controller.approvalList[index].requestDate),),
            RichTextRow(type: 'Request Type'.tr, value: controller.approvalList[index].requestType),
            RichTextRow(type: 'Asset Name'.tr, value: controller.approvalList[index].brand + controller.approvalList[index].model),
            RichTextRow(type: 'Category'.tr, value: controller.approvalList[index].category),
            RichTextRow(type: 'Subcategory'.tr, value: controller.approvalList[index].subcategory),
            RichTextRow(type: 'Model'.tr, value:controller.approvalList[index].model),
            RichTextRow(type: 'Brand'.tr, value: controller.approvalList[index].brand),
            RichTextRow(type: 'Quantity'.tr, value: controller.approvalList[index].quantity.toString()),
            verticalSpace(10),
           const ApprovalButtons()

          ],
        ),
      ),
    );
  }
}








