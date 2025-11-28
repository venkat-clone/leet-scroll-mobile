import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'app_router.gr.dart';
import 'auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: RegisterRoute.page, path: '/register'),
    AutoRoute(
      page: ShellRoute.page,
      path: '/',
      guards: [AuthGuard()],
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home'),
        AutoRoute(page: LeaderboardRoute.page, path: 'leaderboard'),
        AutoRoute(page: ProfileRoute.page, path: 'profile'),
      ],
    ),
  ];
}
