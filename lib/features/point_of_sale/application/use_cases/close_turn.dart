import 'package:dartz/dartz.dart';
import 'package:taqueria_vargas/features/point_of_sale/domain/repositories/point_of_sale_repository.dart';

class CloseTurn {

  final PointOfSaleRepository repository;

  CloseTurn({required this.repository});

  Future<Either<String, bool>> call({required int turnId}) async {

    return await repository.closeTurn(turnId: turnId);

  }

}