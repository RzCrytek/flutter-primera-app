import 'package:flutter/material.dart';

class RecetaCardWidget extends StatelessWidget {
  const RecetaCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xFF0F1E2b),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              "https://images.pexels.com/photos/18857730/pexels-photo-18857730.jpeg",
              height: size.height / 4,
              width: size.width * 0.8,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Wafles",
            style: TextStyle(
              fontSize: 20,
              fontWeight: .bold,
              color: Colors.white,
            ),
          ),
          Text(
            """Primero agregamos la leche, huevos, azúcar, sal y esencia de vainilla en nuestra licuadora y mezclamos bien durante 2 minutos.
Luego con un colador tamizamos la harina y el polvo de hornear. Luego los incluimos en la mezcla anterior y mezclamos hasta formar una pasta lisa y uniforme.
Calentamos la waflera a la temperatura deseada y rociamos aceite en spray. Luego, colocamos la mezcla dentro y dejamos cocinar.
Una vez listo, retirar el waffle, disponer sobre un plato y decorar con crema chantilly, frutillas, arándanos, hojas de menta y un generoso chorro de miel.
¡A disfrutar!""",
            maxLines: 3,
            style: TextStyle(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
