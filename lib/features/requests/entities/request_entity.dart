import '../../Assets/domain/entity/assets_entity.dart';
import '../../home/domain/user_entity.dart';
import 'attachment_entity.dart';
import 'message_entity.dart';

//Youssef Ashraf
/// represents a request entity which is part of the inventory model.
class RequestEntity {
  int quantity;
  String requestId;
  String requestType;
  DateTime requestDate;
  String priority;
  String status;
  String? maintenanceFrequency;
  AssetsEntity assetsEntity;
  DateTime expectedRecieved;
  DateTime dateReturn;
  String? additionalNote;
  List<AttachmentEntity> attachments;
  List<MessageEntity> inquiryMessages = [];
  List<UserEntity> approvalCycles;

  RequestEntity({
    required this.requestId,
    required this.requestType,
    required this.requestDate,
    required this.priority,
    this.maintenanceFrequency,
    required this.assetsEntity,
    required this.expectedRecieved,
    required this.dateReturn,
    required this.quantity,
    required this.status,
    this.additionalNote,
    required this.approvalCycles,
    this.attachments = const [],
  });
}
