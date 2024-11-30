part of '../../pages/mobile/mobile_suppliers_page.dart';

//Youssef Ashraf
///Represents The Mobile Supplier Card in Supplier tab
class MobileSuppliersCard extends StatelessWidget {
  final SupplierEntity supplier;
  const MobileSuppliersCard({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    return SizeAnimation(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(color: AppColors.card),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: Image.asset(
                    AppAssets.image,
                    width: 65.w,
                    height: 65.h,
                    fit: BoxFit.cover,
                  ),
                ),
                horizontalSpace(4),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultRichText(
                        label: 'Supplier ID',
                        value: supplier.supplierId,
                      ),
                      DefaultRichText(
                        label: 'Supplier Name',
                        value: supplier.supplierName,
                      ),
                      verticalSpace(3),
                    ],
                  ),
                )
              ],
            ),
            DefaultRichText(
              label: 'Country',
              value: supplier.country,
            ),
            DefaultRichText(
              label: 'Business Type',
              value: supplier.businessType.getName,
            ),
          ],
        ),
      ),
    );
  }
}
