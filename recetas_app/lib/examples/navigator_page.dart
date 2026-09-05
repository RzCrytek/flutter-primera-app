import 'package:flutter/material.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigator Page")),
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            ElevatedButton(
              onPressed: () async {
                //  Navegacion simple
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => DetallePage(nombre: "Jhonny"),
                //   ),
                // );

                // Navegación con espera de resultado
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetallePage(nombre: "Jhonny"),
                  ),
                );

                // Al volver de detallePage, mostramos el resultado si es que devueklve algo
                if (context.mounted && result != null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Resultado: $result")));
                }
              },
              child: Text("Ir al detalle"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetallePage(nombre: "Maria"),
                  ),
                );
              },
              child: Text("Ir al detalle sin retorno"),
            ),
          ],
        ),
      ),
    );
  }
}

class DetallePage extends StatelessWidget {
  final String nombre;

  const DetallePage({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle Page"),
        //  leading: Container()
      ),
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Text("El nombre es $nombre", style: TextStyle(fontSize: 35)),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "Ok desde el detalle page");
              },
              child: Text("Regresar al home"),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigatorRoutesPage extends StatelessWidget {
  const NavigatorRoutesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => HomeNavigatorPage());
          case '/detalle':
            final arguments = settings.arguments as String?;
            return MaterialPageRoute(
              builder: (context) =>
                  DetallePage(nombre: arguments ?? "Sin nombre"),
            );
          default:
            return MaterialPageRoute(builder: (context) => const AboutPage());
        }
      },
    );
  }
}

class HomeNavigatorPage extends StatelessWidget {
  const HomeNavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hoame Navigator Paage")),
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.pushNamed(
                  context,
                  "/detalle",
                  arguments: "Hola desde Home",
                );
                // Al volver, mostramos resultado
                if (context.mounted && result != null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Resultado: $result")));
                }
              },
              child: Text("Ir a detalle, pushnamed con argumentos"),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("About Page")));
  }
}
