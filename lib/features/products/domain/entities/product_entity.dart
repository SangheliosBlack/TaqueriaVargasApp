class ProductEntity {

  final String sku;
  final double pricePf;
  final int id;
  final String name;
  final String description;
  final bool hasParciality;
  final String imgUrl;
  int quantity;
  int parciality;

  ProductEntity({
    required this.sku,
    required this.pricePf,
    required this.id,
    required this.name,
    required this.description,
    required this.hasParciality,
    required this.imgUrl,
    this.quantity = 0,
    this.parciality = 0
  });

   double get subTotal{

    final double subtotal = pricePf * quantity;

    if(parciality == 0){
      return subtotal;
    }

    final partialitySubtotal = (pricePf / 5)  *  parciality;

    return subtotal + partialitySubtotal;

  }

  

  ProductEntity copyWith({
    String? sku,
    double? pricePf,
    int? id,
    String? name,
    String? description,
    bool? hasParciality,
    String? imgUrl,
    int? quantity,
    int? parciality
  }) {
    return ProductEntity(
      sku: sku ?? this.sku,
      pricePf: pricePf ?? this.pricePf,
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      hasParciality: hasParciality ?? this.hasParciality,
      imgUrl: imgUrl ?? this.imgUrl,
      quantity: quantity ?? this.quantity,
      parciality: parciality ?? this.parciality
    );
  }
}
