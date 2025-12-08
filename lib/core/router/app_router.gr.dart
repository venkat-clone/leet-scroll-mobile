// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:mobile/core/widgets/scaffold_with_nav_bar.dart' as _i7;
import 'package:mobile/features/auth/presentation/login_screen.dart' as _i3;
import 'package:mobile/features/auth/presentation/register_screen.dart' as _i6;
import 'package:mobile/features/feed/presentation/home_screen.dart' as _i1;
import 'package:mobile/features/feed/presentation/question_feed.dart' as _i5;
import 'package:mobile/features/leaderboard/presentation/leaderboard_screen.dart'
    as _i2;
import 'package:mobile/features/profile/presentation/profile_screen.dart'
    as _i4;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    LeaderboardRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LeaderboardScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileScreen(),
      );
    },
    QuestionFeedRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.QuestionFeedScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RegisterScreen(),
      );
    },
    ShellRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ShellScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LeaderboardScreen]
class LeaderboardRoute extends _i8.PageRouteInfo<void> {
  const LeaderboardRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LeaderboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'LeaderboardRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.QuestionFeedScreen]
class QuestionFeedRoute extends _i8.PageRouteInfo<void> {
  const QuestionFeedRoute({List<_i8.PageRouteInfo>? children})
      : super(
          QuestionFeedRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuestionFeedRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RegisterScreen]
class RegisterRoute extends _i8.PageRouteInfo<void> {
  const RegisterRoute({List<_i8.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ShellScreen]
class ShellRoute extends _i8.PageRouteInfo<void> {
  const ShellRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ShellRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShellRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
