enum SortOptions { title, name }

extension SortOptionsExtension on SortOptions {
  String get getName {
    switch (this) {
      case SortOptions.title:
        return 'Title';
      case SortOptions.name:
        return 'Name';
    }
  }
}
