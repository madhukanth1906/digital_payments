import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flexpay_app/core/theme/app_colors.dart';
import 'package:flexpay_app/core/theme/app_text_styles.dart';
import 'package:flexpay_app/core/utils/validators.dart';
import 'package:flexpay_app/shared/widgets/gradient_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _pinController = TextEditingController();
  bool _acceptedTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  bool get _canContinue {
    return _acceptedTerms &&
        (_nameController.text.trim().isNotEmpty) &&
        (_phoneController.text.trim().isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F6),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go('/onboarding/security'),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Create Account'),
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 240),
              child: Column(
                children: <Widget>[
                  _iconField(
                    controller: _phoneController,
                    icon: Icons.call,
                    label: 'Phone Number',
                    keyboardType: TextInputType.phone,
                    validator: Validators.phone,
                  ),
                  const SizedBox(height: 12),
                  _iconField(
                    controller: _nameController,
                    icon: Icons.person,
                    label: 'Full Name',
                    validator: (String? v) =>
                        Validators.requiredText(v, 'Name'),
                  ),
                  const SizedBox(height: 12),
                  _iconField(
                    controller: _emailController,
                    icon: Icons.mail,
                    label: 'Email (optional)',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.72),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                          color: Colors.white.withValues(alpha: 0.36)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF6C63FF)
                                    .withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.fingerprint,
                                  color: Color(0xFF6C63FF)),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Text(
                                "While you type, we're learning your unique patterns",
                                style: AppTextStyles.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Learning Progress',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.gray500,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.6,
                              ),
                            ),
                            Text(
                              '3/47 patterns detected',
                              style: AppTextStyles.caption.copyWith(
                                color: const Color(0xFF6C63FF),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(99),
                          ),
                          child: LinearProgressIndicator(
                            value: 0.15,
                            minHeight: 8,
                            backgroundColor: AppColors.gray200,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFF6C63FF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F6F6).withValues(alpha: 0.95),
                  border:
                      const Border(top: BorderSide(color: AppColors.gray200)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _acceptedTerms,
                          onChanged: (bool? v) {
                            setState(() => _acceptedTerms = v ?? false);
                          },
                        ),
                        Expanded(
                          child: Text(
                            'I agree to Terms & Privacy Policy',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.gray600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    AbsorbPointer(
                      absorbing: !_canContinue,
                      child: Opacity(
                        opacity: _canContinue ? 1 : 0.45,
                        child: GradientButton(
                          text: 'Continue',
                          onPressed: () {
                            if ((_formKey.currentState?.validate() ?? false) &&
                                _acceptedTerms) {
                              context.go('/home');
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Or continue with',
                      style: AppTextStyles.caption
                          .copyWith(color: AppColors.gray400),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.g_mobiledata, size: 28),
                            label: const Text('Google'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.apple),
                            label: const Text('Apple'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconField({
    required TextEditingController controller,
    required IconData icon,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: (_) => setState(() {}),
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.gray400),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
