import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flexpay_app/features/auth/presentation/pages/login_screen.dart';
import 'package:flexpay_app/features/auth/presentation/pages/signup_screen.dart';
import 'package:flexpay_app/features/community/presentation/pages/community_pool_screen.dart';
import 'package:flexpay_app/features/home/presentation/pages/home_screen.dart';
import 'package:flexpay_app/features/home/presentation/pages/history_screen.dart';
import 'package:flexpay_app/features/home/presentation/pages/profile_screen.dart';
import 'package:flexpay_app/features/onboarding/presentation/pages/patterns_screen.dart';
import 'package:flexpay_app/features/onboarding/presentation/pages/security_screen.dart';
import 'package:flexpay_app/features/onboarding/presentation/pages/welcome_screen.dart';
import 'package:flexpay_app/features/payment/presentation/pages/amount_input_screen.dart';
import 'package:flexpay_app/features/payment/presentation/pages/confirmation_screen.dart';
import 'package:flexpay_app/features/payment/presentation/pages/processing_screen.dart';
import 'package:flexpay_app/features/payment/presentation/pages/qr_scan_screen.dart';
import 'package:flexpay_app/features/payment/presentation/pages/success_screen.dart';
import 'package:flexpay_app/features/security/presentation/pages/fraud_alert_screen.dart';
import 'package:flexpay_app/features/security/presentation/pages/good_rating_screen.dart';
import 'package:flexpay_app/features/security/presentation/pages/security_center_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/onboarding/welcome',
    routes: [
      GoRoute(
        path: '/onboarding/welcome',
        builder: (_, __) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/onboarding/patterns',
        builder: (_, __) => const PatternsScreen(),
      ),
      GoRoute(
        path: '/onboarding/security',
        builder: (_, __) => const SecurityScreen(),
      ),
      GoRoute(path: '/auth/signup', builder: (_, __) => const SignupScreen()),
      GoRoute(path: '/auth/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
      GoRoute(path: '/history', builder: (_, __) => const HistoryScreen()),
      GoRoute(path: '/profile', builder: (_, __) => const ProfileScreen()),
      GoRoute(
        path: '/payment/amount',
        builder: (_, __) => const AmountInputScreen(),
      ),
      GoRoute(
        path: '/payment/confirm',
        builder: (_, __) => const ConfirmationScreen(),
      ),
      GoRoute(
        path: '/payment/processing',
        builder: (_, __) => const ProcessingScreen(),
      ),
      GoRoute(path: '/scan', builder: (_, __) => const QrScanScreen()),
      GoRoute(
        path: '/payment/success',
        builder: (_, __) => const SuccessScreen(),
      ),
      GoRoute(
        path: '/security/center',
        builder: (_, __) => const SecurityCenterScreen(),
      ),
      GoRoute(
        path: '/security/fraud-alert',
        builder: (_, __) => const FraudAlertScreen(),
      ),
      GoRoute(
        path: '/security/good-rating',
        builder: (_, __) => const GoodRatingScreen(),
      ),
      GoRoute(
        path: '/community/pool',
        builder: (_, __) => const CommunityPoolScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Route not found: ${state.uri.path}')),
    ),
  );
}
