
class ProductDetailOrderDto {

  final int id;
  final int productId;
  final int amount;
  final String total;
  final int unitQuantity;
  final String price;
  final String description;

  ProductDetailOrderDto({
    required this.id,
    required this.productId,
    required this.amount,
    required this.total,
    required this.description,
    required this.price,
    required this.unitQuantity
  });

  factory ProductDetailOrderDto.fromJson(Map<String, dynamic> json) {
    return ProductDetailOrderDto(
      id: json['id'] as int,
      productId: json['product_id'],
      amount: json['amount'],
      total: json['total'],
      description: json['product_description'] as String,
      price: json['unit_price'], 
      unitQuantity: json['unit_quantity'] ?? 0, 
    );
  }

  static List<ProductDetailOrderDto> fromJsonList(List<dynamic> jsonList){

    return jsonList.map((json) => ProductDetailOrderDto.fromJson(json) ).toList();

  }

}


