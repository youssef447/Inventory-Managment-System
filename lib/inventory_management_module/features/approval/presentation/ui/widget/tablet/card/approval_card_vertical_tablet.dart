//by : Mohamed Ashraf
//date :11/11/2024

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../domain/approval_entity.dart';
import '../../common/approval_buttons.dart';

class ApprovalCardVerticalTablet extends StatelessWidget {
  final int index;
  final List<ApprovalEntity> list;
  const ApprovalCardVerticalTablet(
      {super.key, required this.index, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 17, left: 17),
      decoration: BoxDecoration(
          color: AppColors.base, borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
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
                Expanded(
                    child: Text(
                  list[index].userName,
                  style: AppTextStyles.font18BlackMediumCairo,
                )),
              ],
            ),
            verticalSpace(10),
            DefaultRichText(
              label: 'Request Date'.tr,
              value: DateTimeHelper.formatDate(list[index].requestDate),
            ),
            DefaultRichText(
                label: 'Request Type'.tr, value: list[index].requestType),
            DefaultRichText(
                label: 'Asset Name'.tr,
                value: list[index].brand + list[index].model),
            DefaultRichText(label: 'Category'.tr, value: list[index].category),
            DefaultRichText(label: 'Subcategory'.tr, value: list[index].subcategory),
            DefaultRichText(label: 'Model'.tr, value: list[index].model),
            DefaultRichText(label: 'Brand'.tr, value: list[index].brand),
            DefaultRichText(label: 'Quantity'.tr, value: list[index].quantity.toString()),
            verticalSpace(10),
            ApprovalButtons(
              approvalId: list[index].approvalId,
            )
          ],
        ),
      ),
    );
  }
}
