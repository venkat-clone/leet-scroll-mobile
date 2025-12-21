import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../feed/presentation/styles/app_theme.dart';
import '../../logic/auth_cubit.dart';
import 'blinking_effect.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (AuthCubit cubit) =>
          cubit.state.maybeWhen(loading: () => true, orElse: () => false),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLogo(),
        const SizedBox(height: 32),
        _buildTitle(),
        const SizedBox(height: 8),
        _buildSubtitle(),
        const SizedBox(height: 64),
        _buildGoogleButton(isLoading),
        const SizedBox(height: 24),
        _buildGuestButton(),
      ],
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppTheme.draculaGreen.withValues(alpha: 0.2),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.draculaGreen.withValues(alpha: 0.1),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.terminal_rounded,
          size: 48,
          color: AppTheme.draculaGreen,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.firaCode(
          fontSize: 38,
          fontWeight: FontWeight.bold,
          letterSpacing: -1,
        ),
        children: [
          TextSpan(
            text: "<",
            style: TextStyle(color: AppTheme.draculaGreen),
          ),
          const TextSpan(
            text: "LeetScroll",
            style: TextStyle(color: Colors.white),
          ),
          TextSpan(
            text: "/>",
            style: TextStyle(color: AppTheme.draculaGreen),
          ),
        ],
      ),
    );
  }

  Widget _buildSubtitle() {
    return BlinkingSubtitle();
  }

  Widget _buildGoogleButton(bool isLoading) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        color: const Color(0xFF1A1A1A),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: isLoading
              ? null
              : () => context.read<AuthCubit>().signInWithGoogle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                )
              else ...[
                Image.network(
                  'https://www.gstatic.com/images/branding/product/1x/gsa_512dp.png',
                  height: 20,
                ),
                const SizedBox(width: 12),
                Text(
                  "Sign in with Google",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGuestButton() {
    return TextButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Guest login not implemented yet")),
        );
      },
      child: Text(
        "CONTINUE AS GUEST",
        style: GoogleFonts.firaCode(
          color: Colors.grey[500],
          fontSize: 12,
          letterSpacing: 1.2,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
