import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/device.dart';
import '../router/app_router.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key});

  static const List<String> _spaces = ['A', 'B', 'C', 'D', 'E', 'F'];

  static final List<Device> _devices = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.goNamed(AppRoutes.home),
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Volver',
        ),
        title: const Text('Navicury'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionCard(
              title: 'Espacios',
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _spaces.map((space) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: _SpaceButton(
                        space: space,
                        onTap: () =>
                            context.go('/spaces/${space}/adjust', extra: space),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 16),

            _SectionCard(
              title: 'Equipos conectados',
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _devices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final device = _devices[index];

                  return _DeviceTile(
                    device: device,
                    onTap: () =>
                        context.go('/device/${device.id}', extra: device),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _SpaceButton extends StatelessWidget {
  final String space;
  final VoidCallback onTap;

  const _SpaceButton({required this.space, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 56,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF14213D),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.black12),
          ),
        ),
        child: Text(
          space,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _DeviceTile extends StatelessWidget {
  final Device device;
  final VoidCallback onTap;

  const _DeviceTile({required this.device, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        padding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.black12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            device.icon,
            size: 32,
            color: device.isOn ? const Color(0xFF14213D) : Colors.black45,
          ),
          const SizedBox(height: 8),
          Text(
            device.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
