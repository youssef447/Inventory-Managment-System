import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../core/enums/sort_options.dart';
import '../../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../../../core/widgets/dialog/default_dialog.dart';
import '../../../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../../../../employee/home/presentation/ui/widgets/common/vertical/squared_filter_card.dart';
import '../../../../controller/invoices_controller.dart';
import 'employee_filter_dialog.dart';

//Youssef Ashraf
///Represents The Send Invoice Dialog in Tablet - Mobile Views
class SendInvoiceDialog extends GetView<InvoicesController> {
  const SendInvoiceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.isTablett ? 500.w : 420.w,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.dialog,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 16,
                  child: SvgPicture.asset(
                    AppAssets.filter,
                    width: 16,
                    height: 16,
                    color: Colors.black,
                  )),
              horizontalSpace(8),
              Text(
                'Employee'.tr,
                style: AppTextStyles.font16BlackCairoMedium,
              ),
            ],
          ),
          verticalSpace(24),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: SizedBox(
                    height: 37.h,
                    child: AppTextFormField(
                      backGroundColor: AppTheme.isDark ?? false
                          ? AppColors.field
                          : AppColors.chatBackground,
                      maxLines: 1,
                      hintText: 'Search Here...'.tr,
                      collapsed: true,
                      hintStyle: AppTextStyles.font16SecondaryBlackCairoMedium,
                      controller: controller.searchController,
                      onChanged: (value) {},
                      contentPadding: context.isTablett
                          ? EdgeInsets.symmetric(
                              vertical: 2.h,
                            )
                          : null,
                      prefixIcon: SvgPicture.asset(
                        AppAssets.search,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                  ),
                ),
              ),
              horizontalSpace(9),
              if (context.isLandscapee)
                Expanded(
                  child: RectangledFilterCard(
                    width: 112.w,
                    image: AppAssets.filter,
                    text: 'Filter',
                    textColor: AppColors.text,
                    color: AppTheme.isDark ?? false
                        ? AppColors.field
                        : AppColors.chatBackground,
                    onTap: () {
                      GetDialogHelper.generalDialog(
                        child: const InvoiceEmployeeFilterDialog(),
                        context: context,
                      );
                    },
                  ),
                ),
              if (!context.isLandscapee)
                SquaredChipCard(
                  icon: AppAssets.filter,
                  color: AppTheme.isDark ?? false
                      ? AppColors.field
                      : AppColors.chatBackground,
                  onTap: () {
                    GetDialogHelper.generalDialog(
                      child: const InvoiceEmployeeFilterDialog(),
                      context: context,
                    );
                  },
                ),
              horizontalSpace(9),
              AppDropdown(
                showDropdownIcon: false,
                iconColor: AppColors.inverseBase,
                width: context.isLandscapee ? 100.w : 55.w,
                image: AppAssets.sort,
                style: AppTextStyles.font14BlackRegularCairo,
                color: AppTheme.isDark ?? false
                    ? AppColors.field
                    : AppColors.chatBackground,
                height: 40.h,
                onChanged: (value) {},
                items: List.generate(
                  SortOptions.values.length,
                  (index) {
                    return DropdownMenuItem(
                      alignment: AlignmentDirectional.centerStart,
                      value: SortOptions.values[index],
                      child: Text(
                        SortOptions.values[index].getName.tr,
                        style: AppTextStyles.font14SecondaryBlackCairoMedium,
                      ),
                    );
                  },
                ),
                textButton: context.isLandscapee ? 'Sort'.tr : null,
              ),
            ],
          ),
          verticalSpace(24),
          ListView.separated(
            separatorBuilder: (context, index) => verticalSpace(8),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.dummyUsers.length,
            itemBuilder: (context, index) {
              final employee = controller.dummyUsers[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  GetDialogHelper.generalDialog(
                    context: Get.context!,
                    child: const DefaultDialog(
                      title: 'Success',
                      subTitle: 'You Sent The Invoice',
                      lottieAsset: AppAssets.success,
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.isDark ?? false
                        ? AppColors.field
                        : AppColors.chatBackground,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundImage: NetworkImage(employee.profileImage),
                      ),
                      horizontalSpace(4),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${employee.firstName} ${employee.lastName}',
                              style: AppTextStyles.font14BlackCairoMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              employee.jobTitle,
                              style:
                                  AppTextStyles.font12SecondaryBlackCairoMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
