import 'package:flutter/material.dart';

class AppColors {
  // Backgrounds
  static const Color background = Color(0xFF0A0F1D);
  static const Color backgroundSecondary = Color(0xFF0C1322);
  static const Color backgroundTertiary = Color(0xFF0D1527);
  static const Color surfaceDark = Color(0xFF121B2E);
  static const Color surfaceCard = Color(0xFF141F36);

  // Accent Gradients & Colors
  static const Color primaryCyan = Color(0xFF00F2FE);
  static const Color electricBlue = Color(0xFF4FACFE);
  static const Color accentGreen = Color(0xFF00F5A0);
  static const Color accentPurple = Color(0xFF7F00FF);
  static const Color accentOrange = Color(0xFFFF758C);
  static const Color accentYellow = Color(0xFFFFB800);

  // Glassmorphic Overlays
  static const Color glassSurface = Color(0x0CFFFFFF);
  static const Color glassBorder = Color(0x1AFFFFFF);
  static const Color glassHoverBorder = Color(0x6600F2FE);
  static const Color glassShadow = Color(0x40000000);

  // Text Colors
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);

  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFA3E635);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryCyan, electricBlue],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [primaryCyan, accentGreen],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0x1AFFFFFF), Color(0x05FFFFFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFF00F2FE), Color(0xFF4FACFE)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
