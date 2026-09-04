import 'package:flutter/material.dart';
import 'package:recetas_app/models/receta_model.dart';

class RecetaCardWidget extends StatelessWidget {
  final RecetaModel recetaModel;
  RecetaCardWidget({super.key, required this.recetaModel});

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
              recetaModel.urlImage,
              height: size.height / 4,
              width: size.width * 0.8,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            recetaModel.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: .bold,
              color: Colors.white,
            ),
          ),
          Text(
            recetaModel.preparation,
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
