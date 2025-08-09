class OrderTypeSaleEntity {
  
  int id;
  String code;
  String value;
  String description;

  OrderTypeSaleEntity({
    required this.id,
    required this.code,
    required this.value,
    required this.description,
  });

  factory OrderTypeSaleEntity.fromJson(Map<String, dynamic> json) => OrderTypeSaleEntity(
    id: json["id"],
    code: json["code"],
    value: json["value"],
    description: json["description"],
  );
    
}
