import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proyectos/generated/l10n.dart';
import 'package:proyectos/pages/home_gastos_page.dart';
import 'package:proyectos/pages/home_page.dart';
import 'package:proyectos/provider_example/pages/cart_page.dart';
import 'package:proyectos/provider_example/pages/counter_page.dart';
import 'package:proyectos/provider_example/pages/products_page.dart';
import 'package:proyectos/provider_example/pages/provider_page.dart';
import 'package:proyectos/provider_example/providers/cart_provider.dart';
import 'package:proyectos/provider_example/providers/counter_provider.dart';
import 'package:provider/provider.dart';

// EJEMPLO PARA PROVIDER 1
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => CartProvider(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: ProductsPage(),
//       ),
//     ),
//   );
// }

// Ejemplo con multiples providers
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => CounterProvider()),
//         ChangeNotifierProvider(create: (context) => CartProvider()),
//       ],
//       child: MaterialApp(
//         home: ProductsPage(),
//         debugShowCheckedModeBanner: false,
//       ),
//     ),
//   );
// }

// EJEMPLO PARA FLUTTER INTL INICIAL
void main() {
  runApp(
    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: HomeGastosPage(),

    //   // Delegados de localización
    //   localizationsDelegates: [
    //     S.delegate,
    //     GlobalMaterialLocalizations.delegate,
    //     GlobalWidgetsLocalizations.delegate,
    //     GlobalCupertinoLocalizations.delegate,
    //   ],
    //   // Los idiomas soportados por el app
    //   supportedLocales: S.delegate.supportedLocales,
    // ),
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale locale) {
    final state = context.findAncestorStateOfType<_MyAppState>();
    state?.changeLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ProviderPage(),
      home: HomeGastosPage(),
      locale: _locale,
      // Delegados de localización
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // Los idiomas soportados por el app
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
