part of '../../pages/mobile/mobile_storage_page.dart';

//Youssef Ashraf
///Represents The Mobile Storage Card in Storage tab
class MobileStorageCard extends StatelessWidget {
  final StorageLocationAndQuantityEntity storage;
  const MobileStorageCard({super.key, required this.storage});

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
                        label: 'Location ID',
                        value: storage.locationID,
                      ),
                      DefaultRichText(
                        label: 'Location Name',
                        value: storage.locationName,
                      ),
                      DefaultRichText(
                        label: 'Location Type',
                        value: storage.locationType,
                      ),
                      verticalSpace(3),
                    ],
                  ),
                )
              ],
            ),
            DefaultRichText(
              label: 'Country',
              value: storage.country,
            ),
          ],
        ),
      ),
    );
  }
}
