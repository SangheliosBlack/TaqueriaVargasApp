class ProductDetailOrderEntity {

  final int id;
  final int productId;
  final int amount;
  final String total;
  final int unitQuantity;
  final String description;
  final String price;

  ProductDetailOrderEntity({
    required this.id,
    required this.productId,
    required this.amount,
    required this.total,
    required this.description,
    required this.price,
    required this.unitQuantity
  });

}


