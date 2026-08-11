import 'package:flutter/material.dart';
import 'app_colors.dart';

class GlassmorphismDecoration extends BoxDecoration {
  GlassmorphismDecoration({
    BorderRadius? borderRadius,
    Color backgroundColor = AppColors.glassSurface,
    Color borderColor = AppColors.glassBorder,
    double borderWidth = 1.0,
    List<BoxShadow>? shadows,
    Gradient? gradient,
  }) : super(
          color: gradient == null ? backgroundColor : null,
          gradient: gradient ??
              LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.06),
                  Colors.white.withOpacity(0.02),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
          boxShadow: shadows ??
              [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 16,
                  spreadRadius: -4,
                  offset: const Offset(0, 8),
                ),
              ],
        );
}
