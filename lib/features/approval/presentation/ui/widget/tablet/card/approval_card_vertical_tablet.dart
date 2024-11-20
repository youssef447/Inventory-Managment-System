//by : Mohamed Ashraf
//date :11/11/2024

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/helpers/spacing_helper.dart';
import 'package:inventory_management/core/theme/app_colors.dart';
import 'package:inventory_management/features/approval/domain/approval_entity.dart';
import 'package:inventory_management/features/approval/presentation/controller/approval_controller.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../common/approval_buttons.dart';
import '../../common/rich_text_row.dart';

class ApprovalCardVerticalTablet extends StatelessWidget {
  final int index;
  final List<ApprovalEntity> list;
  const ApprovalCardVerticalTablet({super.key,required this.index ,required this.list});

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
                 Expanded(child: Text(list[index].userName,style:  AppTextStyles.font18BlackMediumCairo,)),
              ],
            ),
            verticalSpace(10),
            RichTextRow(type: 'Request Date'.tr, value: DateTimeHelper.formatDate(list[index].requestDate),),
            RichTextRow(type: 'Request Type'.tr, value: list[index].requestType),
            RichTextRow(type: 'Asset Name'.tr, value: list[index].brand + list[index].model),
            RichTextRow(type: 'Category'.tr, value: list[index].category),
            RichTextRow(type: 'Subcategory'.tr, value: list[index].subcategory),
            RichTextRow(type: 'Model'.tr, value:list[index].model),
            RichTextRow(type: 'Brand'.tr, value: list[index].brand),
            RichTextRow(type: 'Quantity'.tr, value: list[index].toString()),
            verticalSpace(10),
            ApprovalButtons(approvalId: list[index].approvalId,)
          ],
        ),
      ),
    );
  }
}








