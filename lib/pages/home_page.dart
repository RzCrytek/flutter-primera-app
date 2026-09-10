import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../router/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _goToSpaces(BuildContext context) {
    context.goNamed(AppRoutes.homeDetail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2C2F36), Color(0xFF0F1115)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 2),
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white24, width: 2),
                  color: Colors.black26,
                ),
                child: const Center(
                  child: Text(
                    '23:50',
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 1),
              const Text(
                'Navicury',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(flex: 2),
              GestureDetector(
                onTap: () => _goToSpaces(context),
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white10,
                  ),
                  child: const Icon(
                    Icons.fingerprint,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Presione la pantalla con su dedo',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
