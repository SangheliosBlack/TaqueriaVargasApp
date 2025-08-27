import 'package:dartz/dartz.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/fetch_all_orders_response_entity.dart';
import 'package:taqueria_vargas/features/reports/domain/repositories/report_repository.dart';

class GetAllOrdersAdmin {

  final ReportsRepository repository;

  GetAllOrdersAdmin({required this.repository});

  Future<Either<String,FetchAllOrdersResponseEntity>> call() async {

    return repository.getAllOrders();
    
  }

}