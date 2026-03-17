import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flexpay_app/core/theme/app_colors.dart';
import 'package:flexpay_app/core/theme/app_text_styles.dart';
import 'package:flexpay_app/shared/widgets/gradient_button.dart';
import 'package:flexpay_app/shared/widgets/glassmorphic_card.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Expanded(
                    child: Text(
                      'Security Setup',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h5,
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 118,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _statCard('99.4%', 'Fraud Detection', Icons.track_changes),
                    const SizedBox(width: 10),
                    _statCard(
                        '47 Patterns', 'Behavior Biometrics', Icons.grid_view),
                    const SizedBox(width: 10),
                    _statCard('0.02%', 'False Alarms', Icons.notifications_off),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GlassmorphicCard(
                  borderRadius: 40,
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            'Bank-Level Security, Zero Effort',
                            style: AppTextStyles.h2.copyWith(
                              color: AppColors.gray900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 14),
                          Text(
                            'Your data stays on your device. We never see your patterns.',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.gray500,
                            ),
                          ),
                          const SizedBox(height: 24),
                          _tile('Real-time anomaly detection', Icons.bolt),
                          _tile(
                            'Transaction intent validation',
                            Icons.task_alt,
                          ),
                          _tile(
                            'Adaptive risk scoring engine',
                            Icons.shield_moon,
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _dot(false, false),
                              const SizedBox(width: 8),
                              _dot(false, false),
                              const SizedBox(width: 8),
                              _dot(true, true),
                            ],
                          ),
                          const SizedBox(height: 24),
                          GradientButton(
                            text: 'Create Account',
                            onPressed: () => context.go('/auth/login'),
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () => context.go('/auth/login'),
                            child: Text(
                              'Sign In',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
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
      ),
    );
  }

  Widget _statCard(String title, String subtitle, IconData icon) {
    return Container(
      width: 168,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.36)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(height: 4),
          Text(title,
              style: AppTextStyles.bodySmall
                  .copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 2),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.caption
                .copyWith(color: AppColors.gray500, fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _tile(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: <Widget>[
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: 10),
            Expanded(child: Text(label, style: AppTextStyles.bodyMedium)),
          ],
        ),
      ),
    );
  }

  Widget _dot(bool active, bool expanded) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: expanded ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: active ? AppColors.primary : AppColors.gray300,
      ),
    );
  }
}
