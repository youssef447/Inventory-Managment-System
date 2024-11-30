enum Departments { all, marketing, software, finance }

extension DepartmentsExtension on Departments {
  String get getName {
    switch (this) {
      case Departments.all:
        return 'All';
      case Departments.marketing:
        return 'Marketing';
      case Departments.software:
        return 'Software';
      case Departments.finance:
        return 'Finance';
    }
  }
}
