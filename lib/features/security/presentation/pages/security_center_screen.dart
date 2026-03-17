import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flexpay_app/core/services/behavioral_biometrics_service.dart';
import 'package:flexpay_app/core/theme/app_colors.dart';
import 'package:flexpay_app/core/theme/app_text_styles.dart';

class SecurityCenterScreen extends StatelessWidget {
  const SecurityCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = BehavioralBiometricsService();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go('/home'),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Security Center'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Card(
            child: ListTile(
              title: const Text('47/47 Patterns Monitoring'),
              subtitle: Text(
                'Supported: ${service.totalSupportedPatterns} patterns',
              ),
              trailing: const Icon(
                Icons.verified_user,
                color: AppColors.success,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text('Physical Patterns', style: AppTextStyles.h5),
          ...BehavioralBiometricsService.physicalPatterns.map(_item),
          const SizedBox(height: 8),
          const Text('Temporal Patterns', style: AppTextStyles.h5),
          ...BehavioralBiometricsService.temporalPatterns.map(_item),
          const SizedBox(height: 8),
          const Text('Spatial Patterns', style: AppTextStyles.h5),
          ...BehavioralBiometricsService.spatialPatterns.map(_item),
          const SizedBox(height: 8),
          const Text('Cognitive Patterns', style: AppTextStyles.h5),
          ...BehavioralBiometricsService.cognitivePatterns.map(_item),
        ],
      ),
    );
  }

  Widget _item(String label) {
    return ListTile(
      dense: true,
      leading: const Icon(Icons.shield, color: AppColors.primary, size: 18),
      title: Text(label, style: AppTextStyles.bodySmall),
      trailing: const Icon(
        Icons.check_circle,
        color: AppColors.success,
        size: 18,
      ),
    );
  }
}
