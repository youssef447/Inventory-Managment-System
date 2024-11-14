

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

class MobileApprovalCard extends GetView<ApprovalController> {
  final int index;
  const MobileApprovalCard({super.key,required this.index});

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
          Row(
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MobileRichTextRow(type: 'Request Date'.tr, value:DateTimeHelper.formatDate(controller.allApprovalList[index].requestDate),),
                  MobileRichTextRow(type: 'Request Type'.tr, value: controller.allApprovalList[index].requestType),
                  MobileRichTextRow(type: 'Asset Name'.tr, value: controller.allApprovalList[index].brand + controller.allApprovalList[index].model),
                  MobileRichTextRow(type: 'Category'.tr, value: controller.allApprovalList[index].category),
              ]
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MobileRichTextRow(type: 'Subcategory', value: controller.allApprovalList[index].subcategory),
                    MobileRichTextRow(type: 'Model', value:controller.allApprovalList[index].model),
                    MobileRichTextRow(type: 'Brand', value: controller.allApprovalList[index].brand),
                    MobileRichTextRow(type: 'Quantity', value: controller.allApprovalList[index].quantity.toString()),
                  ]
              )
            ],
          ),


          verticalSpace(10),
         const ApprovalButtons()

        ],
      ),
    );
  }
}



class MobileRichTextRow extends StatelessWidget {
  final String type;
  final String value;
  const MobileRichTextRow({
    super.key, required this.type, required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.end,
      text: TextSpan(
          text: '${type.tr} : ',
          style: AppTextStyles.font12SecondaryBlackCairoRegular,
          children: [
            TextSpan(
                text: value,
                style: AppTextStyles.font12BlackCairoRegular
            )
          ]),
    );
  }
}







