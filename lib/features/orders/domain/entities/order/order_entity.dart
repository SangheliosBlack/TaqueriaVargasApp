import 'package:taqueria_vargas/core/resources/mappable.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/entities.dart';

class OrderEntity extends Mappable {

  int id;
  DateTime date;
  int posStationId;
  String totalAmount;
  ShiftDayStationEntity shiftDayStation;
  OrderTypeSaleEntity typeSale;
  OrderStatusEntity status;
  List<ProductDetailOrderEntity> orderDetail;
  OrderPosStationEntity posStation;
  OrderUserEntity orderUser;
  String note;
  int shiftConsecutive;
  

  OrderEntity({
    required this.id,
    required this.date,
    required this.posStationId,
    required this.totalAmount,
    required this.shiftDayStation,
    required this.typeSale,
    required this.status,
    required this.orderUser,
    required this.posStation,
    required this.orderDetail,
    required this.note,
    required this.shiftConsecutive
  });

  @override
  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }
    
}