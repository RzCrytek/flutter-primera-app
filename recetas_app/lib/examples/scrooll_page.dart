import 'package:flutter/material.dart';

class ScroollPage extends StatelessWidget {
  const ScroollPage({super.key});
  Widget _buildContainer(String text) {
    return Container(
      width: 200,
      height: 50,
      color: Colors.red,
      margin: EdgeInsets.all(16),
      child: Center(child: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ScrollPage")),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("Cabecera 1"),
            Text("Cabecera 1"),
            Text("Cabecera 1"),
            Text("Cabecera 1"),
            Expanded(
              child: SingleChildScrollView(
                // scrollDirection: Axis.horizontal, //Scroll horizontal, funciona con un child Row
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 15,
                            width: 15,
                            color: Colors.cyan,
                          );
                        },
                        itemCount: 50,
                        itemBuilder: (context, index) =>
                            _buildContainer("$index listview"),
                      ),
                    ),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    ListView.builder(
                      shrinkWrap:
                          true, // le dice al listview no intentes ocupar el espacio infinito, ajusta el tamaño al contenido

                      physics:
                          NeverScrollableScrollPhysics(), //no hagas scroll propio, el scroll lo manejara el singlechildscrollview externo
                      itemCount: 15,
                      itemBuilder: (context, index) =>
                          _buildContainer("$index listview"),
                    ),

                    // ...List.generate(100, (index) {
                    //   print(index);
                    //   return _buildContainer(index.toString());
                    // }),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            10,
                            (index) => _buildContainer(index.toString()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
