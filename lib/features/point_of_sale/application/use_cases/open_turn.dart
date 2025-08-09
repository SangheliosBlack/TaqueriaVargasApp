import 'package:dartz/dartz.dart';
import 'package:taqueria_vargas/features/point_of_sale/domain/repositories/point_of_sale_repository.dart';

class OpenTurn {

  final PointOfSaleRepository repository;

  OpenTurn({required this.repository});

  Future<Either<String, bool>> call() async {

    return await repository.openTurn();

  }
  

}