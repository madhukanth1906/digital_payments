import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flexpay_app/core/theme/app_colors.dart';
import 'package:flexpay_app/core/theme/app_text_styles.dart';
import 'package:flexpay_app/shared/widgets/gradient_button.dart';
import 'package:flexpay_app/shared/widgets/glassmorphic_card.dart';

class PatternsScreen extends StatefulWidget {
  const PatternsScreen({super.key});

  @override
  State<PatternsScreen> createState() => _PatternsScreenState();
}

class _PatternsScreenState extends State<PatternsScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _orbitController;

  @override
  void initState() {
    super.initState();
    _orbitController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _orbitController.dispose();
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: Text(
                      'Security Scan',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.gray500,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.go('/onboarding/security'),
                    child: Text(
                      'SKIP',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AnimatedBuilder(
                animation: _orbitController,
                builder: (_, __) {
                  return CustomPaint(
                    painter: _OrbitPainter(progress: _orbitController.value),
                    child: const SizedBox(width: 340, height: 340),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GlassmorphicCard(
                  borderRadius: 40,
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            '47 Invisible Bodyguards',
                            style: AppTextStyles.h2.copyWith(
                              color: AppColors.gray900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          _feature('Learns your unique patterns'),
                          const SizedBox(height: 10),
                          _feature('Blocks fraud before it happens'),
                          const SizedBox(height: 10),
                          _feature('Works silently in background'),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _dot(false, false),
                              const SizedBox(width: 8),
                              _dot(true, true),
                              const SizedBox(width: 8),
                              _dot(false, false),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () => context.pop(),
                                  child: const Text('Back'),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                flex: 2,
                                child: GradientButton(
                                  text: 'Next',
                                  onPressed: () =>
                                      context.go('/onboarding/security'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _feature(String text) {
    return Row(
      children: <Widget>[
        const Icon(Icons.check_circle, color: AppColors.success),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray700),
          ),
        ),
      ],
    );
  }

  Widget _dot(bool active, bool expanded) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: expanded ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: active ? AppColors.primary : AppColors.gray300,
      ),
    );
  }
}

class _OrbitPainter extends CustomPainter {
  _OrbitPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset c = Offset(size.width / 2, size.height / 2);
    final Paint phone = Paint()..color = Colors.white;
    final RRect rect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: c, width: 80, height: 130),
      const Radius.circular(12),
    );
    canvas.drawRRect(rect, phone);

    final Paint border = Paint()
      ..shader = AppColors.primaryGradient.createShader(rect.outerRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawRRect(rect, border);

    const double radius = 122;
    final List<Color> colors = <Color>[
      AppColors.primary,
      AppColors.secondary,
      AppColors.accent,
      AppColors.warning,
    ];
    for (int i = 0; i < 4; i++) {
      final double angle = (i * math.pi / 2) + (progress * 2 * math.pi);
      final Offset p = Offset(
        c.dx + radius * math.cos(angle),
        c.dy + radius * math.sin(angle),
      );
      final Paint line = Paint()
        ..color = colors[i].withValues(alpha: 0.35)
        ..strokeWidth = 2;
      canvas.drawLine(c, p, line);
      final Paint orb = Paint()..color = colors[i].withValues(alpha: 0.22);
      canvas.drawCircle(p, 28, orb);
      final Paint core = Paint()..color = colors[i];
      canvas.drawCircle(p, 11, core);
    }
  }

  @override
  bool shouldRepaint(covariant _OrbitPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
