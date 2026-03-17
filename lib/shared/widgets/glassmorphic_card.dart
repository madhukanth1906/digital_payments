import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class GlassmorphicCard extends StatelessWidget {
  const GlassmorphicCard({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.blur = 16,
    this.borderRadius = 20,
  });

  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final double blur;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final card = GlassContainer(
      width: double.infinity,
      height: double.infinity,
      blur: blur,
      borderColor: Colors.white.withValues(alpha: 0.28),
      borderRadius: BorderRadius.circular(borderRadius),
      gradient: LinearGradient(
        colors: [
          Colors.white.withValues(alpha: 0.72),
          Colors.white.withValues(alpha: 0.50),
        ],
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.white.withValues(alpha: 0.38),
          Colors.white.withValues(alpha: 0.16),
        ],
      ),
      borderWidth: 1,
      child: Padding(padding: padding, child: child),
    );

    if (onTap == null) {
      return card;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: card,
      ),
    );
  }
}
