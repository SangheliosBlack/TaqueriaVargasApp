class ProductDto {

  String sku;
  double pricePf;
  int id;
  String name;
  String description;
  bool hasParciality;
  String imgUrl;
  

  ProductDto({
    required this.sku,
    required this.pricePf,
    required this.id,
    required this.name,
    required this.description,
    required this.hasParciality,
    required this.imgUrl,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
    sku: json["sku"],
    pricePf: json["price_pf"] is String ? double.parse(json["price_pf"]) : json["price_pf"],
    id: json["id"],
    name: json["name"],
    description: json["description"],
    hasParciality: json["has_parciality"],
    imgUrl: json["img_url"],
  );
}
