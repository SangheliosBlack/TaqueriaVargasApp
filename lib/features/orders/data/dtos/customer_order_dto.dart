class CustomerOrderDto {

  final int? id;
  final String? fullName;
  final String? phone;
  final String? address;
  final String? references;

  CustomerOrderDto({
    this.id,
    this.fullName,
    this.phone,
    this.address,
    this.references,
  });

  factory CustomerOrderDto.fromJson(Map<String, dynamic> json) {
    return CustomerOrderDto(
      id: json['id'],
      fullName: json['full_name'],
      phone: json['phone'],
      address: json['address'],
      references: json['references'],
    );
  }

}
