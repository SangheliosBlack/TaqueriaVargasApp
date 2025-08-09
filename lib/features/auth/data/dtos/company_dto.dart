class CompanyDto {
  
  final int id;
  final String name;

  CompanyDto({
    required this.id,
    required this.name,
  });

  CompanyDto copyWith({
    int? id,
    String? name,
  }) {
    return CompanyDto(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory CompanyDto.fromJson(Map<String, dynamic> json) {
    return CompanyDto(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}