import 'package:flutter/material.dart';
import 'app_colors.dart';

class GlassmorphismDecoration extends BoxDecoration {
  GlassmorphismDecoration({
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
    double borderWidth = 1.0,
    List<BoxShadow>? shadows,
    Gradient? gradient,
  }) : super(
          color: gradient == null ? (backgroundColor ?? AppColors.glassSurface) : null,
          gradient: gradient ??
              LinearGradient(
                colors: AppColors.isDark
                    ? [
                        Colors.white.withOpacity(0.06),
                        Colors.white.withOpacity(0.02),
                      ]
                    : [
                        Colors.white.withOpacity(0.9),
                        Colors.white.withOpacity(0.7),
                      ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          border: Border.all(
            color: borderColor ?? AppColors.glassBorder,
            width: borderWidth,
          ),
          boxShadow: shadows ??
              [
                BoxShadow(
                  color: AppColors.isDark
                      ? Colors.black.withOpacity(0.25)
                      : Colors.black.withOpacity(0.05),
                  blurRadius: 16,
                  spreadRadius: -4,
                  offset: const Offset(0, 8),
                ),
              ],
        );
}
