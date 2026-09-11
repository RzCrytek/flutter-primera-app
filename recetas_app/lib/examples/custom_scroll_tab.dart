import 'package:flutter/material.dart';

// Sliver -> es una porción de una pantalla con Scroll
// Es un widget especializado para trabajar dentro de un sistema de scroll avanzando
// Widget de bajo nivel para Scroll, dibujar por partes o segmentos en vez de cargar toda la pantalla
// Los sliver se usan dentro de un contenedor
// CustomScrollView(
// sliver: [
//  dibujamos los slivers
// ]
// )

// CustomScrollView -> Es el contenedor principal que va a permitir usar varios slivers dentro de un Scroll

class CustomScrollTab extends StatelessWidget {
  const CustomScrollTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // SliverAppbar -> es como AppBar, pero preparado para trabajar dentro de un CustomScrollView
      // Flutter lo define como un AppBar de MaterialDesing que se puede trabajar con CustomSrcllView
      slivers: [
        SliverAppBar(
          // pinned -> hace que el appbar quede pegado arriba si hacemos scroll
          // pinned: true,
          // floating -> hace que el appbar aparezca rapidamente cuando el usuario empieza a hacer scroll hacia arriba
          floating: true,
          // snap -> hace que el appbar aparezca de forma más inmediata y animada (generalemente se usa con el floating:true)
          snap: true,
          // expandedHeight -> altura maáxima cuando el appbar esta extendido
          expandedHeight: 220,

          // flexibleSpace -> Permite crear un espacio flexible dentro del AppBar
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Catálogo"),
            background: Image.network(
              "https://images.pexels.com/photos/11029040/pexels-photo-11029040.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          title: Text("Mi Pantalla"),
        ),

        // SliverList -> Es una lista que trabaja dentro del CustomScrollView
        SliverList(
          delegate: SliverChildBuilderDelegate(childCount: 20, (
            context,
            index,
          ) {
            // Demostramos que no construye todos los elemtnos de golpe, construye de manera que se van necesaitando visualmente
            print("Mostrando: $index");
            return ListTile(title: Text("elemento $index"));
          }),
        ),

        // SliverToBoxAdapter -> Es como un adapatador enchufe, si tengo un widget normal y quiero conectarlo a mundo Sliver, lo envuelto en esto
        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.center,
            height: 100,
            width: 200,
            color: Colors.blue,
            child: Text(
              "Categorías populares",
              style: TextStyle(
                fontSize: 30,
                fontWeight: .bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
