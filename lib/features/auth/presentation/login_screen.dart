import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/widgets/responsive_builders/responsive_center_container.dart';
import '../../../core/widgets/responsive_layout.dart';
import '../logic/auth_cubit.dart';
import '../logic/auth_state.dart';
import 'widgets/login_form.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            authenticated: (_) {
              context.router.replace(const HomeRoute());
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            },
            orElse: () {},
          );
        },
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: ResponsiveLayout(
              mobile: const LoginForm(),
              tablet: const ResponsiveCenterContainer(
                maxWidth: 500,
                child: LoginForm(),
              ),
              desktop: const ResponsiveCenterContainer(
                maxWidth: 500,
                child: LoginForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
