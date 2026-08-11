import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class ModalDialog extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget content;
  final List<Widget>? actions;

  const ModalDialog({
    super.key,
    required this.title,
    this.subtitle,
    required this.content,
    this.actions,
  });

  static void show({
    required String title,
    String? subtitle,
    required Widget content,
    List<Widget>? actions,
  }) {
    Get.dialog(
      ModalDialog(
        title: title,
        subtitle: subtitle,
        content: content,
        actions: actions,
      ),
      barrierColor: Colors.black.withOpacity(0.75),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 650,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.backgroundSecondary,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.glassHoverBorder, width: 1),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryCyan.withOpacity(0.2),
              blurRadius: 32,
              spreadRadius: 4,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Modal Header
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  decoration: const BoxDecoration(
                    color: AppColors.surfaceDark,
                    border: Border(bottom: BorderSide(color: AppColors.glassBorder)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: AppTypography.title2,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (subtitle != null) ...[
                              const SizedBox(height: 2),
                              Text(
                                subtitle!,
                                style: AppTypography.caption.copyWith(
                                  color: AppColors.primaryCyan,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.close, color: AppColors.textMuted),
                        hoverColor: Colors.white10,
                      ),
                    ],
                  ),
                ),
                // Modal Content
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: content,
                  ),
                ),
                // Modal Actions Footer
                if (actions != null && actions!.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: AppColors.surfaceDark,
                      border: Border(top: BorderSide(color: AppColors.glassBorder)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: actions!,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
