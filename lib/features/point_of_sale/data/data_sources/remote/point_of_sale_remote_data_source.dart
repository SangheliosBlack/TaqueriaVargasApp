import 'package:dartz/dartz.dart';

abstract interface class PointOfSaleRemoteDataSource {

  Future<Either<String,bool>> openTurn();
  Future<Either<String,bool>> closeTurn({required int turnId});
  Future<Either<String,bool>> closePo({required double amount});
  Future<Either<String,bool>> openPo({required double amount});

}