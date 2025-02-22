import '../../home/domain/user_entity.dart';
import 'attachment_entity.dart';

// By: Youssef Ashraf

//Date: 12/11/2024

///Objectives: This file is responsible for providing a message entity class
/// that is used to represent a message in Inquiry for specific request's tracking details.
class MessageEntity {
  ///includes image , video and documnets

  AttachmentEntity? attachment;

  String? message;

  ///Date of Sent Message
  late DateTime sentDate;

  ///User who sent the message
  UserEntity userEntity;

  ///Indicates if Current User is who sent the message
  late bool isMe;

  bool isEdited;
  bool isDeleted;

  MessageEntity({
    this.attachment,
    this.message,
    this.isEdited = false,
    this.isDeleted = false,
    required this.userEntity,
  }) {
    sentDate = DateTime.now();
    isMe = userEntity.id == '1'; // Replace with actual logged-in user ID
  }
}
