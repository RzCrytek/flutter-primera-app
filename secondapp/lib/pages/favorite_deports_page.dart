import 'package:flutter/material.dart';
import 'package:secondapp/models/deport_model.dart';

class FavoriteDeportsPage extends StatefulWidget {
  @override
  State<FavoriteDeportsPage> createState() => _FavoriteDeportsPageState();
}

class _FavoriteDeportsPageState extends State<FavoriteDeportsPage> {
  List<DeportModel> favoriteDeportList = [];

  Widget buildItem(DeportModel deporModel, {bool selected = false}) {
    return GestureDetector(
      onTap: () {
        if (deporModel.isFavorite == false) {
          deporModel.isFavorite = true;
          favoriteDeportList.add(deporModel);
        } else {
          deporModel.isFavorite = false;
          favoriteDeportList.remove(deporModel);
        }
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: selected ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.5, color: Colors.orange),
        ),
        child: Text(
          deporModel.nombre,
          style: TextStyle(
            color: selected ? Colors.white : Colors.orange,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEBA049),
        centerTitle: true,
        title: Text(
          "Sets State Texts App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "¿Cuáles son tus deportes favoritos?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Wrap(
                spacing: 16, //espaciado horizontal entre elementos,
                runSpacing: 8, //espaciado vertical entre filas
                alignment: WrapAlignment.center, //alineación
                children: [
                  for (int i = 0; i < deportList.length; i++)
                    buildItem(
                      deportList[i],
                      selected: deportList[i].isFavorite,
                    ),
                ],
              ),
              Divider(color: Colors.black, height: 64, thickness: 3),

              Text(
                "Mis deportes favoritos son:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final deporte in favoriteDeportList)
                      buildItem(deporte),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
