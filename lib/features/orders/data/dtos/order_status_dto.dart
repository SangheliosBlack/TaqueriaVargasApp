class OrderStatusDto {
  
    int id;
    String code;
    String value;
    String description;

    OrderStatusDto({
        required this.id,
        required this.code,
        required this.value,
        required this.description,
    });

    factory OrderStatusDto.fromJson(Map<String, dynamic> json) => OrderStatusDto(
        id: json["id"],
        code: json["code"],
        value: json["value"],
        description: json["description"],
    );
    
}
