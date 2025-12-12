// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../features/auth/data/auth_repository.dart' as _i1013;
import '../features/auth/logic/auth_cubit.dart' as _i329;
import '../features/feed/data/feed_repository.dart' as _i323;
import '../features/feed/logic/feed_cubit.dart' as _i416;
import '../features/feed/logic/question_cubit.dart' as _i476;
import '../features/leaderboard/data/leaderboard_repository.dart' as _i230;
import '../features/leaderboard/logic/leaderboard_cubit.dart' as _i783;
import '../features/profile/data/profile_repository.dart' as _i470;
import '../features/profile/logic/profile_cubit.dart' as _i384;
import 'module/network_module.dart' as _i881;
import 'module/notification_module.dart' as _i331;
import 'services/notification_service.dart' as _i98;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    final notificationModule = _$NotificationModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => networkModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i98.NotificationService>(
      () => notificationModule.notificationService,
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i323.IFeedRepository>(
      () => _i323.FeedRepository(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i230.ILeaderboardRepository>(
      () => _i230.LeaderboardRepository(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i470.IProfileRepository>(
      () => _i470.ProfileRepository(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1013.AuthRepository>(
      () => _i1013.AuthRepository(gh<_i361.Dio>()),
    );
    gh.factory<_i476.QuestionCubit>(
      () => _i476.QuestionCubit(gh<_i323.IFeedRepository>()),
    );
    gh.factory<_i416.FeedCubit>(
      () => _i416.FeedCubit(gh<_i323.IFeedRepository>()),
    );
    gh.factory<_i384.ProfileCubit>(
      () => _i384.ProfileCubit(gh<_i470.IProfileRepository>()),
    );
    gh.factory<_i329.AuthCubit>(
      () => _i329.AuthCubit(gh<_i1013.AuthRepository>()),
    );
    gh.factory<_i783.LeaderboardCubit>(
      () => _i783.LeaderboardCubit(gh<_i230.ILeaderboardRepository>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i881.NetworkModule {}

class _$NotificationModule extends _i331.NotificationModule {}
