import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/providers/portfolio_data_provider.dart';
import '../modules/shell/controllers/shell_controller.dart';
import '../routes/app_routes.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import 'glass_card.dart';

class GlobalSearchSearchResult {
  final String title;
  final String subtitle;
  final String category;
  final IconData icon;
  final String route;

  GlobalSearchSearchResult({
    required this.title,
    required this.subtitle,
    required this.category,
    required this.icon,
    required this.route,
  });
}

class GlobalSearchDialog extends StatefulWidget {
  const GlobalSearchDialog({super.key});

  static void show() {
    Get.dialog(
      const GlobalSearchDialog(),
      barrierDismissible: true,
    );
  }

  @override
  State<GlobalSearchDialog> createState() => _GlobalSearchDialogState();
}

class _GlobalSearchDialogState extends State<GlobalSearchDialog> {
  final TextEditingController _textController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  List<GlobalSearchSearchResult> get _allSearchableItems {
    final List<GlobalSearchSearchResult> items = [];

    // Add Projects & Apps
    for (var p in PortfolioDataProvider.projects) {
      items.add(GlobalSearchSearchResult(
        title: p.title,
        subtitle: p.description,
        category: p.isFlutterApp ? 'Flutter App' : 'Project',
        icon: p.isFlutterApp ? Icons.phone_android : Icons.folder_outlined,
        route: p.isFlutterApp ? AppRoutes.FLUTTER_APPS : AppRoutes.PROJECTS,
      ));
    }

    // Add Skills
    for (var s in PortfolioDataProvider.skills) {
      items.add(GlobalSearchSearchResult(
        title: s.name,
        subtitle: "${s.category} • ${s.description}",
        category: 'Skill',
        icon: Icons.code,
        route: AppRoutes.SKILLS,
      ));
    }

    // Add Services
    for (var s in PortfolioDataProvider.services) {
      items.add(GlobalSearchSearchResult(
        title: s.title,
        subtitle: s.description,
        category: 'Service',
        icon: Icons.design_services_outlined,
        route: AppRoutes.SERVICES,
      ));
    }

    // Add Certificates
    for (var c in PortfolioDataProvider.certificates) {
      items.add(GlobalSearchSearchResult(
        title: c.title,
        subtitle: "${c.institute} • ${c.credentialId}",
        category: 'Certificate',
        icon: Icons.card_membership_outlined,
        route: AppRoutes.CERTIFICATES,
      ));
    }

    return items;
  }

  List<GlobalSearchSearchResult> get _searchResults {
    if (_query.trim().isEmpty) {
      return _allSearchableItems.take(6).toList();
    }

    final q = _query.trim().toLowerCase();
    return _allSearchableItems.where((item) {
      return item.title.toLowerCase().contains(q) ||
          item.subtitle.toLowerCase().contains(q) ||
          item.category.toLowerCase().contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final shellController = Get.find<ShellController>();
    final results = _searchResults;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 550),
        child: GlassCard(
          padding: const EdgeInsets.all(20),
          backgroundColor: AppColors.backgroundSecondary.withOpacity(0.95),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header search field
              Row(
                children: [
                  Icon(Icons.search, color: AppColors.primaryCyan, size: 22),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      autofocus: true,
                      style: AppTypography.subtitle.copyWith(
                        fontSize: 16,
                        color: AppColors.textPrimary,
                      ),
                      onChanged: (val) => setState(() => _query = val),
                      decoration: InputDecoration(
                        hintText: "Search projects, skills, services, certs...",
                        hintStyle: AppTypography.body1.copyWith(
                          color: AppColors.textMuted,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  if (_query.isNotEmpty)
                    IconButton(
                      icon: Icon(Icons.clear, size: 18, color: AppColors.textMuted),
                      onPressed: () {
                        _textController.clear();
                        setState(() => _query = '');
                      },
                    ),
                  IconButton(
                    icon: Icon(Icons.close, color: AppColors.textMuted),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
              Divider(color: AppColors.glassBorder),
              const SizedBox(height: 8),

              // Search results list
              Expanded(
                child: results.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_off, size: 48, color: AppColors.textMuted),
                            const SizedBox(height: 12),
                            Text(
                              "No matching results for '$_query'",
                              style: AppTypography.body1.copyWith(color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        itemCount: results.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final item = results[index];
                          return InkWell(
                            onTap: () {
                              Get.back();
                              shellController.navigateTo(item.route);
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceDark,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.glassBorder),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryCyan.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(item.icon, size: 18, color: AppColors.primaryCyan),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                item.title,
                                                style: AppTypography.subtitle.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryCyan.withOpacity(0.15),
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              child: Text(
                                                item.category,
                                                style: AppTypography.caption.copyWith(
                                                  color: AppColors.primaryCyan,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 9,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          item.subtitle,
                                          style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
