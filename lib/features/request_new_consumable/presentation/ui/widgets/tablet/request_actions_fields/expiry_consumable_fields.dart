part of '../../../pages/tablet/tablet_request_form_page.dart';

class TabletExpiryConsumableFields
    extends GetView<RequestConsumableController> {
  const TabletExpiryConsumableFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LabeledFormField(
            controller: controller.pickUpDateController,
            date: true,
            label: 'Pick Up Date',
            hintText: 'Pick Up Date',
          ),
        ),
        horizontalSpace(15),
        const Spacer(),
      ],
    );
  }
}
