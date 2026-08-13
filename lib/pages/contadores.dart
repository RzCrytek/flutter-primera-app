import 'package:flutter/material.dart';

class Contadores extends StatefulWidget {
  const Contadores({super.key});

  @override
  State<Contadores> createState() => _ContadoresState();
}

class _ContadoresState extends State<Contadores> {
  int contadorGeneral = 0;

  final List<int> contadores = [0, 0, 0, 0, 0];

  void incrementar(int index) {
    setState(() {
      contadores[index]++;
      contadorGeneral++;
    });
  }

  void reset() {
    setState(() {
      contadorGeneral = 0;

      for (int i = 0; i < contadores.length; i++) {
        contadores[i] = 0;
      }
    });
  }

  Widget buildContador({required int index, required String nombre}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF13241B),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green.shade800, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.08),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              nombre,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              '${contadores[index]}',
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => incrementar(index),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Icon(Icons.add, size: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF08120D),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              // Título
              // const Text(
              //   'CONTADORES',
              //   style: TextStyle(
              //     fontSize: 26,
              //     fontWeight: FontWeight.bold,
              //     letterSpacing: 2,
              //     color: Colors.white,
              //   ),
              // ),
              // const SizedBox(height: 20),

              // Contador general
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green.shade900, const Color(0xFF123D25)],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.green.shade700),
                ),
                child: Column(
                  children: [
                    const Text(
                      'TOTAL',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                        color: Colors.white70,
                      ),
                    ),

                    // const SizedBox(height: 8),
                    Text(
                      '$contadorGeneral',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Contadores 1 y 2
              Row(
                children: [
                  buildContador(index: 0, nombre: 'Contador 1'),
                  buildContador(index: 1, nombre: 'Contador 2'),
                ],
              ),

              const SizedBox(height: 16),

              // Contadores 3 y 4
              Row(
                children: [
                  buildContador(index: 2, nombre: 'Contador 3'),
                  buildContador(index: 3, nombre: 'Contador 4'),
                ],
              ),

              const SizedBox(height: 16),

              // Contador 5
              Row(
                children: [
                  buildContador(index: 4, nombre: 'Contador 5'),
                  const Expanded(child: SizedBox()),
                ],
              ),

              const SizedBox(height: 24),

              // Reset
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text(
                    'REINICIAR CONTADORES',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.redAccent,
                    side: const BorderSide(color: Colors.redAccent),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
