import '../../../employee/requests/entities/attachment_entity.dart';

class ContractdetailsEntity {
  AttachmentEntity attachmentEntity;
  DateTime startDate;
  DateTime endDate;
  ContractdetailsEntity({
    required this.attachmentEntity,
    required this.startDate,
    required this.endDate,
  });
}
