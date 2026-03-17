import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flexpay_app/core/theme/app_colors.dart';
import 'package:flexpay_app/core/theme/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go('/home'),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: <Widget>[
                  const CircleAvatar(
                    radius: 34,
                    backgroundImage:
                        NetworkImage('https://i.pravatar.cc/150?img=12'),
                  ),
                  const SizedBox(height: 10),
                  const Text('Rahul Sharma', style: AppTextStyles.h5),
                  Text(
                    'Trust Score 847',
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: AppColors.gray500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _tile('KYC Status', 'Verified'),
            _tile('Phone', '+91 98XXXXXX12'),
            _tile('App Security', '47/47 patterns active'),
          ],
        ),
      ),
    );
  }

  Widget _tile(String title, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: AppTextStyles.bodyMedium),
          Text(value,
              style:
                  AppTextStyles.bodyMedium.copyWith(color: AppColors.gray500)),
        ],
      ),
    );
  }
}
