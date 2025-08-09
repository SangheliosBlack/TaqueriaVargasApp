import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnterAmountNotifier extends StateNotifier<double> {

  EnterAmountNotifier() : super(0.0);

  void updateAmount({required double amount}) {

    final currentAmount = state.toStringAsFixed(0); // evita cosas como 0.0, 1.0

    if (currentAmount.length >= 5) {
      return; // Limita la longitud a 10 dígitos
    }

    final digit = amount.toInt(); // Asegura que el número sea un solo dígito entero

    final newAmountStr = currentAmount == '0' ? '$digit' : '$currentAmount$digit';

    state = double.tryParse(newAmountStr) ?? state;

  }

 void deleteLastDigit() {
  final currentAmountStr = state.toStringAsFixed(0);
  if (currentAmountStr.length <= 1) {
    state = 0;
  } else {
    final newAmountStr = currentAmountStr.substring(0, currentAmountStr.length - 1);
    state = double.tryParse(newAmountStr) ?? state;
  }
}

  void clearAmount() {
    state = 0.0;
  }

}

final enterAmountProvider = StateNotifierProvider<EnterAmountNotifier, double>(
  (ref) => EnterAmountNotifier(),
);