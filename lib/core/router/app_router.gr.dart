// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:mobile/core/widgets/scaffold_with_nav_bar.dart' as _i9;
import 'package:mobile/features/auth/presentation/login_screen.dart' as _i3;
import 'package:mobile/features/auth/presentation/register_screen.dart' as _i7;
import 'package:mobile/features/feed/presentation/home_screen.dart' as _i1;
import 'package:mobile/features/feed/presentation/question_feed.dart' as _i5;
import 'package:mobile/features/leaderboard/presentation/leaderboard_screen.dart'
    as _i2;
import 'package:mobile/features/profile/data/models/submissions/submission_model.dart'
    as _i13;
import 'package:mobile/features/profile/presentation/profile_screen.dart'
    as _i4;
import 'package:mobile/features/profile/presentation/question_submisstions_screen.dart'
    as _i6;
import 'package:mobile/features/profile/presentation/setup_preferences_screen.dart'
    as _i8;
import 'package:mobile/features/profile/presentation/submission_history_screen.dart'
    as _i10;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    LeaderboardRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LeaderboardScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileScreen(),
      );
    },
    QuestionFeedRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.QuestionFeedScreen(),
      );
    },
    QuestionSubmissionRoute.name: (routeData) {
      final args = routeData.argsAs<QuestionSubmissionRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.QuestionSubmissionScreen(
          key: args.key,
          submissionModel: args.submissionModel,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.RegisterScreen(),
      );
    },
    SetupPreferencesRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SetupPreferencesScreen(),
      );
    },
    ShellRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ShellScreen(),
      );
    },
    SubmissionHistoryRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SubmissionHistoryScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LeaderboardScreen]
class LeaderboardRoute extends _i11.PageRouteInfo<void> {
  const LeaderboardRoute({List<_i11.PageRouteInfo>? children})
    : super(LeaderboardRoute.name, initialChildren: children);

  static const String name = 'LeaderboardRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.QuestionFeedScreen]
class QuestionFeedRoute extends _i11.PageRouteInfo<void> {
  const QuestionFeedRoute({List<_i11.PageRouteInfo>? children})
    : super(QuestionFeedRoute.name, initialChildren: children);

  static const String name = 'QuestionFeedRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.QuestionSubmissionScreen]
class QuestionSubmissionRoute
    extends _i11.PageRouteInfo<QuestionSubmissionRouteArgs> {
  QuestionSubmissionRoute({
    _i12.Key? key,
    required _i13.SubmissionModel submissionModel,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         QuestionSubmissionRoute.name,
         args: QuestionSubmissionRouteArgs(
           key: key,
           submissionModel: submissionModel,
         ),
         initialChildren: children,
       );

  static const String name = 'QuestionSubmissionRoute';

  static const _i11.PageInfo<QuestionSubmissionRouteArgs> page =
      _i11.PageInfo<QuestionSubmissionRouteArgs>(name);
}

class QuestionSubmissionRouteArgs {
  const QuestionSubmissionRouteArgs({this.key, required this.submissionModel});

  final _i12.Key? key;

  final _i13.SubmissionModel submissionModel;

  @override
  String toString() {
    return 'QuestionSubmissionRouteArgs{key: $key, submissionModel: $submissionModel}';
  }
}

/// generated route for
/// [_i7.RegisterScreen]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute({List<_i11.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SetupPreferencesScreen]
class SetupPreferencesRoute extends _i11.PageRouteInfo<void> {
  const SetupPreferencesRoute({List<_i11.PageRouteInfo>? children})
    : super(SetupPreferencesRoute.name, initialChildren: children);

  static const String name = 'SetupPreferencesRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ShellScreen]
class ShellRoute extends _i11.PageRouteInfo<void> {
  const ShellRoute({List<_i11.PageRouteInfo>? children})
    : super(ShellRoute.name, initialChildren: children);

  static const String name = 'ShellRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SubmissionHistoryScreen]
class SubmissionHistoryRoute extends _i11.PageRouteInfo<void> {
  const SubmissionHistoryRoute({List<_i11.PageRouteInfo>? children})
    : super(SubmissionHistoryRoute.name, initialChildren: children);

  static const String name = 'SubmissionHistoryRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
