import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flexpay_app/core/theme/app_colors.dart';
import 'package:flexpay_app/core/theme/app_text_styles.dart';
import 'package:flexpay_app/shared/widgets/gradient_button.dart';

class FraudAlertScreen extends StatelessWidget {
  const FraudAlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go('/home'),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Security Alert'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 12),
            const CircleAvatar(
              radius: 44,
              backgroundColor: AppColors.error,
              child: Icon(
                Icons.warning_amber_rounded,
                color: Colors.white,
                size: 44,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Suspicious Activity Detected',
              style: AppTextStyles.h4,
            ),
            const SizedBox(height: 10),
            const Text(
              'This transaction deviates strongly from your normal interaction profile. Please verify identity before proceeding.',
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Card(
              child: Column(
                children: <Widget>[
                  ListTile(title: Text('Risk Level'), trailing: Text('High')),
                  Divider(height: 1),
                  ListTile(
                    title: Text('Pattern Mismatches'),
                    trailing: Text('8'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    title: Text('Device Confidence'),
                    trailing: Text('42%'),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GradientButton(
              text: 'Re-Authenticate',
              onPressed: () => context.go('/auth/login'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => context.go('/home'),
              child: const Text('Cancel Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
