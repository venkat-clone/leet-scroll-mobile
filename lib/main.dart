import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/injection.dart';
import 'core/router/app_router.dart';
import 'features/auth/logic/auth_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // Initialize AppRouter
    // We need to keep the instance of AppRouter to ensure navigation state is preserved
    // But since MyApp is stateless and created once (usually), it's fine to create it here
    // or better, create it outside or use a singleton if needed.
    // For simplicity:

    return BlocProvider(
      create: (context) => getIt<AuthCubit>()..checkAuth(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'LeetScroll',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            brightness: Brightness.dark,
            background: const Color(0xFF0A0A0A),
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

