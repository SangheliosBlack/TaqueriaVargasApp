
class OrderUserDto {
  
  int id;
  String fullName;

  OrderUserDto({
      required this.id,
      required this.fullName,
  });

  factory OrderUserDto.fromJson(Map<String, dynamic> json) => OrderUserDto(
    id: json["id"],
    fullName: json["full_name"],
  );
    
}
