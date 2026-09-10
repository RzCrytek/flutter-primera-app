import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyectos/router/app_router.dart';

class AdjustSpacePage extends StatefulWidget {
  final String spaceLabel;

  const AdjustSpacePage({super.key, required this.spaceLabel});

  @override
  State<AdjustSpacePage> createState() => _AdjustSpacePageState();
}

class _AdjustSpacePageState extends State<AdjustSpacePage> {
  double luz1 = 51;
  double luz2 = 51;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go(AppRoutes.homeDetail),
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Volver',
        ),
        title: Text('Espacio ${widget.spaceLabel}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ajustar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 16),

              _LightSlider(
                label: 'Luz Principal',
                value: luz1,
                onChanged: (v) => setState(() {
                  luz1 = v;
                }),
              ),

              const SizedBox(height: 24),

              _LightSlider(
                label: 'Luz Secundaria',
                value: luz2,
                onChanged: (v) => setState(() {
                  luz2 = v;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LightSlider extends StatelessWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  const _LightSlider({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: const Color(0xFF14213D),
            thumbColor: const Color(0xFF14213D),
            overlayColor: const Color(0x1F14213D),
            trackHeight: 2,
          ),
          child: Slider(
            value: value,
            min: 0,
            max: 100,
            divisions: 100,
            label: value.round().toString(),
            onChanged: onChanged,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '0',
              style: TextStyle(fontSize: 11, color: Colors.black45),
            ),
            Text(
              value.round().toString(),
              style: const TextStyle(fontSize: 11, color: Colors.black45),
            ),
            const Text(
              '100',
              style: TextStyle(fontSize: 11, color: Colors.black45),
            ),
          ],
        ),
      ],
    );
  }
}
