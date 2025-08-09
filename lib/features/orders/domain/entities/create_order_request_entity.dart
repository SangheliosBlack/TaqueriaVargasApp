
import 'package:taqueria_vargas/features/products/domain/entities/product_order_entity.dart';

class CreateOrderRequestEntity {

    int posStationId;
    int typeSaleId;
    int? customerId;
    List<ProductOrderEntity> products;

    CreateOrderRequestEntity({
        required this.posStationId,
        required this.typeSaleId,
        required this.customerId,
        required this.products,
    });
    
    Map<String, dynamic> toJson() => {
        "pos_station_id": posStationId,
        "type_sale_id": typeSaleId,
        "customer_id": customerId,
        "products": products.map((x) => x.toJson()).toList(),
    };
}
