import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flexpay_app/core/theme/app_text_styles.dart';
import 'package:flexpay_app/core/utils/validators.dart';
import 'package:flexpay_app/shared/widgets/gradient_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _pinController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go('/onboarding/security'),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: Validators.phone,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _pinController,
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: '4-digit PIN'),
                validator: Validators.pin,
              ),
              const SizedBox(height: 20),
              GradientButton(
                text: 'Secure Login',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    context.go('/home');
                  }
                },
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () => context.go('/home'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                ),
                child: const Text(
                  'Continue as Demo User',
                  style: AppTextStyles.bodyMedium,
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.go('/auth/signup'),
                child: const Text('Create account',
                    style: AppTextStyles.bodyMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
