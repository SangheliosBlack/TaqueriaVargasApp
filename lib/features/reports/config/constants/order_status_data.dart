import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class OrderStatusViewModel {

  final int id;
  final String code;
  final String value;
  final Color color;
  final IconData icon;

  const OrderStatusViewModel({
    required this.id,
    required this.code,
    required this.value,
    required this.color,
    required this.icon,
  });
}

class OrderStatusData {

  static final List<OrderStatusViewModel> orderStatusList = [
    OrderStatusViewModel(
      id: 3,
      code: "PRO",
      value: "En Proceso",
      color: Colors.orange, 
      icon: BootstrapIcons.hourglass,
    ),
    OrderStatusViewModel(
      id: 4,
      code: "CAN",
      value: "Cancelada",
      color: Colors.red,
      icon: BootstrapIcons.x_circle,
    ),
    OrderStatusViewModel(
      id: 5,
      code: "COM",
      value: "Completada",
      color: Colors.green,
      icon: BootstrapIcons.check_circle,
    ),
    OrderStatusViewModel(
      id: 15,
      code: "INI",
      value: "Iniciada",
      color: Colors.blue,
      icon: BootstrapIcons.flag,
    ),
    OrderStatusViewModel(
      id: 16,
      code: "EC",
      value: "En camino",
      color: Colors.purple,
      icon: BootstrapIcons.truck,
    ),
  ];

}