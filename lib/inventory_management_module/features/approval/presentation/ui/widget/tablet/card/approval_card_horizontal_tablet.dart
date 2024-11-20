//by : Mohamed Ashraf
//date :11/11/2024
// this widget response to show card item in tablet when user select list view

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../domain/approval_entity.dart';
import '../../../../controller/approval_controller.dart';
import '../../common/rich_text_row.dart';
import '../button/approval_button_vertical.dart';

class ApprovalCardHorizontalTablet extends GetView<ApprovalController> {
  final int index;
  final List<ApprovalEntity> list;

  const ApprovalCardHorizontalTablet(
      {super.key, required this.index, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
      decoration: BoxDecoration(
          color: AppColors.base, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage(AppAssets.user),
              ),
              horizontalSpace(12),
              Text(
                list[index].userName,
                style: AppTextStyles.font18BlackMediumCairo,
              ),
              const Spacer(),
              RichTextRow(
                type: 'Request Date',
                value: DateTimeHelper.formatDate(list[index].requestDate),
              ),
            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              ColumnText(type: 'Request Type', value: list[index].requestType),
              horizontalSpace(16),
              ColumnText(
                  type: 'Asset Name',
                  value: list[index].requestType + list[index].model),
              horizontalSpace(16),
              ColumnText(type: 'Category', value: list[index].category),
              horizontalSpace(16),
              ColumnText(type: 'Subcategory', value: list[index].subcategory),
              horizontalSpace(16),
              ColumnText(type: 'Model', value: list[index].model),
              horizontalSpace(16),
              ColumnText(type: 'Brand', value: list[index].brand),
              horizontalSpace(16),
              ColumnText(
                  type: 'Quantity', value: list[index].quantity.toString()),
              const Spacer(),
              ApprovalButtonVertical(
                approvalId: list[index].approvalId,
              )
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
    super.key,
    required this.type,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type.tr,
          style: AppTextStyles.font14SecondaryBlackCairoRegular,
        ),
        verticalSpace(8),
        Text(
          value,
          style: AppTextStyles.font14BlackCairoRegular,
        ),
      ],
    );
  }
}
