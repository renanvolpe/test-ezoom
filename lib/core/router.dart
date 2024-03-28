import 'package:coolmovies/presentation/screens/account_page.dart';
import 'package:coolmovies/presentation/screens/comment_page.dart';
import 'package:coolmovies/presentation/screens/login_page.dart';
import 'package:coolmovies/presentation/screens/notices_detail_page.dart';
import 'package:coolmovies/presentation/screens/notices_page.dart';
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
        GoRoute(name: "notices", path: '/notices', builder: (context, state) => const NoticesPage(), routes: [
          GoRoute(
              name: "notices_detail",
              path: 'notices_detail',
              builder: (context, state) => const NotivesDetailPage(),
              routes: [
                GoRoute(
                  name: "comment",
                  path: 'comment',
                  builder: (context, state) => const CommentPage(),
                ),
              ]),
        ]),
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
