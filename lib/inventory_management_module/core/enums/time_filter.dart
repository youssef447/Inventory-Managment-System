enum TimeFilter {
  day,
  week,
  month,
  year,
  custom,
}

extension GetName on TimeFilter {
  String get getName {
    switch (this) {
      case TimeFilter.day:
        return 'Day';
      case TimeFilter.week:
        return 'Week';
      case TimeFilter.month:
        return 'Month';
      case TimeFilter.year:
        return 'Year';
      case TimeFilter.custom:
        return 'Custom';
    }
  }
}
