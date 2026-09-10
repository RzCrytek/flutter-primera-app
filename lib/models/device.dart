import 'package:flutter/material.dart';

class Device {
  final String id;
  final String name;
  final IconData icon;
  final String fabricante;
  final String modelo;
  final String mac;
  bool isOn;

  Device({
    required this.id,
    required this.name,
    required this.icon,
    required this.fabricante,
    required this.modelo,
    required this.mac,
    this.isOn = false,
  });
}

final List<Device> devices = [
  Device(
    id: 'tv-cuarto',
    name: 'TV Cuarto',
    icon: Icons.tv,
    fabricante: 'Samsung',
    modelo: 'QN55-LED',
    mac: '10:20:AB:30:11',
  ),
  Device(
    id: 'refrigeradora',
    name: 'Refrigeradora',
    icon: Icons.kitchen,
    fabricante: 'Refrigeradora',
    modelo: 'TP-KINT',
    mac: '30:40:FC:30:PT:40',
  ),
  Device(
    id: 'puerta-sala',
    name: 'Puerta Sala',
    icon: Icons.door_front_door,
    fabricante: 'SmartLock',
    modelo: 'SL-200',
    mac: '44:12:BB:90:21',
  ),
  Device(
    id: 'cochera',
    name: 'Cochera',
    icon: Icons.garage,
    fabricante: 'GarageTech',
    modelo: 'GT-800',
    mac: '77:AA:CC:55:02',
  ),
];

Device getDeviceById(String id) {
  return devices.firstWhere((device) => device.id == id);
}

// class Space {
//   final String label;
//   double luz1;
//   double luz2;

//   Space({required this.label, this.luz1 = 51, this.luz2 = 51});
// }
