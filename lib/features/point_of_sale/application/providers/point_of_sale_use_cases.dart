import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/point_of_sale_providers_di.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/use_cases/close_po.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/use_cases/close_turn.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/use_cases/open_po.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/use_cases/open_turn.dart';

class PointOfSaleUseCases {

  final Ref ref;

  PointOfSaleUseCases({required this.ref});

  OpenTurn get openTurn => ref.read(openTurnUseCaseDi);

  CloseTurn get closeTurn => ref.read(closeTurnUseCaseDi);

  ClosePo get closePo => ref.read(closePoUseCaseDi);

  OpenPo get openPo => ref.read(openPoUseCaseDi);

}

final pointOfSaleUseCasesProvider = Provider<PointOfSaleUseCases>((ref) {

  return PointOfSaleUseCases(ref: ref);

});