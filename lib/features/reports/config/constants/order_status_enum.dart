import 'package:flutter/material.dart';

enum OrderStatus {
  inProcess(
    id: 3,
    code: "PRO",
    value: "En Proceso",
    color: Colors.orange,
  ),
  canceled(
    id: 4,
    code: "CAN",
    value: "Cancelada",
    color: Colors.red,
  ),
  completed(
    id: 5,
    code: "COM",
    value: "Completada",
    color: Colors.green,
  ),
  started(
    id: 15,
    code: "INI",
    value: "Iniciada",
    color: Colors.blue,
  ),
  onTheWay(
    id: 16,
    code: "EC",
    value: "En camino",
    color: Colors.purple,
  );

  final int id;
  final String code;
  final String value;
  final Color color;

  const OrderStatus({
    required this.id,
    required this.code,
    required this.value,
    required this.color,
  });

  static OrderStatus? fromCode(String code) {
    return OrderStatus.values.firstWhere(
      (status) => status.code == code,
      orElse: () => OrderStatus.inProcess,
    );
  }

  static OrderStatus? fromId(int id) {
    return OrderStatus.values.firstWhere(
      (status) => status.id == id,
      orElse: () => OrderStatus.inProcess,
    );
  }
}
