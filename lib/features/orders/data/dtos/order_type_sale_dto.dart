class OrderTypeSaleDto {
  
    int id;
    String code;
    String value;
    String description;

    OrderTypeSaleDto({
        required this.id,
        required this.code,
        required this.value,
        required this.description,
    });

    factory OrderTypeSaleDto.fromJson(Map<String, dynamic> json) => OrderTypeSaleDto(
        id: json["id"],
        code: json["code"],
        value: json["value"],
        description: json["description"],
    );
    
}
