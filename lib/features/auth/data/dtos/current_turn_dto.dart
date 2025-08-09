class CurrentTurnDto {

  int id;
  DateTime openingDate;
  bool active;

  CurrentTurnDto({
    required this.id,
    required this.openingDate,
    required this.active,
  });

  factory CurrentTurnDto.fromJson(Map<String, dynamic> json) => CurrentTurnDto(
    id: json["id"],
    openingDate: DateTime.parse(json["opening_date"]),
    active: json["active"],
  );
    
}
