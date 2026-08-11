import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/glass_card.dart';
import '../../../widgets/responsive_builder.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/stat_card.dart';
import '../../shell/controllers/shell_controller.dart';
import '../../shell/views/shell_view.dart';
import '../../shell/widgets/global_footer.dart';
import '../controllers/education_controller.dart';

class EducationView extends GetView<EducationController> {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    final shellController = Get.find<ShellController>();
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
                    tag: "Academic Credentials",
                    title: "Education, Certifications & Training",
                    subtitle: "Formal IT institutes, intensive software development bootcamps, certified creative diplomas, and continuous cloud learning pathways.",
                  ),
                  const SizedBox(height: 48),

                  Text("Educational Qualifications", style: AppTypography.title2),
                  const SizedBox(height: 8),
                  Text("Official academic achievements and CST engineering background.", style: AppTypography.body2),
                  const SizedBox(height: 32),

                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: controller.academicCredentials.map((edu) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: _buildAcademicCard(edu),
                        );
                      }).toList(),
                    ),
                    desktop: (context, constraints) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: controller.academicCredentials.map((edu) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: _buildAcademicCard(edu),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 64),

                  // Specialized Training Bootcamps
                  Text("Specialized Training Programs", style: AppTypography.title2),
                  const SizedBox(height: 8),
                  Text("Hands-on mobile & web engineering bootcamps from Dhaka institutes.", style: AppTypography.body2),
                  const SizedBox(height: 32),

                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: [
                        _buildTrainingCard(
                          tag: "APP DEV • 3 MOS",
                          title: "BdCalling Academy, Dhaka",
                          subtitle: "Course: App Dev (Dart & Flutter)",
                          desc: "Completed 3 months intensive training in Flutter mobile development, GetX state management, REST API integration, dynamic JSON parsing, and GitHub team workflows.",
                          tags: ["Flutter", "Dart", "GitHub"],
                        ),
                        const SizedBox(height: 20),
                        _buildTrainingCard(
                          tag: "WEB DEV • 3 MOS",
                          title: "Dreamland IT Institute",
                          subtitle: "Course: Web Design & Dev",
                          desc: "Completed 3 months professional web development training mastering HTML5, CSS3, JavaScript ES6+, Bootstrap 5 responsive layouts, and hosting.",
                          tags: ["HTML5/CSS3", "JavaScript", "Responsive"],
                        ),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      children: [
                        Expanded(
                          child: _buildTrainingCard(
                            tag: "APP DEV • 3 MOS",
                            title: "BdCalling Academy, Dhaka",
                            subtitle: "Course: App Dev (Dart & Flutter)",
                            desc: "Completed 3 months intensive training in Flutter mobile development, GetX state management, REST API integration, dynamic JSON parsing, and GitHub team workflows.",
                            tags: ["Flutter", "Dart", "GitHub"],
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _buildTrainingCard(
                            tag: "WEB DEV • 3 MOS",
                            title: "Dreamland IT Institute",
                            subtitle: "Course: Web Design & Dev",
                            desc: "Completed 3 months professional web development training mastering HTML5, CSS3, JavaScript ES6+, Bootstrap 5 responsive layouts, and hosting.",
                            tags: ["HTML5/CSS3", "JavaScript", "Responsive"],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 64),

                  // Training & Achievement Highlights Metrics
                  Text("Training & Achievement Highlights", style: AppTypography.title2),
                  const SizedBox(height: 24),
                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: const [
                        StatCard(number: "12+", label: "Certificates Earned"),
                        SizedBox(height: 16),
                        StatCard(number: "5+", label: "Specialized Tracks"),
                        SizedBox(height: 16),
                        StatCard(number: "25+", label: "Technologies Mastered"),
                        SizedBox(height: 16),
                        StatCard(number: "500+", label: "Hours Practical Training"),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      children: const [
                        Expanded(child: StatCard(number: "12+", label: "Certificates Earned")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "5+", label: "Specialized Tracks")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "25+", label: "Technologies Mastered")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "500+", label: "Hours Practical Training")),
                      ],
                    ),
                  ),

                  const SizedBox(height: 64),

                  GlassCard(
                    padding: EdgeInsets.all(isMobile ? 24 : 48),
                    child: Column(
                      children: [
                        Text("Ready to Add These Skills & Credentials to Your Team?", style: AppTypography.title2, textAlign: TextAlign.center),
                        const SizedBox(height: 12),
                        Text(
                          "I combine formal technical workshop training with certified visual design expertise to deliver production-ready software applications and creative campaigns.",
                          textAlign: TextAlign.center,
                          style: AppTypography.body1,
                        ),
                        const SizedBox(height: 24),
                        CustomButton(
                          text: "Hire Me Now",
                          onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
                        ),
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

  Widget _buildAcademicCard(Map<String, dynamic> edu) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryCyan.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primaryCyan.withOpacity(0.3)),
            ),
            child: Text(
              edu['tag']!,
              style: AppTypography.caption.copyWith(
                color: AppColors.primaryCyan,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(edu['title']!, style: AppTypography.subtitle.copyWith(fontSize: 16)),
          const SizedBox(height: 4),
          Text(edu['institute']!, style: AppTypography.caption.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(edu['board']!, style: AppTypography.body2),
          Text(edu['group']!, style: AppTypography.body2),
          Text(edu['year']!, style: AppTypography.body2),
          Text(edu['result']!, style: AppTypography.body2.copyWith(color: AppColors.accentGreen, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(edu['location']!, style: AppTypography.caption),
        ],
      ),
    );
  }

  Widget _buildTrainingCard({
    required String tag,
    required String title,
    required String subtitle,
    required String desc,
    required List<String> tags,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.electricBlue.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.electricBlue.withOpacity(0.3)),
            ),
            child: Text(
              tag,
              style: AppTypography.caption.copyWith(
                color: AppColors.electricBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(title, style: AppTypography.subtitle),
          const SizedBox(height: 4),
          Text(subtitle, style: AppTypography.caption.copyWith(color: AppColors.primaryCyan)),
          const SizedBox(height: 12),
          Text(desc, style: AppTypography.body2),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: tags.map((t) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Text(t, style: AppTypography.caption.copyWith(fontSize: 10)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
