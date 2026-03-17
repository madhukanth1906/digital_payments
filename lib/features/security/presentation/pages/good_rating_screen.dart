import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flexpay_app/core/theme/app_colors.dart';
import 'package:flexpay_app/core/theme/app_text_styles.dart';
import 'package:flexpay_app/shared/widgets/gradient_button.dart';

class GoodRatingScreen extends StatelessWidget {
  const GoodRatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F6),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => context.go('/home'),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Expanded(
                    child: Text(
                      'Payment Status',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h5,
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 8),
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          top: 12,
                          left: 36,
                          child: _confettiDot(const Color(0xFF22D3EE), 12),
                        ),
                        Positioned(
                          top: 28,
                          right: 42,
                          child: _confettiDot(const Color(0xFFA855F7), 10),
                        ),
                        Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF6EE7B7),
                                Color(0xFF06B6D4),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 72,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.72),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.40),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Payment Successful',
                            style: AppTextStyles.h3,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'INR 10,000',
                            style: AppTextStyles.numberLarge
                                .copyWith(fontSize: 40),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEDE9FE),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Icon(
                                  Icons.verified_user,
                                  size: 16,
                                  color: Color(0xFF7C3AED),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Secured by 47 patterns',
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: const Color(0xFF7C3AED),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          _detailRow('Merchant', 'Sharma Electronics'),
                          const SizedBox(height: 14),
                          _detailRow('Date', 'Today, 2:34 PM'),
                          const SizedBox(height: 14),
                          _detailRow(
                            'Transaction ID',
                            'TXN834729472',
                            trailing: const Icon(
                              Icons.copy,
                              size: 16,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 14),
                          _detailRow('Payment Method', 'UPI ••••4521'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    GradientButton(
                      text: 'Download Receipt',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 56),
                        side: const BorderSide(color: AppColors.primary),
                      ),
                      child: Text(
                        'Share Payment',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () => context.go('/home'),
                      child: Text(
                        'Done >',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.gray500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _confettiDot(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _detailRow(String label, String value, {Widget? trailing}) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.gray500),
          ),
        ),
        if (trailing != null) ...<Widget>[
          Text(
            value,
            style:
                AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: 8),
          trailing,
        ] else
          Text(
            value,
            style:
                AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w700),
          ),
      ],
    );
  }
}
