import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final VoidCallback? onClear;
  final TextEditingController? controller;

  const CustomSearchBar({
    super.key,
    this.hintText = "Search...",
    required this.onChanged,
    this.onClear,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.glassSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: AppTypography.body1.copyWith(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTypography.body2.copyWith(color: AppColors.textMuted),
          prefixIcon: const Icon(Icons.search, color: AppColors.primaryCyan),
          suffixIcon: onClear != null
              ? IconButton(
                  icon: const Icon(Icons.clear, size: 18, color: AppColors.textMuted),
                  onPressed: onClear,
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
