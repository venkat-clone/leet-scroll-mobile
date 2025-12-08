import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile/features/auth/logic/auth_state.dart';
import 'package:mobile/firebase_options.dart';
import 'core/injection.dart';
import 'core/router/app_router.dart';
import 'core/router/app_router.gr.dart';
import 'features/auth/logic/auth_cubit.dart';

import 'package:firebase_core/firebase_core.dart';

import 'features/profile/logic/profile_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize(
      clientId: DefaultFirebaseOptions.currentPlatform.androidClientId
  );
  await configureDependencies();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthCubit>()..checkAuth()),
        BlocProvider(create: (context) => getIt<ProfileCubit>()..loadProfile()),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {

    return BlocListener<AuthCubit,AuthState>(
      listener: (context, state) {
        state.maybeWhen(
            unauthenticated: (){
              appRouter.popUntilRoot();
              appRouter.push(const LoginRoute());
            },
            orElse: (){});
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'LeetScroll',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            brightness: Brightness.dark,
            surface: const Color(0xFF0A0A0A),
          ),
          scaffoldBackgroundColor: const Color(0xFF0A0A0A),
          useMaterial3: true,
          textTheme: (Theme.of(context).textTheme).apply(
            bodyColor: const Color(0xFFEDEDED),
            displayColor: const Color(0xFFEDEDED),
            fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
          ),
        ),
        routerConfig: appRouter.config(),
      ),
    );
  }
}
