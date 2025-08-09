import 'package:dartz/dartz.dart';
import 'package:taqueria_vargas/features/point_of_sale/data/data_sources/remote/point_of_sale_remote_data_source.dart';
import 'package:taqueria_vargas/features/point_of_sale/domain/repositories/point_of_sale_repository.dart';

class PointOfSaleRepositoryImpl implements PointOfSaleRepository {
  
  final PointOfSaleRemoteDataSource remoteDataSource;

  PointOfSaleRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, bool>> openTurn() async {

    return await remoteDataSource.openTurn();
    
  }
  
  @override
  Future<Either<String, bool>> closeTurn({required int turnId}) async {

    return await remoteDataSource.closeTurn(turnId: turnId);

  }
  
  @override
  Future<Either<String, bool>> closePo({required double amount}) async {

    return await remoteDataSource.closePo(amount: amount);

  }
  
  @override
  Future<Either<String, bool>> openPo({required double amount}) async {

    return await remoteDataSource.openPo(amount: amount);

  }


}