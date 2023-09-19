import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_riverpod/config/routes/app_routes.dart';
import 'package:todo_app_riverpod/config/routes/route_location.dart';

final routesProvider = Provider(
  (ref) => GoRouter(
    routes: appRoutes,
    navigatorKey: navigationKey,
    initialLocation: RouteLocation.home,
  ),
);
