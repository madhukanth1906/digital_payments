import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flexpay_app/core/theme/app_colors.dart';
import 'package:flexpay_app/core/theme/app_text_styles.dart';
import 'package:flexpay_app/shared/widgets/gradient_button.dart';

class AmountInputScreen extends StatefulWidget {
  const AmountInputScreen({super.key});

  @override
  State<AmountInputScreen> createState() => _AmountInputScreenState();
}

class _AmountInputScreenState extends State<AmountInputScreen> {
  String _amount = '0';

  void _onDigit(String digit) {
    setState(() {
      _amount = _amount == '0' ? digit : '$_amount$digit';
    });
  }

  void _backspace() {
    setState(() {
      if (_amount.length <= 1) {
        _amount = '0';
      } else {
        _amount = _amount.substring(0, _amount.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F6),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go('/home'),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Pay Merchant'),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color(0xFFA78BFA), width: 3),
                        ),
                        child: const CircleAvatar(
                          backgroundImage:
                              NetworkImage('https://i.pravatar.cc/150?img=32'),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const Expanded(
                                    child: Text('Sharma Electronics',
                                        style: AppTextStyles.h3)),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF10B981),
                                      shape: BoxShape.circle),
                                  child: const Icon(Icons.check,
                                      color: Colors.white, size: 20),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '★ 847/1000 · Verified Merchant',
                              style: AppTextStyles.bodyLarge
                                  .copyWith(color: AppColors.gray500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 44),
                Text('Enter Amount',
                    style: AppTextStyles.h4.copyWith(color: AppColors.gray500)),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('INR',
                        style: AppTextStyles.numberMedium
                            .copyWith(color: const Color(0xFF94A3B8))),
                    const SizedBox(width: 6),
                    Text(_amount,
                        style: AppTextStyles.numberLarge
                            .copyWith(fontSize: 84, height: 1.0)),
                    Container(
                        width: 3, height: 120, color: const Color(0xFF6366F1)),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Available: INR45,350',
                    style: AppTextStyles.h4.copyWith(color: AppColors.gray500)),
                const SizedBox(height: 22),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8EDF4),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFD6E0EA)),
                  ),
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.circle,
                          size: 12, color: Color(0xFF6366F1)),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          'Verifying your typing patterns...',
                          style: AppTextStyles.bodyLarge
                              .copyWith(color: const Color(0xFF334155)),
                        ),
                      ),
                      const Text('•••',
                          style: TextStyle(
                              color: Color(0xFF818CF8),
                              fontWeight: FontWeight.w700,
                              fontSize: 20)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(44)),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(child: _numPad()),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Add Note',
                        style: TextStyle(
                            color: Color(0xFF6366F1),
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 10),
                  GradientButton(
                    text: 'Pay INR $_amount',
                    onPressed: () =>
                        context.go('/payment/confirm?amount=$_amount'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _numPad() {
    final List<String> keys = <String>[
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '.',
      '0',
      'x',
    ];
    return GridView.builder(
      itemCount: keys.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 18,
        crossAxisSpacing: 18,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (_, int index) {
        final String key = keys[index];
        final bool isBack = key == 'x';
        return InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            if (isBack) {
              _backspace();
            } else {
              _onDigit(key);
            }
          },
          child: Center(
            child: isBack
                ? const Icon(Icons.backspace_outlined,
                    color: Color(0xFF94A3B8), size: 34)
                : Text(key,
                    style: AppTextStyles.numberMedium.copyWith(fontSize: 52)),
          ),
        );
      },
    );
  }
}
