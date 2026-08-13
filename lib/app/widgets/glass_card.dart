import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? onTap;
  final Color? borderColor;
  final Color? backgroundColor;
  final double blur;
  final BoxBorder? border;

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
    this.blur = 0.0,
    this.border,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = (widget.borderRadius as BorderRadius?) ?? BorderRadius.circular(16);
    final effectivePadding = widget.padding ?? const EdgeInsets.all(20);

    final effectiveBorder = widget.border ??
        Border.all(
          color: _isHovered
              ? AppColors.glassHoverBorder
              : (widget.borderColor ?? AppColors.glassBorder),
          width: 1.0,
        );

    final cardContent = Container(
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: widget.backgroundColor ??
            (_isHovered
                ? (AppColors.isDark
                    ? Colors.white.withOpacity(0.08)
                    : Colors.black.withOpacity(0.03))
                : AppColors.glassSurface),
        borderRadius: effectiveRadius,
        border: effectiveBorder,
        boxShadow: AppColors.isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: widget.child,
    );

    Widget result = Container(
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: effectiveRadius,
        child: widget.blur > 0
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: widget.blur, sigmaY: widget.blur),
                child: cardContent,
              )
            : cardContent,
      ),
    );

    if (widget.onTap != null) {
      result = MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          behavior: HitTestBehavior.opaque,
          child: result,
        ),
      );
    } else {
      result = MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: result,
      );
    }

    return result;
  }
}
