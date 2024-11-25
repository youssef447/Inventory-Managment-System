import '../../../employee/requests/entities/attachment_entity.dart';

class Contractdetailsentity {
  AttachmentEntity attachmentEntity;
  DateTime startDate;
  DateTime endDate;
  Contractdetailsentity({
    required this.attachmentEntity,
    required this.startDate,
    required this.endDate,
  });
}
