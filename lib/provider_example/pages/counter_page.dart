import 'package:flutter/material.dart';
import 'package:proyectos/provider_example/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("Counter Page")),
      floatingActionButton: Column(
        mainAxisAlignment: .end,
        children: [
          FloatingActionButton(
            heroTag: "increment",
            onPressed: () {
              // context.read<CounterProvider>().increment();
              counterProvider.increment();
              // No se usa de esta manera porque el botón
              // NO necesita reconstruirse por el cambio del contador
              // o sea el uso de notifylisteners
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 12),
          FloatingActionButton(
            heroTag: "decrement",

            onPressed: () {
              context.read<CounterProvider>().decrement();
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 12),
          FloatingActionButton(
            heroTag: "refresh",

            onPressed: () {
              context.read<CounterProvider>().reset();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Text(
              "Contador: ${counterProvider.count}",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
