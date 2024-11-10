part of '../../../pages/tablet/tablet_request_asset_page.dart';

class HorizontalRequestAssetCard extends StatelessWidget {
  final AssetsEntity model;
  const HorizontalRequestAssetCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [],
      ),
    );
  }
}
