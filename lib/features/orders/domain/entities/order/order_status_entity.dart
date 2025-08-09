class OrderStatusEntity {
  
  int id;
  String code;
  String value;
  String description;

  OrderStatusEntity({
    required this.id,
    required this.code,
    required this.value,
    required this.description,
  });

  factory OrderStatusEntity.fromJson(Map<String, dynamic> json) => OrderStatusEntity(
    id: json["id"],
    code: json["code"],
    value: json["value"],
    description: json["description"],
  );
    
}
