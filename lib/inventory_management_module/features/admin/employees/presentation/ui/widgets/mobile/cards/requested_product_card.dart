part of '../../../pages/mobile/mobile_admin_employee_details_page.dart';

class MobileRequestedProductCard extends GetView<EmployeeDetailsController> {
  final RequestEntity request;
  const MobileRequestedProductCard({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    final isConsumable = request.requestType == ProductType.consumable;

    return SizeAnimation(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        decoration: BoxDecoration(
            color: AppColors.base, borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
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
            verticalSpace(14),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultRichText(
                        label: 'Request Date'.tr,
                        value: DateTimeHelper.formatDate(request.requestDate),
                      ),
                      DefaultRichText(
                          label: 'Request Type'.tr,
                          value: request.requestType.getName),
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
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          label: 'Quantity'.tr,
                          value: request.quantity.toString()),
                    ],
                  ),
                ),
              ],
            ),
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
