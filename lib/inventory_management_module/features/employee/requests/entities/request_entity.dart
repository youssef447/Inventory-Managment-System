import '../../../../core/enums/requests_enums.dart';
import '../../../products/enums/product_enums.dart';
import '../../Assets/domain/entity/assets_entity.dart';
import '../../consumables/domain/entity/consumables_entity.dart';
import '../../home/domain/user_entity.dart';
import 'attachment_entity.dart';
import 'message_entity.dart';

//Youssef Ashraf
/// represents a request entity which is part of the inventory model.
class RequestEntity {
  int quantity;
  String requestId;
  UserEntity userEntity =
      UserEntity(firstName: 'Ahmed', id: '001', lastName: 'Mohammed');
  ProductType requestType;
  DateTime requestDate;
  String priority;
  RequestStatus status;
  String? maintenanceFrequency;
  AssetsEntity? assetsEntity;
  ConsumablesEntity? consumablesEntity;
  DateTime expectedRecieved;
  DateTime dateReturn;
  String? additionalNote;
  List<AttachmentEntity> attachments;
  List<MessageEntity> inquiryMessages = [];
  List<UserEntity> approvalCycles;
  String? reasonsOfCanccellation;

  RequestEntity({
    required this.requestId,
    required this.requestType,
    required this.requestDate,
    required this.priority,
    this.maintenanceFrequency,
    this.assetsEntity,
    this.consumablesEntity,
    required this.expectedRecieved,
    required this.dateReturn,
    this.reasonsOfCanccellation,
    required this.quantity,
    required this.status,
    this.additionalNote,
    required this.approvalCycles,
    this.attachments = const [],
  });
}
