import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flexpay_app/core/theme/app_colors.dart';
import 'package:flexpay_app/core/theme/app_text_styles.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () => context.go('/home'),
                      icon: const Icon(Icons.close, size: 34),
                    ),
                    const Expanded(
                      child: Text(
                        'Payment Status',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.h4,
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
                const SizedBox(height: 24),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      left: 70,
                      top: 12,
                      child: _dot(const Color(0xFF63CDE3), 20, false),
                    ),
                    Positioned(
                      right: 110,
                      top: 86,
                      child: _dot(const Color(0xFFA57CF6), 26, true),
                    ),
                    Positioned(
                      right: 32,
                      top: 126,
                      child: _dot(const Color(0xFFE7A183), 20, false),
                    ),
                    Positioned(
                      left: 122,
                      bottom: 14,
                      child: _dot(const Color(0xFFD870AE), 24, true),
                    ),
                    Container(
                      width: 196,
                      height: 196,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: <Color>[Color(0xFF5DDBB7), Color(0xFF1EBFD2)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Icon(Icons.check,
                          color: Colors.white, size: 100),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: Column(
                    children: <Widget>[
                      const Text('Payment Successful', style: AppTextStyles.h2),
                      const SizedBox(height: 8),
                      Text(
                        'INR10,000',
                        style: AppTextStyles.numberLarge.copyWith(fontSize: 72),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDE9FE),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(color: const Color(0xFFDCC8FD)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Icon(Icons.verified_user,
                                color: Color(0xFF7C3AED), size: 18),
                            const SizedBox(width: 8),
                            Text(
                              'Secured by 47 patterns',
                              style: AppTextStyles.h4
                                  .copyWith(color: const Color(0xFF7C3AED)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 26),
                      _row('Merchant', 'Sharma Electronics',
                          trailing: Container(
                              width: 56,
                              height: 56,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(colors: <Color>[
                                    Color(0xFF0D9488),
                                    Color(0xFF155E75)
                                  ])))),
                      const SizedBox(height: 18),
                      _row('Date', 'Today, 2:34 PM'),
                      const SizedBox(height: 18),
                      _row('Transaction ID', 'TXN834729472',
                          trailing:
                              const Icon(Icons.copy, color: Color(0xFFEC5B13))),
                      const SizedBox(height: 18),
                      const Divider(color: Color(0xFFD9E3EF)),
                      const SizedBox(height: 18),
                      _row('Payment Method', 'UPI ••••4521',
                          prefix: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE2E8F0),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text('UPI',
                                style: AppTextStyles.caption.copyWith(
                                    color: AppColors.gray500,
                                    fontWeight: FontWeight.w700)),
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 90,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download,
                        size: 30, color: Colors.white),
                    label: Text(
                      'Download Receipt',
                      style: AppTextStyles.h3.copyWith(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEC5B13),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 90,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share,
                        size: 30, color: Color(0xFFEC5B13)),
                    label: Text(
                      'Share Payment',
                      style: AppTextStyles.h3
                          .copyWith(color: const Color(0xFFEC5B13)),
                    ),
                    style: OutlinedButton.styleFrom(
                      side:
                          const BorderSide(color: Color(0xFFE8B9A2), width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                TextButton(
                  onPressed: () => context.go('/home'),
                  child: Text(
                    'Done >',
                    style: AppTextStyles.h4.copyWith(color: AppColors.gray400),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _row(String label, String value, {Widget? trailing, Widget? prefix}) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.h4.copyWith(color: AppColors.gray500),
          ),
        ),
        if (prefix != null) ...<Widget>[prefix, const SizedBox(width: 10)],
        Text(value,
            style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w700)),
        if (trailing != null) ...<Widget>[const SizedBox(width: 10), trailing],
      ],
    );
  }

  Widget _dot(Color color, double size, bool capsule) {
    return Container(
      width: capsule ? size : size,
      height: capsule ? size * 0.52 : size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: capsule ? BorderRadius.circular(999) : null,
        shape: capsule ? BoxShape.rectangle : BoxShape.circle,
      ),
    );
  }
}
