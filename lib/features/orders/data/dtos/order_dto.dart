import 'package:taqueria_vargas/features/orders/data/dtos/dtos.dart';

class OrderDto {

  int id;
  DateTime date;
  int posStationId;
  String totalAmount;
  ShiftDayStationDto shiftDayStation;
  OrderTypeSaleDto typeSale;
  OrderStatusDto status;
  OrderUserDto orderUser;
  OrderPosStationDto posStation;
  List<ProductDetailOrderDto> detailProducts;
  String note;
  int shiftConsecutive;

  OrderDto({
    required this.id,
    required this.date,
    required this.posStationId,
    required this.totalAmount,
    required this.shiftDayStation,
    required this.typeSale,
    required this.status,
    required this.orderUser,
    required this.posStation,
    required this.detailProducts,
    required this.note,
    required this.shiftConsecutive
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) => OrderDto(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    posStationId: json["pos_station_id"],
    totalAmount: json["total_amount"],
    shiftDayStation: ShiftDayStationDto.fromJson(json["shiftDayStation"]),
    typeSale: OrderTypeSaleDto.fromJson(json["typeSale"]),
    status: OrderStatusDto.fromJson(json["status"]),
    detailProducts: ProductDetailOrderDto.fromJsonList(json["saleDetails"]), 
    orderUser: OrderUserDto.fromJson(json["user"]), 
    posStation: OrderPosStationDto.fromJson(json["posStation"]), 
    note: json["comment"] ?? "",
    shiftConsecutive: json["shift_consecutive"],
  );
    
}