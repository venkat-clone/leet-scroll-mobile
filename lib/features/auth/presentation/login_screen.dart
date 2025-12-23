import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/widgets/responsive_builders/responsive_center_container.dart';
import '../../../core/widgets/responsive_layout.dart';
import '../../feed/presentation/styles/app_theme.dart';
import '../logic/auth_cubit.dart';
import '../logic/auth_state.dart';
import 'widgets/login_form.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            authenticated: (_) {
              context.router.replace(const HomeRoute());
            },
            error: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
            orElse: () {},
          );
        },
        child: Stack(
          children: [
            const _DotBackground(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          child: ResponsiveLayout(
                            mobile: const LoginForm(),
                            tablet: const ResponsiveCenterContainer(
                              maxWidth: 400,
                              child: LoginForm(),
                            ),
                            desktop: const ResponsiveCenterContainer(
                              maxWidth: 400,
                              child: LoginForm(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    _buildFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24, top: 16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: GoogleFonts.firaCode(color: Colors.grey[600], fontSize: 11),
          children: [
            const TextSpan(text: "By continuing, you agree to our "),
            const TextSpan(
              text: "Terms",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            const TextSpan(text: " & "),
            const TextSpan(
              text: "Privacy",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            const TextSpan(text: "."),
          ],
        ),
      ),
    );
  }
}

class _DotBackground extends StatelessWidget {
  const _DotBackground();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size.infinite, painter: _DotPainter());
  }
}

class _DotPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.draculaGreen.withValues(alpha: 0.1)
      ..strokeWidth = 1.0;

    const spacing = 30.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.0, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
