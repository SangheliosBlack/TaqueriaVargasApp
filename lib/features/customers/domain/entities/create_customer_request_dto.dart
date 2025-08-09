class CreateCustomerRequestDto {

  String fullName;
  String phone;
  String address;
  String references;

  CreateCustomerRequestDto({
    required this.fullName,
    required this.phone,
    required this.address,
    required this.references
  });

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "phone": phone,
    "address": address,
    "references": references
  };
  
}
