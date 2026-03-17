import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flexpay_app/core/theme/app_colors.dart';
import 'package:flexpay_app/core/theme/app_text_styles.dart';
import 'package:flexpay_app/shared/widgets/gradient_button.dart';

class CommunityPoolScreen extends StatelessWidget {
  const CommunityPoolScreen({super.key});

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
                    icon:
                        const Icon(Icons.arrow_back, color: Color(0xFFEC5B13)),
                  ),
                  const Expanded(
                    child: Text('Community Pool', style: AppTextStyles.h5),
                  ),
                  const Icon(Icons.info, color: AppColors.gray900),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFF3E5DD),
                              border: Border.all(
                                  color: const Color(0xFFEBC9BC), width: 4),
                            ),
                            child: const Center(
                              child: Icon(Icons.account_balance_wallet,
                                  size: 52, color: Color(0xFFEC5B13)),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(42, -16),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFF22C55E),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: const Text('TRUSTED',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12)),
                            ),
                          ),
                          Text('INR 5,000',
                              style: AppTextStyles.numberMedium
                                  .copyWith(fontSize: 48)),
                          const Text('pooled', style: AppTextStyles.bodyMedium),
                          Text(
                            '+INR147 this month earned',
                            style: AppTextStyles.bodyLarge.copyWith(
                                color: AppColors.success,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFF0C9B8)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Available Credit',
                                  style: AppTextStyles.bodyLarge
                                      .copyWith(color: AppColors.gray600)),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEDE9FE),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: const Text("YOU'RE PRE-APPROVED",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF7C3AED))),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text('INR500 - INR50,000', style: AppTextStyles.h2),
                          const SizedBox(height: 16),
                          const Row(
                            children: <Widget>[
                              Icon(Icons.percent, color: Color(0xFF9333EA)),
                              SizedBox(width: 6),
                              Text('2% for 3 days',
                                  style: AppTextStyles.bodyLarge),
                              Spacer(),
                              Icon(Icons.verified, color: Color(0xFF06B6D4)),
                              SizedBox(width: 6),
                              Text('847 trust score',
                                  style: AppTextStyles.bodyLarge),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Instant approval · Auto-repay from salary',
                            style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.gray400,
                                fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(height: 16),
                          GradientButton(
                              text: 'Request Loan', onPressed: () {}),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    const Text('Active Borrows', style: AppTextStyles.h4),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppColors.gray200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text('INR5,000 borrowed',
                              style: AppTextStyles.h3),
                          const SizedBox(height: 2),
                          Text('From 23 community members',
                              style: AppTextStyles.bodyLarge
                                  .copyWith(color: AppColors.gray500)),
                          const SizedBox(height: 16),
                          Row(
                            children: <Widget>[
                              Text('INR2,000 repaid',
                                  style: AppTextStyles.bodyMedium
                                      .copyWith(color: AppColors.gray600)),
                              const Spacer(),
                              const Text('Goal: INR5,100',
                                  style: AppTextStyles.bodyMedium),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: const LinearProgressIndicator(
                              value: 0.39,
                              minHeight: 9,
                              backgroundColor: AppColors.gray200,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFFEC5B13)),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: <Widget>[
                              Text('INCLUDES INR100 INTEREST',
                                  style: AppTextStyles.caption.copyWith(
                                      color: AppColors.gray400, fontSize: 11)),
                              const Spacer(),
                              Text('REPAY BY JAN 15',
                                  style: AppTextStyles.caption.copyWith(
                                      color: const Color(0xFFEC5B13),
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          const SizedBox(height: 14),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50)),
                            child: const Text('Repay Now',
                                style: AppTextStyles.bodyLarge),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text('Community Stats', style: AppTextStyles.h4),
                    const SizedBox(height: 10),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.35,
                      children: <Widget>[
                        _stat(
                            'TOTAL POOL', 'INR12.4L', const Color(0xFFEC5B13)),
                        _stat('MEMBERS', '234', const Color(0xFFEC5B13)),
                        _stat('AVG TRUST', '782', const Color(0xFFEC5B13)),
                        _stat('DEFAULT RATE', '0.8%', AppColors.success),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: <Widget>[
                        const Text('Your Impact', style: AppTextStyles.h4),
                        const Spacer(),
                        Text('12 neighbors helped',
                            style: AppTextStyles.bodyLarge
                                .copyWith(color: const Color(0xFFEC5B13))),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _impact('Ravi Kumar', 'Borrowed INR2,000'),
                    const SizedBox(height: 10),
                    _impact('Priya Singh', 'Borrowed INR1,500'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
        child: GradientButton(text: 'Request Community Loan', onPressed: () {}),
      ),
    );
  }

  Widget _stat(String title, String value, Color valueColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,
              style: AppTextStyles.caption.copyWith(
                  color: AppColors.gray500,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2)),
          const SizedBox(height: 8),
          Text(value, style: AppTextStyles.h3.copyWith(color: valueColor)),
        ],
      ),
    );
  }

  Widget _impact(String name, String subtitle) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.gray100,
            child: Text(name.substring(0, 1),
                style: AppTextStyles.bodyLarge
                    .copyWith(fontWeight: FontWeight.w700)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(name,
                    style: AppTextStyles.bodyLarge
                        .copyWith(fontWeight: FontWeight.w700)),
                Text(subtitle,
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: AppColors.gray500)),
              ],
            ),
          ),
          const Text('Repaid',
              style: TextStyle(
                  color: AppColors.success, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
