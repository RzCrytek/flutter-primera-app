import 'package:go_router/go_router.dart';
import 'package:recetas_app/routes/home_route_page.dart';
import 'package:recetas_app/routes/error_page.dart';
import 'package:recetas_app/routes/login_page.dart';
import 'package:recetas_app/routes/product_detail_page.dart';
import 'package:recetas_app/routes/products_page.dart';
import 'package:recetas_app/routes/profile_page.dart';
import 'package:recetas_app/routes/search_page.dart';

// Gorouter es una libreria que va permitie manejar la navegación de flutter usando rutas declaraticas
// o sea en vez de decir esta pantalla encima de la otra ->  llévame a esta dirección
//  /perfil

// Vamos a declarar nuestras rtuitas

bool isLoggedIn = true;
final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  errorBuilder: (context, state) => ErrorPage(),
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeRoutePage()),
    GoRoute(path: "/login", builder: (context, state) => LoginPage()),
    GoRoute(path: "/profile", builder: (context, state) => ProfilePage()),
    GoRoute(path: "/products", builder: (context, state) => ProductsPage()),
    GoRoute(
      path: "/products/:id",
      builder: (context, state) {
        final productId = state.pathParameters["id"]!;
        return ProductDetailPage(productId: productId);
      },
    ),
    GoRoute(
      path: "/search",
      builder: (context, state) {
        final query = state.uri.queryParameters["query"] ?? "Sin búsqueda";

        return SearchPage(query: query);
      },
    ),
  ],
);
