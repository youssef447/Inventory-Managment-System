//by : mohamed ashraf

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/enums/requests_enums.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import 'package:inventory_management/inventory_management_module/features/employee/consumables/domain/entity/consumables_entity.dart';
import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../employee/track_request/presentation/ui/pages/tablet/tablet_track_request_details_page.dart';
import '../../../../../../assets/presentation/ui/widget/tablet/dialog/retrieve_request_dialog.dart';

class HorizontalAssignedConsumableDetailsCard extends StatelessWidget {
  final ConsumablesEntity consumable;

  const HorizontalAssignedConsumableDetailsCard({super.key, required this.consumable});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: Image.asset(
                      AppAssets.pphone,
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  verticalSpace(4),
                  Text(
                    consumable.model + consumable.brand,
                    style: AppTextStyles.font16BlackCairoRegular,
                  ),
                  verticalSpace(8),
                ],
              ),
              horizontalSpace(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultRichText(
                    label: 'Consumable ID'.tr,
                    value: consumable.consumableId,
                  ),
                  DefaultRichText(
                    label: 'Product id'.tr,
                    value: consumable.consumableId,
                  ),
                  verticalSpace(2),
                  DefaultRichText(label: 'Request type'.tr, value: 'Consumable Request'),
                  verticalSpace(2),
                  DefaultRichText(
                    label: 'Quantity'.tr,
                    value: consumable.quantity,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultRichText(
                      label: 'Consumable ID'.tr, value: consumable.consumableId),
                  verticalSpace(2),
                  DefaultRichText(
                      label: 'Category'.tr, value: consumable.category),
                  verticalSpace(2),

                  DefaultRichText(
                      label: 'Subcategory'.tr, value: consumable.subcategory),

                  verticalSpace(2),
                  DefaultRichText(
                    label: 'Brand'.tr,
                    value: consumable.brand,
                  ),
                  verticalSpace(2),

                  verticalSpace(2),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultRichText(label: 'Model'.tr, value: consumable.model),
                  verticalSpace(2),
                  DefaultRichText(
                    label: 'Expiration Date'.tr,
                    value: consumable.expirationDate != null
                        ? DateTimeHelper.formatDate(
                      consumable.expirationDate!,
                    )
                        : 'Not Applicable'.tr,
                  ),
                  verticalSpace(2),
                  DefaultRichText(
                    label: 'Expected Lifetime'.tr,
                    value: consumable.expectedLifeTime != null
                        ? DateTimeHelper.formatDate(
                      consumable.expectedLifeTime!,
                    )
                        : 'Not Applicable'.tr,
                  ),
                  DefaultRichText(label: 'Unit Of Measurement'.tr, value: consumable.unitOfMeasurement.getName),

                ],
              ),
              const Spacer(),
              Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DefaultRichText(
                    label: 'Status',
                    value: consumable.status,
                    labelStyle: AppTextStyles.font14SecondaryBlackCairoMedium
                        .copyWith(color: AppColors.secondaryBlack),
                    style:
                    AppTextStyles.font14SecondaryBlackCairoMedium.copyWith(
                      color: consumable.status.getColor,
                    ),
                  ),
                  verticalSpace(4),
                  Image.asset(
                    AppAssets.qr,
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.download,
                        width: 16,
                        height: 16,
                        color: Colors.blue,
                      ),
                      horizontalSpace(4),
                      Text(
                        'Download As PNG',
                        style: AppTextStyles.font14SecondaryBlackCairoRegular
                            .copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.blue,
                          color: AppColors.blue,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),

          Row(
            mainAxisAlignment: context.isLandscapee
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            children: [
              _BuildIconLabel(
                'Assigned Date'.tr,
                consumable.dateReturn != null
                    ? DateTimeHelper.formatDate(consumable.dateReturn!)
                    : DateTimeHelper.formatDate(DateTime.now()),
                AppAssets.calender,
              ), horizontalSpace(78),
              _BuildIconLabel(
                'Expected Return'.tr,
                consumable.dateReturn != null
                    ? DateTimeHelper.formatDate(consumable.dateReturn!)
                    : DateTimeHelper.formatDate(DateTime.now()),
                AppAssets.calender,
              ),
                horizontalSpace(78),
              _BuildIconLabel(
                'Priority'.tr,'Urgent',
                AppAssets.system,
              ),


            ],
          ),
          verticalSpace(10),
          const ApprovalCycle(),
          verticalSpace(10),
          Align(
              alignment: AlignmentDirectional.bottomEnd,
              child:  GestureDetector(
                onTap: (){
                  GetDialogHelper.generalDialog(
                    context: context,
                    child: const RetrieveRequestDialog(isAsset: false,)
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40.h,
                  width: 110.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.transparent,
                    border: Border.all(
                      color: AppColors.red, // Red color for the border
                      width: 1.0,          // Border width
                    ),
                  ),
                  child: Text(
                    'Retrieve'.tr,
                    style: AppTextStyles.font16BlackMediumCairo.copyWith(
                      color: AppColors.red,
                      fontSize: 19.sp,
                    ),
                  ),
                ),
              ),


          )
        ],
      ),
    );
  }
}

class _BuildIconLabel extends StatelessWidget {
  final String label;
  final String value;
  final String icon;

  const _BuildIconLabel(this.label, this.value, this.icon);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, height: 20.h, width: 20.w),
        horizontalSpace(3),
        DefaultRichText(
          label: label,
          valueColor: value.getColor,
          value: value,
        ),
      ],
    );
  }
}
