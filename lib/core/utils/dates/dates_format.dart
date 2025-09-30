import 'package:intl/intl.dart';

class DatesFormat {
  final DateTime dateTime;

  DatesFormat(this.dateTime);

  /// String: 'dd/MM/yyyy'
  String get formatoCorto {
    return DateFormat('dd/MM/yyyy', 'es_ES').format(dateTime.toLocal());
  }

  /// String: 'd de MMMM de yyyy' (ej: 5 de junio de 2024)
  String get formatoLargo {
    return DateFormat('d \'de\' MMMM \'de\' yyyy', 'es_ES').format(dateTime.toLocal());
  }

  /// String: 'EEEE, d de MMMM de yyyy' (ej: miércoles, 5 de junio de 2024)
  String get formatoDiaSemanaLargo {
    return DateFormat('EEEE, d \'de\' MMMM \'de\' yyyy', 'es_ES').format(dateTime.toLocal());
  }

  /// String: 'HH:mm' (ej: 14:30)
  String get formatoHoraMinuto {
    return DateFormat('HH:mm', 'es_ES').format(dateTime.toLocal());
  }

  /// String: 'dd/MM/yyyy HH:mm' (ej: 05/06/2024 14:30)
  String get formatoFechaHora {
    return DateFormat('dd/MM/yyyy HH:mm', 'es_ES').format(dateTime.toLocal());
  }

  /// String: 'dd' (ej: 08)
  String get twoDigitDayFormat {
    return DateFormat('dd', 'es_ES').format(dateTime.toLocal());
  }

  /// String: 'MMMM' (ej: junio)
  String get monthInSpanish {
    final month = DateFormat('MMMM', 'es_ES').format(dateTime.toLocal());
    return '${month[0].toUpperCase()}${month.substring(1)}';
  }

  String get formatoHoraMinutoSinAMPM {
    return DateFormat('HH:mm', 'es_ES').format(dateTime.toLocal());
  }

  /// String: 'AM' or 'PM' (e.g., AM or PM)
  String get soloAMoPM {
    final ampm = DateFormat('a', 'en_US').format(dateTime.toLocal());
    return ampm.toUpperCase();
  }
}
