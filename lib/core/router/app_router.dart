import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';
import 'auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: RegisterRoute.page, path: '/register'),
    AutoRoute(page: SplashRoute.page, initial: true, path: '/'),
    AutoRoute(
      page: ShellRoute.page,
      path: '/home',

      guards: [AuthGuard()],
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home'),
        AutoRoute(page: LeaderboardRoute.page, path: 'leaderboard'),
        AutoRoute(page: ProfileRoute.page, path: 'profile'),
        AutoRoute(page: QuestionFeedRoute.page, path: 'question-feed'),
      ],
    ),
    AutoRoute(
      page: SetupPreferencesRoute.page,
      path: '/setup-preferences',
      guards: [AuthGuard()],
    ),
    AutoRoute(
      page: SubmissionHistoryRoute.page,
      path: '/history',
      guards: [AuthGuard()],
    ),
    AutoRoute(
      page: QuestionSubmissionRoute.page,
      path: '/history/question',
      guards: [AuthGuard()],
    ),
  ];
}
