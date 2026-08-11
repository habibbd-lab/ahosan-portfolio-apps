import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final Color? borderColor;
  final Color? backgroundColor;

  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.margin,
    this.width,
    this.height,
    this.borderRadius,
    this.onTap,
    this.borderColor,
    this.backgroundColor,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = widget.borderRadius ?? BorderRadius.circular(16);

    return Container(
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: _isHovered
                ? (Matrix4.identity()..translate(0.0, -4.0, 0.0))
                : Matrix4.identity(),
            child: ClipRRect(
              borderRadius: effectiveRadius,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: widget.padding,
                  decoration: BoxDecoration(
                    color: widget.backgroundColor ??
                        (_isHovered
                            ? Colors.white.withOpacity(0.06)
                            : AppColors.glassSurface),
                    borderRadius: effectiveRadius,
                    border: Border.all(
                      color: _isHovered
                          ? AppColors.glassHoverBorder
                          : (widget.borderColor ?? AppColors.glassBorder),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: _isHovered
                            ? AppColors.primaryCyan.withOpacity(0.15)
                            : Colors.black.withOpacity(0.25),
                        blurRadius: _isHovered ? 24 : 16,
                        spreadRadius: -4,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
