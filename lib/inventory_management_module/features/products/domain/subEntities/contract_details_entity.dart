import '../../../employee/requests/entities/attachment_entity.dart';

class ContractdetailsEntity {
  AttachmentEntity attachmentEntity;
  AttachmentEntity? complianceDoc;
  List<AttachmentEntity> additionalDocs;
  DateTime startDate;
  DateTime endDate;
  ContractdetailsEntity({
    required this.attachmentEntity,
    required this.startDate,
    this.additionalDocs = const [],
    required this.endDate,
  });
}
