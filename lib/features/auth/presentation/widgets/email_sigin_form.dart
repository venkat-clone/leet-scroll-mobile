import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/auth_cubit.dart';

class EmailSigInForm extends StatefulWidget {
  const EmailSigInForm({super.key});

  @override
  State<EmailSigInForm> createState() => _EmailSigInFormState();
}

class _EmailSigInFormState extends State<EmailSigInForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (AuthCubit cubit) =>
          cubit.state.maybeWhen(loading: () => true, orElse: () => false),
    );
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onLogin(isLoading),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: isLoading
                ? const CircularProgressIndicator()
                : const Text('Login'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  VoidCallback? onLogin(bool isLoading) {
    if (!isLoading) return null;
    return () {
      if (_formKey.currentState!.validate()) {
        context.read<AuthCubit>().login(
          _emailController.text,
          _passwordController.text,
        );
      }
    };
  }
}
