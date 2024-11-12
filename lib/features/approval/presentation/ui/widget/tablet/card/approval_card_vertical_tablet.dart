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

class ApprovalCardVerticalTablet extends GetView<ApprovalController> {
  final int index;
  const ApprovalCardVerticalTablet({super.key,required this.index});

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
            ],
          ),
          verticalSpace(10),
          RichTextRow(type: 'Request Date', value:DateTimeHelper.formatDate(controller.approvalList[index].requestDate),),
          RichTextRow(type: 'Request Type', value: controller.approvalList[index].requestType),
          RichTextRow(type: 'Asset Name', value: controller.approvalList[index].brand + controller.approvalList[index].model),
          RichTextRow(type: 'Category', value: controller.approvalList[index].category),
          RichTextRow(type: 'Subcategory', value: controller.approvalList[index].subcategory),
          RichTextRow(type: 'Model', value:controller.approvalList[index].model),
          RichTextRow(type: 'Brand', value: controller.approvalList[index].brand),
          RichTextRow(type: 'Quantity', value: controller.approvalList[index].quantity.toString()),
          verticalSpace(10),
         const ApprovalButtons()
          
        ],
      ),
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






