

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
import '../../../../../domain/approval_entity.dart';
import '../../common/approval_buttons.dart';

class MobileApprovalCard extends GetView<ApprovalController> {
  final int index;
  final List<ApprovalEntity> list;

  const MobileApprovalCard({super.key,required this.index, required this.list});

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
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MobileRichTextRow(type: 'Request Date'.tr, value: DateTimeHelper.formatDate(list[index].requestDate),),
                    MobileRichTextRow(type: 'Request Type'.tr, value: list[index].requestType),
                    MobileRichTextRow(type: 'Asset Name'.tr, value: list[index].brand + list[index].model),
                    MobileRichTextRow(type: 'Category'.tr, value: list[index].category),
                ]
                ),
              ),
              verticalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MobileRichTextRow(type: 'Subcategory', value: list[index].subcategory),
                      MobileRichTextRow(type: 'Model', value:list[index].model),
                      MobileRichTextRow(type: 'Brand', value: list[index].brand),
                      MobileRichTextRow(type: 'Quantity', value: list[index].quantity.toString()),
                    ]
                ),
              )
            ],
          ),


          verticalSpace(10),
          ApprovalButtons(approvalId: list[index].approvalId,)

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
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
          text: '${type.tr} : ',
          style: AppTextStyles.font12SecondaryBlackCairoRegular.copyWith(color: AppColors.inverseBase),
          children: [
            TextSpan(
                text: value,
                style: AppTextStyles.font12BlackCairoRegular
            )
          ]),
    );
  }
}







