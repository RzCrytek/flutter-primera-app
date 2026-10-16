import 'package:flutter/material.dart';
import 'package:gastos_app/provider_example/providers/counter_provider.dart';
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
            onPressed: () {
              context.read<CounterProvider>().increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 12),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterProvider>().decrement();
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 12),
          FloatingActionButton(
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
