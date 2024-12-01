import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../employee/consumables/domain/entity/consumables_entity.dart';
import '../../../../../../../employee/track_request/presentation/ui/pages/tablet/tablet_track_request_details_page.dart';
import '../../../../../../assets/presentation/ui/widget/tablet/dialog/retrieve_request_dialog.dart';

class VerticalAssignedConsumableDetailsCard extends StatelessWidget {
  final ConsumablesEntity consumable;

  const VerticalAssignedConsumableDetailsCard(
      {super.key, required this.consumable});

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
                    label: 'Consumable ID',
                    value: consumable.consumableId,
                  ),
                  DefaultRichText(
                    label: 'Product ID',
                    value: consumable.consumableId,
                  ),
                  verticalSpace(2),
                  DefaultRichText(
                      label: 'Category', value: consumable.category),
                  verticalSpace(2),
                  DefaultRichText(
                      label: 'Subcategory', value: consumable.subcategory),
                  verticalSpace(2),
                  DefaultRichText(label: 'Model', value: consumable.model),
                  verticalSpace(2),
                  DefaultRichText(
                    label: 'Brand',
                    value: consumable.brand,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultRichText(
                    label: 'Maintenance Frequency'.tr,
                    value: consumable.maintenanceFrequency ?? '',
                  ),
                  verticalSpace(2),
                  DefaultRichText(
                    label: 'Expected Date',
                    value: consumable.expectedLifeTime != null
                        ? DateTimeHelper.formatDate(
                            consumable.expectedLifeTime!,
                          )
                        : 'Not Applicable'.tr,
                  ),
                  verticalSpace(2),
                  DefaultRichText(
                    label: 'Expected Lifetime',
                    value: consumable.expectedLifeTime != null
                        ? DateTimeHelper.formatDate(
                            consumable.expectedLifeTime!,
                          )
                        : 'Not Applicable'.tr,
                  ),
                  verticalSpace(2),
                  DefaultRichText(
                    label: 'Unit Of Measurement'.tr,
                    value: consumable.maintenanceFrequency ?? '',
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(8),
          DefaultRichText(
            label: 'Supplier Name',
            value: consumable.supplier.supplierName,
            style: AppTextStyles.font12BlackMediumCairo.copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.blue,
            ),
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
              ),
              if (context.isLandscapee) horizontalSpace(78),
              _BuildIconLabel(
                'Returned Date'.tr,
                consumable.dateReturn != null
                    ? DateTimeHelper.formatDate(consumable.dateReturn!)
                    : DateTimeHelper.formatDate(DateTime.now()),
                AppAssets.calender,
              ),
            ],
          ),
          verticalSpace(10),
          const ApprovalCycle(),
          verticalSpace(32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  GetDialogHelper.generalDialog(
                      context: context,
                      child: const RetrieveRequestDialog(
                        isAsset: false,
                      ));
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
                      width: 1.0, // Border width
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
            ],
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
