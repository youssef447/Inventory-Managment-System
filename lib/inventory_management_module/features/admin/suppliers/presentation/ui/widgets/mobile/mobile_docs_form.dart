part of '../../pages/mobile/mobile_supplier_form_page.dart';

//Youssef Ashraf
///Represents The Doc Uploads in Supplier Form page
class MobileDocsForms extends StatelessWidget {
  const MobileDocsForms({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupplierFormController>(
        id: SuppliersIds.supplierForm,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Proposed Contract'.tr,
                style: AppTextStyles.font16BlackCairoMedium,
              ),
              verticalSpace(8),
              if (controller.contractDetails == null)
                GestureDetector(
                  onTap: () {
                    controller.uploadContract();
                  },
                  child: Container(
                    height: 35.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.5.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: AppColors.card,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('No Files'.tr,
                            style: AppTextStyles.font14BlackCairoMedium),
                        context.isTablett
                            ? horizontalSpace(100)
                            : const Spacer(),
                        SvgPicture.asset(
                          AppAssets.export,
                          width: 16.w,
                          height: 16.h,
                          color: AppColors.icon,
                        ),
                      ],
                    ),
                  ),
                ),
              if (controller.contractDetails != null)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: AttachmentCard(
                    showDelete: controller.isEditable,
                    showDownload: false,
                    model: controller.contractDetails!,
                    onDelete: () {
                      controller.removeContract();
                    },
                  ),
                ),
              verticalSpace(16),
              Text(
                'Compliance Document'.tr,
                style: AppTextStyles.font16BlackCairoMedium,
              ),
              verticalSpace(8),
              if (controller.complianceDoc == null)
                GestureDetector(
                  onTap: () {
                    controller.uploadCompliance();
                  },
                  child: Container(
                    height: 35.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.5.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: AppColors.card,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('No Files'.tr,
                            style: AppTextStyles.font14BlackCairoMedium),
                        context.isTablett
                            ? horizontalSpace(100)
                            : const Spacer(),
                        SvgPicture.asset(
                          AppAssets.export,
                          width: 16.w,
                          height: 16.h,
                          color: AppColors.icon,
                        ),
                      ],
                    ),
                  ),
                ),
              if (controller.complianceDoc != null)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: AttachmentCard(
                    showDelete: controller.isEditable,
                    showDownload: false,
                    model: controller.complianceDoc!,
                    onDelete: () {
                      controller.removeCompliance();
                    },
                  ),
                ),
              verticalSpace(16),
              Text(
                'Additional Document'.tr,
                style: AppTextStyles.font16BlackCairoMedium,
              ),
              verticalSpace(8),
              if (controller.additionalDoc.isEmpty)
                GestureDetector(
                  onTap: () {
                    controller.uploadAdditionalDocs();
                  },
                  child: Container(
                    height: 35.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.5.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: AppColors.card,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('No Files'.tr,
                            style: AppTextStyles.font14BlackCairoMedium),
                        context.isTablett
                            ? horizontalSpace(100)
                            : const Spacer(),
                        SvgPicture.asset(
                          AppAssets.export,
                          width: 16.w,
                          height: 16.h,
                          color: AppColors.icon,
                        ),
                      ],
                    ),
                  ),
                ),
              if (controller.additionalDoc.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      controller.additionalDoc.length,
                      (index) => Padding(
                        padding: EdgeInsetsDirectional.only(
                            bottom: index == controller.additionalDoc.length - 1
                                ? 0
                                : 16.h),
                        child: AttachmentCard(
                          showDelete: controller.isEditable,
                          showDownload: false,
                          model: controller.additionalDoc[index],
                          onDelete: () {
                            controller.removeAdditionalDoc(index);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              verticalSpace(40),
            ],
          );
        });
  }
}
