part of '../../pages/tablet/tablet_admin_employee_details_page.dart';

class TabletRequestedProductCard extends GetView<EmployeeDetailsController> {
  final RequestEntity request;
  const TabletRequestedProductCard({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    final isConsumable = request.requestType == ProductType.consumable;
    return SizeAnimation(
      child: Container(
        padding:
            EdgeInsets.only(top: 10.h, right: 17.w, left: 17.w, bottom: 16.h),
        decoration: BoxDecoration(
            color: AppColors.base, borderRadius: BorderRadius.circular(8.r)),
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
                  '${request.userEntity?.firstName ?? 'Ahmed'} ${request.userEntity?.lastName ?? 'Mohammed'}',
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
