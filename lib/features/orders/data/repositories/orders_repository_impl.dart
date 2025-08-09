import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/orders/data/data.dart';
import 'package:taqueria_vargas/features/orders/data/mappers/order_mapper.dart';
import 'package:taqueria_vargas/features/orders/domain/domain.dart';

class OrdersRepositoryImpl implements OrdersRepository  {

  final OrdersRemoteDataSource remoteDataSource;

  OrdersRepositoryImpl({required this.remoteDataSource});

  
  @override
  Future<DataState<OrderEntity>> createOrder({required CreateOrderRequestEntity request}) async {
    
    final remoteResponse = await remoteDataSource.createOrder(request: request);

    if(remoteResponse is DataSuccess){

      final responseToEntity = OrderMapper.toEntity(dto: remoteResponse.data!);

      return DataSuccess(responseToEntity);

    }else{

      return DataFailed(remoteResponse.error!);

    }


  }

  @override
  Future<DataState<Map<int, OrderEntity>>> fetchAllOrders() async {
    
    final remoteResponse = await remoteDataSource.fetchAllOrders();

    if(remoteResponse is DataSuccess){

      final responseToEntity = OrderMapper.toSaleEntityMap(dtoList: remoteResponse.data!.orders);

      return DataSuccess(responseToEntity);

    }else{

      return DataFailed(remoteResponse.error!);

    }

  }

  @override
  Future<DataState<ProductDetailOrderDto>> getDetailOrder({required int orderId}) {
    throw UnimplementedError();
  }
}
