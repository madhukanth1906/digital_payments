import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:flexpay_app/core/theme/app_colors.dart';
import 'package:flexpay_app/core/theme/app_text_styles.dart';
import 'package:flexpay_app/shared/widgets/gradient_button.dart';
import 'package:flexpay_app/shared/widgets/glassmorphic_card.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late final AnimationController _floatController;
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () => context.go('/auth/login'),
                  child: Text(
                    'Skip',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.gray400,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: _pulseController,
                    builder: (_, __) {
                      return Transform.scale(
                        scale: 1 + (_pulseController.value * 0.1),
                        child: Container(
                          width: 240,
                          height: 240,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary.withValues(alpha: 0.18),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color:
                                    AppColors.primary.withValues(alpha: 0.25),
                                blurRadius: 80,
                                spreadRadius: 18,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _floatController,
                    builder: (_, __) {
                      return Transform.translate(
                        offset: Offset(0, -10 * _floatController.value),
                        child: _PhoneShape(),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GlassmorphicCard(
                  borderRadius: 40,
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          const SizedBox(height: 10),
                          Text(
                            'Your Behavior is Your Password',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.h2.copyWith(
                              color: AppColors.gray900,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'We learn 47 unique patterns from how you use your phone.',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.gray500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _dot(true, true),
                              const SizedBox(width: 8),
                              _dot(false, false),
                              const SizedBox(width: 8),
                              _dot(false, false),
                            ],
                          ),
                          const SizedBox(height: 28),
                          GradientButton(
                            text: 'Get Started',
                            onPressed: () => context.go('/onboarding/patterns'),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                    .animate()
                    .slideY(begin: 0.25, duration: 600.ms)
                    .fadeIn(duration: 600.ms),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dot(bool active, bool expanded) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: expanded ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: active ? AppColors.primary : AppColors.gray300,
      ),
    );
  }
}

class _PhoneShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 310,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: AppColors.accentGradient,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white.withValues(alpha: 0.92),
        ),
        child: Center(
          child: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
            ),
          ),
        ),
      ),
    );
  }
}
