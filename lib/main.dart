import 'dart:ui';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mobile/core/module/error_loggers.dart';
import 'package:mobile/core/services/notification_service.dart';
import 'package:mobile/core/services/snack_bar_service.dart';
import 'package:mobile/features/auth/logic/auth_state.dart';
import 'package:mobile/features/profile/logic/history/history_cubit.dart';
import 'package:mobile/firebase_options.dart';
import 'package:path_provider/path_provider.dart';
import 'core/injection.dart';
import 'core/router/app_router.dart';
import 'core/router/app_router.gr.dart';
import 'features/auth/logic/auth_cubit.dart';

import 'package:firebase_core/firebase_core.dart';

import 'features/feed/logic/home/home_cubit.dart';
import 'features/leaderboard/logic/leaderboard_cubit.dart';
import 'features/profile/logic/preferences/edit_preferences_cubit.dart';
import 'features/profile/logic/profile_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize(
    clientId: DefaultFirebaseOptions.currentPlatform.androidClientId,
  );
  await configureDependencies();
  await getIt<NotificationService>().init();
  final GlobalKey<ScaffoldMessengerState> rootScaffoldKey = GlobalKey();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: (await getApplicationDocumentsDirectory()),
  );

  final logger = ErrorLoggers(SnackBarService(rootScaffoldKey));

  // InternetService(rootScaffoldKey);
  FlutterError.onError = logger.onError;

  PlatformDispatcher.instance.onError = logger.onErrorAsync;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthCubit>()..checkAuth()),
        BlocProvider(create: (context) => getIt<ProfileCubit>()),
        BlocProvider(create: (context) => getIt<LeaderboardCubit>()),
        BlocProvider(create: (context) => getIt<EditPreferencesCubit>()),
        BlocProvider(create: (context) => getIt<HistoryCubit>()),
        BlocProvider(create: (context) => getIt<HomeCubit>()),
      ],
      child: MyApp(rootScaffoldKey: rootScaffoldKey),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required GlobalKey<ScaffoldMessengerState> rootScaffoldKey})
    : _rootScaffoldKey = rootScaffoldKey;
  final appRouter = AppRouter();
  final GlobalKey<ScaffoldMessengerState> _rootScaffoldKey;

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  late final FirebaseAnalyticsObserver _observer = FirebaseAnalyticsObserver(
    analytics: _analytics,
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          unauthenticated: () {
            if (appRouter.current.name != LoginRoute.name) {
              if (appRouter.canPop()) {
                appRouter.popUntilRoot();
              }
              appRouter.push(const LoginRoute());
            }
          },
          orElse: () {},
        );
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: _rootScaffoldKey,
        title: 'LeetScroll',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xff00c950),
            brightness: Brightness.dark,
            primary: Color(0xff00c950),
            shadow: Color(0xff00c950),
            surface: const Color(0xFF0A0A0A),
          ),
          scaffoldBackgroundColor: const Color(0xFF0A0A0A),
          useMaterial3: true,
          textTheme: (Theme.of(context).textTheme).apply(
            bodyColor: const Color(0xFFEDEDED),
            displayColor: const Color(0xFFEDEDED),
            fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
          ),
        ),
        routerConfig: appRouter.config(navigatorObservers: () => [_observer]),
      ),
    );
  }
}
