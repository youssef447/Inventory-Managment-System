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

enum MinimumMaximumSortOptions { min, max }

extension MinimumMaximumSortOptionsExtension on MinimumMaximumSortOptions {
  String get getName {
    switch (this) {
      case MinimumMaximumSortOptions.min:
        return 'Minimum';
      case MinimumMaximumSortOptions.max:
        return 'Maximum';
    }
  }
}
