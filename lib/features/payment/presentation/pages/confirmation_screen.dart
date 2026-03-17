import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flexpay_app/core/theme/app_colors.dart';
import 'package:flexpay_app/core/theme/app_text_styles.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String amount =
        GoRouterState.of(context).uri.queryParameters['amount'] ?? '0';
    final String formattedAmount =
        'INR${amount.replaceAll(RegExp(r'[^0-9.]'), '')}';

    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F6),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go('/payment/amount'),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Review Payment'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 140),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: <Color>[Color(0xFFEFE7FA), Color(0xFFE5F4F7)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: const Color(0xFFE8CFDF)),
                      ),
                      child: const Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 34,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.verified_user,
                                color: Color(0xFF0891B2), size: 36),
                          ),
                          SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Behavioral Verification Complete',
                                    style: AppTextStyles.h4),
                                SizedBox(height: 2),
                                Text('All 47 patterns matched',
                                    style: AppTextStyles.h5),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 98,
                            height: 98,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: const Color(0xFFF1D4C9), width: 3),
                            ),
                            child: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://i.pravatar.cc/150?img=60'),
                            ),
                          ),
                          const SizedBox(height: 14),
                          const Text('Sharma Electronics',
                              style: AppTextStyles.h2),
                          const SizedBox(height: 8),
                          Text(
                            formattedAmount,
                            style: AppTextStyles.numberLarge
                                .copyWith(fontSize: 64),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'For headphones',
                            style: AppTextStyles.h4.copyWith(
                                color: AppColors.gray500,
                                fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(height: 18),
                          const Divider(height: 1),
                          const SizedBox(height: 14),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: AppColors.gray100,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: const Icon(Icons.account_balance_wallet,
                                    color: Color(0xFFEC5B13), size: 30),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('PAYMENT METHOD',
                                        style: AppTextStyles.h5),
                                    Text('UPI ••••4521',
                                        style: AppTextStyles.h3),
                                  ],
                                ),
                              ),
                              const Icon(Icons.chevron_right,
                                  size: 32, color: AppColors.gray400),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: const Color(0xFFD5DFEC)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Row(
                            children: <Widget>[
                              Icon(Icons.check_circle,
                                  color: AppColors.success, size: 36),
                              SizedBox(width: 12),
                              Expanded(
                                  child: Text('Security Checks Passed',
                                      style: AppTextStyles.h3)),
                              Icon(Icons.keyboard_arrow_down, size: 32),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ...<String>[
                            'Grip pattern verified',
                            'Typing rhythm matched',
                            'Location validated',
                            'Timing consistent',
                            'Amount pattern normal',
                          ].map(
                            (String item) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                children: <Widget>[
                                  const Icon(Icons.check,
                                      color: AppColors.success),
                                  const SizedBox(width: 12),
                                  Text(item,
                                      style: AppTextStyles.h4
                                          .copyWith(color: AppColors.gray600)),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            '... 42 more checks',
                            style: AppTextStyles.h4.copyWith(
                                color: const Color(0xFFEC5B13),
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Container(
                width: double.infinity,
                height: 88,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: <Color>[Color(0xFF7C3AED), Color(0xFF06B6D4)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(44),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 72,
                      height: 72,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.fingerprint,
                          size: 34, color: Color(0xFF111827)),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        'Swipe to Pay $formattedAmount',
                        style: AppTextStyles.h3.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Text(
                'Protected by Behavioral AI Biometrics',
                style:
                    AppTextStyles.bodyLarge.copyWith(color: AppColors.gray400),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const SizedBox.shrink(),
    );
  }
}
