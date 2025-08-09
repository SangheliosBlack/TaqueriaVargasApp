import 'package:dartz/dartz.dart';
import 'package:taqueria_vargas/features/point_of_sale/domain/repositories/point_of_sale_repository.dart';

class OpenPo {

  final PointOfSaleRepository repository;

  OpenPo({required this.repository});

  Future<Either<String, bool>> call({required double amount}) async {

    return await repository.openPo(amount: amount);

  }

}