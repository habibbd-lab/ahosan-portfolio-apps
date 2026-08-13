import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/shell/controllers/shell_controller.dart';

class AppColors {
  static bool get isDark {
    try {
      if (Get.isRegistered<ShellController>()) {
        return Get.find<ShellController>().isDarkMode.value;
      }
    } catch (_) {}
    return true;
  }

  // Dynamic Backgrounds
  static Color get background => isDark ? const Color(0xFF0A0F1D) : const Color(0xFFF8FAFC);
  static Color get backgroundSecondary => isDark ? const Color(0xFF0C1322) : const Color(0xFFF1F5F9);
  static Color get backgroundTertiary => isDark ? const Color(0xFF0D1527) : const Color(0xFFE2E8F0);
  static Color get surfaceDark => isDark ? const Color(0xFF121B2E) : const Color(0xFFFFFFFF);
  static Color get surfaceCard => isDark ? const Color(0xFF141F36) : const Color(0xFFFFFFFF);

  // Accent Gradients & Colors
  static Color get primaryCyan => isDark ? const Color(0xFF00F2FE) : const Color(0xFF0284C7);
  static Color get electricBlue => isDark ? const Color(0xFF4FACFE) : const Color(0xFF2563EB);
  static const Color accentGreen = Color(0xFF10B981);
  static const Color accentPurple = Color(0xFF7F00FF);
  static const Color accentOrange = Color(0xFFFF758C);
  static const Color accentYellow = Color(0xFFFFB800);

  // Glassmorphic Overlays
  static Color get glassSurface => isDark ? const Color(0x0CFFFFFF) : const Color(0xFFFFFFFF);
  static Color get glassBorder => isDark ? const Color(0x1AFFFFFF) : const Color(0xFFE2E8F0);
  static Color get glassHoverBorder => isDark ? const Color(0x6600F2FE) : const Color(0xFF38BDF8);
  static Color get glassShadow => isDark ? const Color(0x40000000) : const Color(0x0F000000);

  // Text Colors
  static Color get textPrimary => isDark ? const Color(0xFFF8FAFC) : const Color(0xFF0F172A);
  static Color get textSecondary => isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569);
  static Color get textMuted => isDark ? const Color(0xFF64748B) : const Color(0xFF64748B);

  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFA3E635);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Gradients
  static LinearGradient get primaryGradient => LinearGradient(
        colors: [primaryCyan, electricBlue],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );

  static LinearGradient get accentGradient => LinearGradient(
        colors: [primaryCyan, accentGreen],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static LinearGradient get cardGradient => isDark
      ? const LinearGradient(
          colors: [Color(0x1AFFFFFF), Color(0x05FFFFFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      : const LinearGradient(
          colors: [Color(0xFFFFFFFF), Color(0xFFF8FAFC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );

  static LinearGradient get buttonGradient => LinearGradient(
        colors: [primaryCyan, electricBlue],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
}
