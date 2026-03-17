import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flexpay_app/core/theme/app_colors.dart';
import 'package:flexpay_app/core/theme/app_text_styles.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go('/home'),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('History'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          _item('Starbucks Coffee', 'Today, 09:24 AM', '-INR 450.00', false),
          _item('Amit Sharma', 'Yesterday, 08:15 PM', '+INR 2,500.00', true),
          _item('Uber India', 'Yesterday, 06:40 PM', '-INR 320.00', false),
          _item('Electricity Bill', 'Mar 13, 07:10 PM', '-INR 1,850.00', false),
        ],
      ),
    );
  }

  Widget _item(String title, String time, String amount, bool positive) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: <Widget>[
          const CircleAvatar(
            backgroundColor: AppColors.gray100,
            child: Icon(Icons.receipt_long, color: AppColors.gray500),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                    style: AppTextStyles.bodySmall
                        .copyWith(fontWeight: FontWeight.w700)),
                Text(time,
                    style: AppTextStyles.caption
                        .copyWith(color: AppColors.gray500)),
              ],
            ),
          ),
          Text(
            amount,
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w700,
              color: positive ? AppColors.success : AppColors.gray900,
            ),
          ),
        ],
      ),
    );
  }
}
