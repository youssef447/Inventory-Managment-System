import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import 'package:inventory_management/inventory_management_module/features/employee/Assets/domain/entity/assets_entity.dart';
import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../employee/track_request/presentation/ui/pages/mobile/mobile_track_requests_details_page.dart';
import '../../tablet/dialog/retrieve_request_dialog.dart';
import '../dialog/mobile_retrieve_request_dialog.dart';

class MobileAssignedDetailsCard extends StatelessWidget {
  final AssetsEntity assets;

  const MobileAssignedDetailsCard({super.key, required this.assets});

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
                        assets.model + assets.brand,
                        style: AppTextStyles.font16BlackCairoRegular,
                      ),
                      DefaultRichText(
                        label: 'Status',
                        value: assets.status,
                        labelStyle: AppTextStyles.font14SecondaryBlackCairoMedium
                            .copyWith(color: AppColors.secondaryBlack),
                        style:
                        AppTextStyles.font14SecondaryBlackCairoMedium.copyWith(
                          color: assets.status.getColor,
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
            label: 'Asset ID',
            value: assets.assetId,
          ),
          DefaultRichText(
            label: 'Product ID',
            value: assets.assetId,
          ),
          verticalSpace(2),
          DefaultRichText(label: 'Category', value: assets.category),
          DefaultRichText(label: 'Model', value: assets.model),
          verticalSpace(2),
          DefaultRichText(
            label: 'Brand',
            value: assets.brand,
          ),
          verticalSpace(2),
          DefaultRichText(
              label: 'Subcategory', value: assets.subcategory),
          verticalSpace(2),
          DefaultRichText(
            label: 'Expected Date',
            value: assets.expectedLifeTime != null
                ? DateTimeHelper.formatDate(
                    assets.expectedLifeTime!,
                  )
                : 'Not Applicable'.tr,
          ),
          verticalSpace(2),
          DefaultRichText(
            label: 'Expected Lifetime',
            value: assets.expectedLifeTime != null
                ? DateTimeHelper.formatDate(
                    assets.expectedLifeTime!,
                  )
                : 'Not Applicable'.tr,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(2),
              DefaultRichText(
                label: 'Unit Of Measurement',
                value: assets.maintenanceFrequency ?? '',
              ),
              verticalSpace(2),
              DefaultRichText(
                label: 'Unit Cost',
                value: assets.unitCost,
              ),
              verticalSpace(2),
              DefaultRichText(
                label: 'Unit Cost',
                value: assets.storageRequirement,
              ),
              verticalSpace(2),
              DefaultRichText(
                label: 'Supplier Name',
                value: assets.supplier.supplierName,
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
            assets.dateReturn != null
                ? DateTimeHelper.formatDate(assets.dateReturn!)
                : DateTimeHelper.formatDate(DateTime.now()),
            AppAssets.calender,
          ),
          verticalSpace(8),
          if (context.isLandscapee) horizontalSpace(78),
          _BuildIconLabel(
            'Returned Date'.tr,
            assets.dateReturn != null
                ? DateTimeHelper.formatDate(assets.dateReturn!)
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
                style: AppTextStyles.font14SecondaryBlackCairoRegular
                    .copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.blue,
                  color: AppColors.blue,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
                  GetDialogHelper.generalDialog(
                      context: context,
                      child: const MobileRetrieveRequestDialog()
                  );
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
