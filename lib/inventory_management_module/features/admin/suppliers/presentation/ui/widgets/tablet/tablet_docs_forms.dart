part of '../../pages/tablet/tablet_supplier_form_page.dart';

//Youssef Ashraf
///Represents The Doc Uploads in Supplier Form page
class TabletDocsForms extends StatelessWidget {
  const TabletDocsForms({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupplierFormController>(
        id: SuppliersIds.supplierForm,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Proposed Contract'.tr,
                    style: AppTextStyles.font16BlackCairoMedium,
                  ),
                  const Spacer(),
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
                            Text(
                              'No Files'.tr,
                              style: AppTextStyles.font14BlackCairoMedium
                                  .copyWith(color: AppColors.textButton),
                            ),
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
                ],
              ),
              if (controller.contractDetails != null)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: AttachmentCard(
                    showDelete: true,
                    showDownload: false,
                    model: controller.contractDetails!,
                    onDelete: () {
                      controller.removeContract();
                    },
                  ),
                ),
              verticalSpace(40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Compliance Document'.tr,
                    style: AppTextStyles.font16BlackCairoMedium,
                  ),
                  const Spacer(),
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
                            Text(
                              'No Files'.tr,
                              style: AppTextStyles.font14BlackCairoMedium
                                  .copyWith(color: AppColors.textButton),
                            ),
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
                ],
              ),
              if (controller.complianceDoc != null)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: AttachmentCard(
                    showDelete: true,
                    showDownload: false,
                    model: controller.complianceDoc!,
                    onDelete: () {
                      controller.removeCompliance();
                    },
                  ),
                ),
              verticalSpace(40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Additional Document'.tr,
                    style: AppTextStyles.font16BlackCairoMedium,
                  ),
                  const Spacer(),
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
                            Text(
                              'No Files'.tr,
                              style: AppTextStyles.font14BlackCairoMedium
                                  .copyWith(color: AppColors.textButton),
                            ),
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
                ],
              ),
              if (controller.additionalDoc.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runSpacing: 16.h,
                    children: List.generate(
                      controller.additionalDoc.length,
                      (index) => Padding(
                        padding: EdgeInsetsDirectional.only(
                            end: index == controller.additionalDoc.length - 1
                                ? 0
                                : 16.w),
                        child: AttachmentCard(
                          showDelete: true,
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
