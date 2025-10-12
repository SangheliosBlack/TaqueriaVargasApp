enum DateFilterType {
  today('Hoy', 'today'),
  week('Semana', 'week'),
  month('Mes', 'month'),
  custom('Personalizado', 'custom');

  const DateFilterType(this.label, this.value);

  final String label;
  final String value;

  static DateFilterType fromValue(String value) {
    return DateFilterType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => DateFilterType.today,
    );
  }
}