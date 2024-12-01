enum RequiresApproval { yes, no }

extension RequiresApprovalExtension on RequiresApproval {
  String get getName {
    switch (this) {
      case RequiresApproval.yes:
        return 'Yes';
      case RequiresApproval.no:
        return 'No';
    }
  }
}
