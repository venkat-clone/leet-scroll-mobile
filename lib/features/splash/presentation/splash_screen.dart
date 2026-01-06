import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/router/app_router.gr.dart';
import 'package:mobile/core/widgets/loaders/terminal_loader.dart';
import 'package:mobile/core/widgets/version_widget.dart';
import 'package:mobile/features/feed/presentation/styles/app_theme.dart';
import 'package:mobile/features/splash/logic/splash_cubit.dart';
import 'package:restart_app/restart_app.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SplashCubit>();
    debugPrint("Splash Screen: splash Cubit $cubit");
    cubit.state.maybeWhen(
      patchDownloaded: () {
        Restart.restartApp();
      },
      upToDate: () {
        context.router.popAndPush(HomeRoute());
      },

      skipUpdate: () {
        context.router.popAndPush(HomeRoute());
      },
      orElse: () {
        cubit.checkForUpdates();
      },
    );
    return Scaffold(
      backgroundColor: AppTheme.black,
      body: Stack(
        children: [
          // Background Glow
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withValues(alpha: 0.1),
                    blurRadius: 100,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Logo Icon
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceDark,
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      color: AppTheme.white.withValues(alpha: 0.05),
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.code,
                    color: AppTheme.primary,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 32),
                // App Name
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Leet',
                        style: GoogleFonts.outfit(
                          color: AppTheme.white,
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Scroll',
                        style: GoogleFonts.outfit(
                          color: AppTheme.primary,
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Tagline
                Text(
                  'MASTER CODING. DAILY.',
                  style: GoogleFonts.jetBrainsMono(
                    color: AppTheme.grey600,
                    fontSize: 14,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // Bottom version and loader
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Column(
              children: [
                BlocConsumer<SplashCubit, SplashState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      patchDownloaded: () {
                        Restart.restartApp();
                      },
                      upToDate: () {
                        context.router.popAndPush(HomeRoute());
                      },

                      skipUpdate: () {
                        context.router.popAndPush(HomeRoute());
                      },
                    );
                  },
                  builder: (context, state) {
                    return state.when(
                      checkingForUpdates: () {
                        return TerminalLoader(text: 'Checking for updates...');
                      },
                      downloadingPatch: () {
                        return TerminalLoader(text: 'Downloading patch...');
                      },
                      patchDownloaded: () {
                        return TerminalLoader(
                          text: 'Patch downloaded! Restarting...',
                        );
                      },
                      error: (message) {
                        return TerminalLoader(text: message);
                      },
                      skipUpdate: () {
                        return TerminalLoader(text: 'Update skipped!');
                      },
                      upToDate: () {
                        return TerminalLoader(text: 'Up to date!');
                      },
                    );
                  },
                ),
                const SizedBox(height: 24),
                VersionWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
