import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/certificate_card.dart';
import '../../../widgets/empty_state.dart';
import '../../../widgets/filter_chip.dart';
import '../../../widgets/responsive_builder.dart';
import '../../../widgets/search_bar.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/stat_card.dart';
import '../../shell/views/shell_view.dart';
import '../../shell/widgets/global_footer.dart';
import '../controllers/certificates_controller.dart';

class CertificatesView extends GetView<CertificatesController> {
  const CertificatesView({super.key});

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
                    tag: "Certificates & Credentials",
                    title: "Education, Certifications & Achievements",
                    subtitle: "Showcasing continuous learning, technical growth, professional training courses, verified institutional diplomas, and career milestones.",
                  ),
                  const SizedBox(height: 48),

                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: const [
                        StatCard(number: "5", label: "Certificates"),
                        SizedBox(height: 16),
                        StatCard(number: "6", label: "Courses Taken"),
                        SizedBox(height: 16),
                        StatCard(number: "20", label: "Skills Mastered"),
                        SizedBox(height: 16),
                        StatCard(number: "15", label: "Live Projects"),
                        SizedBox(height: 16),
                        StatCard(number: "500", label: "+ Learning Hours"),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      children: const [
                        Expanded(child: StatCard(number: "5", label: "Certificates")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "6", label: "Courses Taken")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "20", label: "Skills Mastered")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "15", label: "Live Projects")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "500", label: "+ Learning Hours")),
                      ],
                    ),
                  ),

                  const SizedBox(height: 48),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 650),
                    child: CustomSearchBar(
                      hintText: "Search certificates by institute, course, credential ID, or skill...",
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
                    final certs = controller.filteredCertificates;
                    if (certs.isEmpty) {
                      return const EmptyStateWidget(
                        title: "No Credentials Found",
                        message: "No certificate match your search query.",
                      );
                    }

                    return ResponsiveBuilder(
                      mobile: (context, constraints) => Column(
                        children: certs.map((c) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: CertificateCard(
                              certificate: c,
                              onTap: () => controller.showCertificateDetails(c),
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
                        itemCount: certs.length,
                        itemBuilder: (context, index) {
                          final c = certs[index];
                          return CertificateCard(
                            certificate: c,
                            onTap: () => controller.showCertificateDetails(c),
                          );
                        },
                      ),
                    );
                  }),

                  const SizedBox(height: 64),

                  Text("Planned Future Certifications Roadmap", style: AppTypography.title2),
                  const SizedBox(height: 8),
                  Text("Continuous professional certifications currently targeted for completion.", style: AppTypography.body2),
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
