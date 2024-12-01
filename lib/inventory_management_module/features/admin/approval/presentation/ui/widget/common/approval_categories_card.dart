// by : mohamed ashraf
//date : 10 / 11 / 2024
//this widget response to loading and show data of assets in listView

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../employee/requests/entities/request_entity.dart';
import '../../../../../../products/enums/product_enums.dart';
import '../../../../../employees/presentation/ui/widgets/common/buttons/requested_approval_buttons.dart';
import '../../../controller/admin_approval_controller.dart';

class ApprovalCategoriesCard extends GetView<AdminApprovalController> {
  const ApprovalCategoriesCard({super.key, required this.request});
  final RequestEntity request;
  @override
  Widget build(BuildContext context) {
    final isConsumable = request.requestType == ProductType.consumable;
    return SizeAnimation(
      child: Container(
        padding:
            EdgeInsets.only(top: 10.h, right: 17.w, left: 17.w, bottom: 16.h),
        decoration: BoxDecoration(
            color: AppColors.card, borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundImage:
                      NetworkImage(request.userEntity.profileImage),
                ),
                horizontalSpace(12),
                Expanded(
                    child: Text(
                  '${request.userEntity.firstName} ${request.userEntity.lastName}',
                  style: AppTextStyles.font18BlackMediumCairo,
                )),
              ],
            ),
            verticalSpace(10),
            DefaultRichText(
              label: 'Request Date'.tr,
              value: DateTimeHelper.formatDate(request.requestDate),
            ),
            DefaultRichText(
                label: 'Request Type'.tr, value: request.requestType.getName),
            DefaultRichText(
                label: 'Asset Name'.tr,
                value: isConsumable
                    ? request.consumablesEntity!.name
                    : request.assetsEntity!.assetName),
            DefaultRichText(
                label: 'Category'.tr,
                value: isConsumable
                    ? request.consumablesEntity!.category
                    : request.assetsEntity!.category),
            DefaultRichText(
                label: 'Subcategory'.tr,
                value: isConsumable
                    ? request.consumablesEntity!.subcategory
                    : request.assetsEntity!.subcategory),
            DefaultRichText(
                label: 'Model'.tr,
                value: isConsumable
                    ? request.consumablesEntity!.model
                    : request.assetsEntity!.model),
            DefaultRichText(
                label: 'Brand'.tr,
                value: isConsumable
                    ? request.consumablesEntity!.brand
                    : request.assetsEntity!.brand),
            DefaultRichText(
                label: 'Quantity'.tr, value: request.quantity.toString()),
            verticalSpace(10),
            RequestedApprovalButtons(
              requestEntity: request,
            )
          ],
        ),
      ),
    );
  }
}
