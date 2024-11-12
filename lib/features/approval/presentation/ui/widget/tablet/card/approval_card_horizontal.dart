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
              RichTextRow(type: 'Request Date', value:DateTimeHelper.formatDate(controller.approvalList[index].requestDate),),

            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              ColumnText(type: 'Request Type', value: controller.approvalList[index].requestType),
              horizontalSpace(16),
              ColumnText(type: 'Asset Name', value: controller.approvalList[index].brand + controller.approvalList[index].model),
              horizontalSpace(16),
              ColumnText(type: 'Category', value: controller.approvalList[index].category),
              horizontalSpace(16),
              ColumnText(type: 'Subcategory', value: controller.approvalList[index].subcategory),
              horizontalSpace(16),
              ColumnText(type: 'Model', value:controller.approvalList[index].model),
              horizontalSpace(16),
              ColumnText(type: 'Brand', value: controller.approvalList[index].brand),
              horizontalSpace(16),
              ColumnText(type: 'Quantity', value: controller.approvalList[index].quantity.toString()),
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

class RichTextRow extends StatelessWidget {
  final String type;
  final String value;
  const RichTextRow({
    super.key, required this.type, required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        textAlign: TextAlign.end,
        text: TextSpan(
            text: '${type.tr} : ',
            style:context.isLandscape? AppTextStyles.font14SecondaryBlackCairoRegular :  AppTextStyles.font16secondaryBlackRegularCairo ,
            children: [
              TextSpan(
                  text: value.tr,
                  style: context.isLandscape? AppTextStyles.font14BlackCairoRegular : AppTextStyles.font16BlackCairoMedium
              )
            ]),
      ),
    );
  }
}






