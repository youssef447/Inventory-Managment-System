enum MessageActions { edit, delete }

extension GetMessageActionsName on MessageActions {
  String get getName {
    switch (this) {
      case MessageActions.edit:
        return 'Edit';
      case MessageActions.delete:
        return 'Delete';
    }
  }
}
