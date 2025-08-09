class CustomerDto {

  int id;
  String fullName;
  String phone;
  String address;
  String references;
  DateTime createdAt;

  CustomerDto({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.address,
    required this.references,
    required this.createdAt
  });

  factory CustomerDto.fromJson(Map<String, dynamic> json) => CustomerDto(
    id: json["id"],
    fullName: json["full_name"],
    phone: json["phone"],
    address: json["address"],
    references : json["references"] ?? "",
    createdAt: DateTime.parse(json["createdAt"]),
  );

}
