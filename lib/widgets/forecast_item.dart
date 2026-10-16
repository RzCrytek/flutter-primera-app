import 'package:flutter/material.dart';

class ForecastItem extends StatelessWidget {
  final String hour;
  final String temperature;
  final String image;

  const ForecastItem({
    super.key,
    required this.hour,
    required this.temperature,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF454A4C),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent,
            offset: const Offset(5, 5),
            blurRadius: 4,
            spreadRadius: -2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(hour, style: TextStyle(color: Colors.white54, fontSize: 14)),
          Image.asset("assets/icons/$image.png", height: 60),
          Text(
            temperature,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
