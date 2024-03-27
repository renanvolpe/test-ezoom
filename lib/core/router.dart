import 'package:coolmovies/presentation/screens/account_page.dart';
import 'package:coolmovies/presentation/screens/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/home_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

final router = GoRouter(debugLogDiagnostics: true, navigatorKey: _rootNavigatorKey, initialLocation: "/", routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const LoginPage(),
  ),
  StatefulShellRoute.indexedStack(
    // parentNavigatorKey: _rootNavigatorKey,
    builder: (context, state, navigationShell) => HomePage(navigationShell: navigationShell),
    branches: [
      StatefulShellBranch(navigatorKey: _shellNavigatorAKey, routes: [
        GoRoute(
          name: "categories",
          path: '/categories',
          builder: (context, state) => const CategoriesPage(),
        ),
      ]),
      StatefulShellBranch(navigatorKey: _shellNavigatorBKey, routes: [
        GoRoute(
          name: "account",
          path: '/account',
          builder: (context, state) => const AccountPage(),
        ),
      ])
    ],
  ),
]);
