import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/empty_state.dart';
import '../../../widgets/filter_chip.dart';
import '../../../widgets/flutter_app_card.dart';
import '../../../widgets/responsive_builder.dart';
import '../../../widgets/search_bar.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/stat_card.dart';
import '../../shell/views/shell_view.dart';
import '../../shell/widgets/global_footer.dart';
import '../controllers/flutter_apps_controller.dart';

class FlutterAppsView extends GetView<FlutterAppsController> {
  const FlutterAppsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBuilder.isMobile(context);

    return ShellView(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 64,
                vertical: 64,
              ),
              child: Column(
                children: [
                  const SectionHeader(
                    tag: "Dart & Flutter Engineering",
                    title: "Flutter Applications & UIs",
                    subtitle: "Cross-platform mobile apps engineered with GetX state management, REST API integration, responsive device mockups, and APK build placeholders.",
                  ),
                  const SizedBox(height: 48),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 650),
                    child: CustomSearchBar(
                      hintText: "Search 12 Flutter mobile applications...",
                      onChanged: controller.updateSearch,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Obx(() {
                    return Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: controller.categories.map((cat) {
                        return CustomFilterChip(
                          label: cat,
                          isSelected: controller.selectedCategory.value == cat,
                          onTap: () => controller.selectCategory(cat),
                        );
                      }).toList(),
                    );
                  }),

                  const SizedBox(height: 48),

                  Obx(() {
                    final apps = controller.filteredApps;
                    if (apps.isEmpty) {
                      return const EmptyStateWidget(
                        title: "No Flutter Apps Found",
                        message: "No Flutter application matched your filter criteria.",
                      );
                    }

                    return ResponsiveBuilder(
                      mobile: (context, constraints) => Column(
                        children: apps.map((a) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: FlutterAppCard(
                              app: a,
                              onPreview: () => controller.showAppPreview(a),
                              onSpecs: () => controller.showAppSpecs(a),
                            ),
                          );
                        }).toList(),
                      ),
                      desktop: (context, constraints) => GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 24,
                          childAspectRatio: 0.85,
                        ),
                        itemCount: apps.length,
                        itemBuilder: (context, index) {
                          final a = apps[index];
                          return FlutterAppCard(
                            app: a,
                            onPreview: () => controller.showAppPreview(a),
                            onSpecs: () => controller.showAppSpecs(a),
                          );
                        },
                      ),
                    );
                  }),

                  const SizedBox(height: 64),

                  Text("Mobile Engineering Statistics", style: AppTypography.title2),
                  const SizedBox(height: 24),

                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: const [
                        StatCard(number: "12", label: "Flutter Apps"),
                        SizedBox(height: 16),
                        StatCard(number: "3", label: "Sparktech Production Apps"),
                        SizedBox(height: 16),
                        StatCard(number: "100%", label: "% GetX State Binding"),
                        SizedBox(height: 16),
                        StatCard(number: "15", label: "REST API Endpoints"),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      children: const [
                        Expanded(child: StatCard(number: "12", label: "Flutter Apps")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "3", label: "Sparktech Production Apps")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "100%", label: "% GetX State Binding")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "15", label: "REST API Endpoints")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const GlobalFooter(),
          ],
        ),
      ),
    );
  }
}
