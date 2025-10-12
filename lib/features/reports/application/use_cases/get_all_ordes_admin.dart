import 'package:dartz/dartz.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/fetch_all_orders_response_entity.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/get_all_orders_admin_request.dart';
import 'package:taqueria_vargas/features/reports/domain/repositories/report_repository.dart';

class GetAllOrdersAdmin {

  final ReportsRepository repository;

  GetAllOrdersAdmin({required this.repository});

  Future<Either<String,FetchAllOrdersResponseEntity>> call({required GetAllOrdersAdminRequest request }) async {

    return repository.getAllOrders(request: request);
    
  }

}