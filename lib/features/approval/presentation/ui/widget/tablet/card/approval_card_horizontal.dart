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
import '../../common/rich_text_row.dart';
import '../button/approval_button_vertical.dart';

class ApprovalCardHorizontal extends GetView<ApprovalController> {
  final int index;
  const ApprovalCardHorizontal({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  const EdgeInsets.symmetric(vertical: 10,horizontal: 17),
      decoration: BoxDecoration(
          color: AppColors.base,
          borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 26,backgroundImage: AssetImage(AppAssets.user),),
              horizontalSpace(12),
              Text('Mai Mohamed',style:  AppTextStyles.font18BlackMediumCairo,),
              const Spacer(),
              RichTextRow(type: 'Request Date', value:DateTimeHelper.formatDate(controller.allApprovalList[index].requestDate),),

            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              ColumnText(type: 'Request Type', value: controller.allApprovalList[index].requestType),
              horizontalSpace(16),
              ColumnText(type: 'Asset Name', value: controller.allApprovalList[index].brand + controller.allApprovalList[index].model),
              horizontalSpace(16),
              ColumnText(type: 'Category', value: controller.allApprovalList[index].category),
              horizontalSpace(16),
              ColumnText(type: 'Subcategory', value: controller.allApprovalList[index].subcategory),
              horizontalSpace(16),
              ColumnText(type: 'Model', value:controller.allApprovalList[index].model),
              horizontalSpace(16),
              ColumnText(type: 'Brand', value: controller.allApprovalList[index].brand),
              horizontalSpace(16),
              ColumnText(type: 'Quantity', value: controller.allApprovalList[index].quantity.toString()),
              Spacer(),
              ApprovalButtonVertical()

            ],
          )

        ],
      ),
    );
  }
}

class ColumnText extends StatelessWidget {
  final String type;
  final String value;
  const ColumnText({
    super.key, required this.type, required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(type.tr,style: AppTextStyles.font14SecondaryBlackCairoRegular,),
        verticalSpace(8),
        Text(value,style: AppTextStyles.font14BlackCairoRegular,),
      ],
    );
  }
}







