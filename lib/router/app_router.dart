import 'package:go_router/go_router.dart';
import '../models/device.dart';
import '../pages/home_page.dart';
import '../pages/home_detail_page.dart';
import '../pages/adjust_space_page.dart';
import '../pages/device_detail_page.dart';

class AppRoutes {
  static const home = 'home';
  static const homeDetail = 'spaces';
  static const adjustSpace = 'adjust_space';
  static const device = 'device';
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/spaces',
      name: AppRoutes.homeDetail,
      builder: (context, state) => const HomeDetailPage(),
    ),
    GoRoute(
      path: '/spaces/:label/adjust',
      name: AppRoutes.adjustSpace,
      builder: (context, state) {
        final spaceLabel = state.pathParameters['label']!;
        return AdjustSpacePage(spaceLabel: spaceLabel);
      },
    ),
    GoRoute(
      path: '/device/:id',
      name: AppRoutes.device,
      builder: (context, state) {
        final device = state.extra as Device;
        return DeviceDetailPage(device: device);
      },
    ),
  ],
);
