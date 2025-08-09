import 'package:intl/intl.dart';

class DatesFormat {
  final DateTime dateTime;

  DatesFormat(this.dateTime);

  /// String: 'dd/MM/yyyy'
  String get formatoCorto {
    return DateFormat('dd/MM/yyyy', 'es_ES').format(dateTime);
  }

  /// String: 'd de MMMM de yyyy' (ej: 5 de junio de 2024)
  String get formatoLargo {
    return DateFormat('d \'de\' MMMM \'de\' yyyy', 'es_ES').format(dateTime);
  }

  /// String: 'EEEE, d de MMMM de yyyy' (ej: miércoles, 5 de junio de 2024)
  String get formatoDiaSemanaLargo {
    return DateFormat('EEEE, d \'de\' MMMM \'de\' yyyy', 'es_ES').format(dateTime);
  }

  /// String: 'HH:mm' (ej: 14:30)
  String get formatoHoraMinuto {
    return DateFormat('HH:mm', 'es_ES').format(dateTime);
  }

  /// String: 'dd/MM/yyyy HH:mm' (ej: 05/06/2024 14:30)
  String get formatoFechaHora {
    return DateFormat('dd/MM/yyyy HH:mm', 'es_ES').format(dateTime);
  }
  /// String: 'dd' (ej: 08)
  /// String: 'dd' (e.g., 08)
  String get twoDigitDayFormat {
    return DateFormat('dd', 'es_ES').format(dateTime);
  }
  /// String: 'MMMM' (ej: junio)
  String get monthInSpanish {
    final month = DateFormat('MMMM', 'es_ES').format(dateTime);
    return '${month[0].toUpperCase()}${month.substring(1)}';
  }

  String get formatoHoraMinutoSinAMPM {
  return DateFormat('HH:mm', 'es_ES').format(dateTime); // Ej: 04:47 o 16:30
}

  /// String: 'AM' or 'PM' (e.g., AM or PM)
  String get soloAMoPM {
    final ampm = DateFormat('a', 'en_US').format(dateTime);
    return ampm.toUpperCase(); // Ej: AM or PM
  }
  }

  

 

