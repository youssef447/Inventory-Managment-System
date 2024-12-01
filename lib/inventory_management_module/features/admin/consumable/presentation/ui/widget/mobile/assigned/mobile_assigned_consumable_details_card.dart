import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../../features/employee/consumables/domain/entity/consumables_entity.dart';
import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../employee/track_request/presentation/ui/pages/mobile/mobile_track_requests_details_page.dart';
import '../../../../../../assets/presentation/ui/widget/mobile/dialog/mobile_retrieve_request_dialog.dart';

class MobileAssignedConsumableDetailsCard extends StatelessWidget {
  final ConsumablesEntity consumable;

  const MobileAssignedConsumableDetailsCard(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  horizontalSpace(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        consumable.model + consumable.brand,
                        style: AppTextStyles.font16BlackCairoRegular,
                      ),
                      DefaultRichText(
                        label: 'Status',
                        value: consumable.status,
                        labelStyle: AppTextStyles
                            .font14SecondaryBlackCairoMedium
                            .copyWith(color: AppColors.secondaryBlack),
                        style: AppTextStyles.font14SecondaryBlackCairoMedium
                            .copyWith(
                          color: consumable.status.getColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpace(8),
            ],
          ),
          horizontalSpace(6),
          DefaultRichText(
            label: 'Consumable ID'.tr,
            value: consumable.consumableId,
          ),
          DefaultRichText(
            label: 'Product ID'.tr,
            value: consumable.consumableId,
          ),
          verticalSpace(2),
          DefaultRichText(label: 'Category', value: consumable.category),
          DefaultRichText(label: 'Model', value: consumable.model),
          verticalSpace(2),
          DefaultRichText(
            label: 'Brand'.tr,
            value: consumable.brand,
          ),
          verticalSpace(2),
          DefaultRichText(
              label: 'Subcategory'.tr, value: consumable.subcategory),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(2),
              DefaultRichText(
                label: 'Unit Of Measurement',
                value: consumable.maintenanceFrequency ?? '',
              ),
              verticalSpace(2),
              DefaultRichText(
                label: 'Unit Cost',
                value: consumable.unitCost,
              ),
              verticalSpace(2),
              verticalSpace(2),
              DefaultRichText(
                label: 'Supplier Name',
                value: consumable.supplier.supplierName,
                style: AppTextStyles.font12BlackMediumCairo.copyWith(
                  decoration: TextDecoration.underline,
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
          verticalSpace(8),
          _BuildIconLabel(
            'Assigned Date'.tr,
            consumable.dateReturn != null
                ? DateTimeHelper.formatDate(consumable.dateReturn!)
                : DateTimeHelper.formatDate(DateTime.now()),
            AppAssets.calender,
          ),
          verticalSpace(8),
          if (context.isLandscapee) horizontalSpace(78),
          _BuildIconLabel(
            'Returned Date'.tr,
            consumable.dateReturn != null
                ? DateTimeHelper.formatDate(consumable.dateReturn!)
                : DateTimeHelper.formatDate(DateTime.now()),
            AppAssets.calender,
          ),
          verticalSpace(10),
          const MobileApprovalCycle(),
          verticalSpace(10),
          verticalSpace(4),
          Image.asset(
            AppAssets.qr,
          ),
          verticalSpace(8),
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.download,
                width: 20,
                height: 20,
                color: Colors.blue,
              ),
              horizontalSpace(4),
              Text(
                'Download As PNG',
                style: AppTextStyles.font14SecondaryBlackCairoRegular.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.blue,
                  color: AppColors.blue,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  GetDialogHelper.generalDialog(
                      context: context,
                      child: const MobileRetrieveRequestDialog(
                        isAsset: false,
                      ));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 30.h,
                  width: 120.w,
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
              )
            ],
          ),
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
