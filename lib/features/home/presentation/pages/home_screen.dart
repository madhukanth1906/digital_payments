import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:flexpay_app/core/theme/app_colors.dart';
import 'package:flexpay_app/core/theme/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scoreController;
  bool _balanceVisible = true;
  final int _trustScore = 847;
  final double _balance = 45350;

  @override
  void initState() {
    super.initState();
    _scoreController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
  }

  @override
  void dispose() {
    _scoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F6),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 12),
                      _header(),
                      const SizedBox(height: 14),
                      _securityCard(),
                      const SizedBox(height: 14),
                      _balanceCard(),
                      const SizedBox(height: 14),
                      _actions(),
                      const SizedBox(height: 18),
                      _recentTransactions(),
                      const SizedBox(height: 92),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  Widget _header() {
    return SizedBox(
      height: 84,
      child: Row(
        children: <Widget>[
          const CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
          ),
          const SizedBox(width: 12),
          const Expanded(
              child: Text('Good Morning, Rahul', style: AppTextStyles.h5)),
          IconButton(
            onPressed: () {},
            icon: const Badge(
              smallSize: 8,
              child: Icon(Icons.notifications_outlined),
            ),
          ),
        ],
      ),
    );
  }

  Widget _securityCard() {
    return GlassContainer(
      height: 110,
      width: double.infinity,
      blur: 12,
      borderRadius: BorderRadius.circular(16),
      borderWidth: 1,
      gradient: LinearGradient(
        colors: <Color>[
          Colors.white.withValues(alpha: 0.7),
          Colors.white.withValues(alpha: 0.5),
        ],
      ),
      borderGradient: LinearGradient(
        colors: <Color>[
          Colors.white.withValues(alpha: 0.3),
          Colors.white.withValues(alpha: 0.1),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 74,
              height: 74,
              child: AnimatedBuilder(
                animation: _scoreController,
                builder: (_, __) {
                  return CustomPaint(
                    painter: _TrustScorePainter(
                      score: _trustScore,
                      progress: _scoreController.value,
                    ),
                    child: Center(
                      child: Text(
                        '$_trustScore',
                        style: AppTextStyles.bodySmall,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('All Secure', style: AppTextStyles.h5),
                  const Text('47/47 patterns active',
                      style: AppTextStyles.caption),
                  TextButton(
                    onPressed: () => context.go('/security/center'),
                    child: const Text('View Details >'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _balanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Available Balance', style: AppTextStyles.bodyMedium),
              IconButton(
                onPressed: () =>
                    setState(() => _balanceVisible = !_balanceVisible),
                icon: Icon(
                  _balanceVisible ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ],
          ),
          Text(
            _balanceVisible
                ? 'INR ${_balance.toStringAsFixed(2)}'
                : 'INR ******',
            style: AppTextStyles.numberMedium,
          ),
        ],
      ),
    );
  }

  Widget _actions() {
    final List<Map<String, dynamic>> actions = <Map<String, dynamic>>[
      <String, dynamic>{
        'icon': Icons.send,
        'label': 'Pay/Send',
        'path': '/payment/amount',
      },
      <String, dynamic>{
        'icon': Icons.request_quote,
        'label': 'Request',
        'path': '/payment/amount',
      },
      <String, dynamic>{
        'icon': Icons.qr_code_scanner,
        'label': 'Scan QR',
        'path': '/scan',
      },
      <String, dynamic>{
        'icon': Icons.add_circle_outline,
        'label': 'Add Money',
        'path': '/community/pool',
      },
    ];

    return GridView.builder(
      itemCount: actions.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.7,
      ),
      itemBuilder: (BuildContext context, int index) {
        final item = actions[index];
        return GlassContainer(
          width: double.infinity,
          height: double.infinity,
          blur: 10,
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            colors: <Color>[
              Colors.white.withValues(alpha: 0.7),
              Colors.white.withValues(alpha: 0.5),
            ],
          ),
          borderGradient: LinearGradient(
            colors: <Color>[
              Colors.white.withValues(alpha: 0.3),
              Colors.white.withValues(alpha: 0.1),
            ],
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => context.go(item['path'] as String),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item['icon'] as IconData, color: AppColors.primary),
                const SizedBox(height: 8),
                Text(item['label'] as String, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _recentTransactions() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('Recent', style: AppTextStyles.h5),
            TextButton(onPressed: () {}, child: const Text('See All')),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: <Widget>[
              _txn(Icons.shopping_bag_outlined, 'Starbucks Coffee', -450),
              const Divider(height: 1),
              _txn(Icons.person_outline, 'Amit Sharma', 2500),
              const Divider(height: 1),
              _txn(Icons.directions_car_outlined, 'Uber India', -320),
            ],
          ),
        ),
      ],
    );
  }

  Widget _txn(IconData icon, String title, double amount) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.gray100,
        child: Icon(icon, color: AppColors.gray600),
      ),
      title: Text(title, style: AppTextStyles.bodySmall),
      subtitle: const Text('Today'),
      trailing: Text(
        '${amount < 0 ? '-' : '+'}INR ${amount.abs().toStringAsFixed(2)}',
        style: AppTextStyles.bodySmall.copyWith(
          color: amount > 0 ? AppColors.success : AppColors.gray900,
        ),
      ),
    );
  }

  Widget _bottomNav() {
    return Container(
      height: 92,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        border: const Border(top: BorderSide(color: AppColors.gray200)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _navItem(Icons.home, 'Home', true,
                onTap: () => context.go('/home')),
            _navItem(
              Icons.receipt_long_outlined,
              'History',
              false,
              onTap: () => context.go('/history'),
            ),
            Transform.translate(
              offset: const Offset(0, -18),
              child: GestureDetector(
                onTap: () => context.go('/scan'),
                child: Container(
                  width: 84,
                  height: 84,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: <Color>[Color(0xFFEC5B13), Color(0xFFFF8C42)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Icon(Icons.qr_code_scanner,
                        color: Colors.white, size: 32),
                  ),
                ),
              ),
            ),
            _navItem(
              Icons.groups_outlined,
              'Community',
              false,
              onTap: () => context.go('/community/pool'),
            ),
            _navItem(
              Icons.person_outline,
              'Profile',
              false,
              onTap: () => context.go('/profile'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool active,
      {required VoidCallback onTap}) {
    final Color color = active ? const Color(0xFFEC5B13) : AppColors.gray400;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 66,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.caption.copyWith(
                fontSize: 10,
                fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TrustScorePainter extends CustomPainter {
  _TrustScorePainter({required this.score, required this.progress});

  final int score;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2 - 6;

    final Paint bg = Paint()
      ..color = AppColors.gray200
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    canvas.drawCircle(center, radius, bg);

    final Paint fg = Paint()
      ..shader = const LinearGradient(
        colors: <Color>[AppColors.primary, AppColors.secondary],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    final double sweep = 2 * math.pi * (score / 1000) * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweep,
      false,
      fg,
    );
  }

  @override
  bool shouldRepaint(covariant _TrustScorePainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.score != score;
  }
}
