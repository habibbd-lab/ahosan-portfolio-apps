import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isOutline;
  final bool isSecondary;
  final EdgeInsetsGeometry? padding;
  final double? width;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isOutline = false,
    this.isSecondary = false,
    this.padding,
    this.width,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: widget.isOutline
              ? null
              : (widget.isSecondary
                  ? const LinearGradient(
                      colors: [Color(0xFF1E2C48), Color(0xFF121B2E)],
                    )
                  : AppColors.buttonGradient),
          border: widget.isOutline
              ? Border.all(
                  color: _isHovered
                      ? AppColors.primaryCyan
                      : AppColors.glassBorder,
                  width: 1.5,
                )
              : null,
          boxShadow: (!widget.isOutline && !widget.isSecondary)
              ? [
                  BoxShadow(
                    color: AppColors.primaryCyan
                        .withOpacity(_isHovered ? 0.4 : 0.25),
                    blurRadius: _isHovered ? 16 : 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: widget.onPressed,
            child: Padding(
              padding: widget.padding ??
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null) ...[
                    Icon(
                      widget.icon,
                      size: 18,
                      color: widget.isOutline
                          ? AppColors.primaryCyan
                          : Colors.white,
                    ),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    widget.text,
                    style: AppTypography.button.copyWith(
                      color: widget.isOutline
                          ? (_isHovered
                              ? AppColors.primaryCyan
                              : AppColors.textPrimary)
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
