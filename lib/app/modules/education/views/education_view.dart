import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/providers/portfolio_data_provider.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/glass_card.dart';
import '../../../widgets/modal_dialog.dart';
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
                horizontal: isMobile ? 20 : 64,
                vertical: isMobile ? 32 : 56,
              ),
              child: Column(
                children: [
                  // Section Header
                  const SectionHeader(
                    tag: "MY ACADEMIC & PROFESSIONAL CREDENTIALS",
                    title: "Education, Certifications & Training",
                    subtitle:
                        "Formal IT Institutes, intensive software development bootcamps, certified creative diplomas, and continuous cloud learning pathways.",
                  ),
                  const SizedBox(height: 48),

                  // 1. FORMAL EDUCATION
                  Text(
                    "FORMAL EDUCATION",
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primaryCyan,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Educational Qualifications",
                    style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Official academic achievements and CST engineering background.",
                    style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 1 : 3,
                      crossAxisSpacing: isMobile ? 16 : 24,
                      mainAxisSpacing: isMobile ? 16 : 24,
                      childAspectRatio: isMobile ? 1.35 : 0.85,
                    ),
                    itemCount: controller.academicCredentials.length,
                    itemBuilder: (context, index) {
                      final edu = controller.academicCredentials[index];
                      return _buildAcademicCard(edu);
                    },
                  ),

                  const SizedBox(height: 64),

                  // 2. SPECIALIZED TRAINING PROGRAMS
                  Text(
                    "PROFESSIONAL TRAINING",
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primaryCyan,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Specialized Training Programs",
                    style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Hands-on mobile & web engineering bootcamps from Dhaka institutes.",
                    style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: [
                        _buildTrainingCard(
                          tag: "APP DEV • 3 MOS",
                          title: "BdCalling Academy, Dhaka",
                          subtitle: "Course: App Dev (Dart & Flutter)",
                          desc:
                              "Completed 3 months intensive training in Flutter mobile development, GetX state management, REST API integration, dynamic JSON parsing, and GitHub team workflows.",
                          tags: ["Flutter", "Dart", "GitHub"],
                        ),
                        const SizedBox(height: 16),
                        _buildTrainingCard(
                          tag: "WEB DEV • 3 MOS",
                          title: "Dreamland IT Institute",
                          subtitle: "Course: Web Design & Dev",
                          desc:
                              "Completed 3 months professional web development training mastering HTML5, CSS3, JavaScript ES6+, Bootstrap 5 responsive layouts, and hosting.",
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
                            desc:
                                "Completed 3 months intensive training in Flutter mobile development, GetX state management, REST API integration, dynamic JSON parsing, and GitHub team workflows.",
                            tags: ["Flutter", "Dart", "GitHub"],
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _buildTrainingCard(
                            tag: "WEB DEV • 3 MOS",
                            title: "Dreamland IT Institute",
                            subtitle: "Course: Web Design & Dev",
                            desc:
                                "Completed 3 months professional web development training mastering HTML5, CSS3, JavaScript ES6+, Bootstrap 5 responsive layouts, and hosting.",
                            tags: ["HTML5/CSS3", "JavaScript", "Responsive"],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 64),

                  // 3. CONTINUOUS LEARNING ROADMAP
                  GlassCard(
                    padding: EdgeInsets.all(isMobile ? 24 : 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.accentGreen.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColors.accentGreen.withOpacity(0.4)),
                              ),
                              child: Text(
                                "CONTINUOUS LEARNING ROADMAP",
                                style: AppTypography.caption.copyWith(
                                  color: AppColors.accentGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "DevOps & Cloud Infrastructure Pathway",
                          style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Actively expanding technical horizons beyond frontend engineering into backend deployment automation, Linux administration, containerized environments, and CI/CD automated build pipelines.",
                          style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
                        ),
                        const SizedBox(height: 28),

                        ResponsiveBuilder(
                          mobile: (context, constraints) => Column(
                            children: [
                              _buildDevOpsRoadmapBadge("Linux & Ubuntu", "Bash CLI & Permissions", "In Progress", AppColors.accentYellow),
                              const SizedBox(height: 12),
                              _buildDevOpsRoadmapBadge("Docker Containers", "Dockerfiles & Networks", "Active", AppColors.primaryCyan),
                              const SizedBox(height: 12),
                              _buildDevOpsRoadmapBadge("NGINX & Cloud", "Reverse Proxy & SSL", "Exploring", AppColors.electricBlue),
                              const SizedBox(height: 12),
                              _buildDevOpsRoadmapBadge("GitHub Actions", "Automated CI/CD Builds", "Target", AppColors.accentGreen),
                            ],
                          ),
                          desktop: (context, constraints) => GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 2.0,
                            children: [
                              _buildDevOpsRoadmapBadge("Linux & Ubuntu", "Bash CLI & Permissions", "In Progress", AppColors.accentYellow),
                              _buildDevOpsRoadmapBadge("Docker Containers", "Dockerfiles & Networks", "Active", AppColors.primaryCyan),
                              _buildDevOpsRoadmapBadge("NGINX & Cloud", "Reverse Proxy & SSL", "Exploring", AppColors.electricBlue),
                              _buildDevOpsRoadmapBadge("GitHub Actions", "Automated CI/CD Builds", "Target", AppColors.accentGreen),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 64),

                  // 4. QUALIFICATION METRICS
                  Text(
                    "QUALIFICATION METRICS",
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primaryCyan,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Training & Achievement Highlights",
                    style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                  ),
                  const SizedBox(height: 24),

                  ResponsiveBuilder(
                    mobile: (context, constraints) => GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: isMobile ? 1.05 : 1.35,
                      children: const [
                        StatCard(number: "12+", label: "Certificates Earned"),
                        StatCard(number: "5+", label: "Specialized Tracks"),
                        StatCard(number: "25+", label: "Technologies Mastered"),
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

                  // 5. TAKE THE NEXT STEP CTA
                  GlassCard(
                    padding: EdgeInsets.all(isMobile ? 28 : 48),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primaryCyan.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.primaryCyan.withOpacity(0.3)),
                          ),
                          child: Text(
                            "TAKE THE NEXT STEP",
                            style: AppTypography.caption.copyWith(
                              color: AppColors.primaryCyan,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Ready to Add These Skills & Credentials to Your Team?",
                          style: AppTypography.title1.copyWith(fontSize: isMobile ? 22 : 32),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 680),
                          child: Text(
                            "I combine formal technical workshop training with certified visual design expertise to deliver production-ready software applications and creative campaigns.",
                            textAlign: TextAlign.center,
                            style: AppTypography.body1.copyWith(color: AppColors.textSecondary),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          alignment: WrapAlignment.center,
                          children: [
                            CustomButton(
                              text: "Download Full Resume",
                              icon: Icons.download,
                              onPressed: () => shellController.copyToClipboard(PortfolioDataProvider.email, "Resume"),
                            ),
                            CustomButton(
                              text: "Hire Me Now",
                              isOutline: true,
                              icon: Icons.work_outline,
                              onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
                            ),
                            CustomButton(
                              text: "View Built Projects",
                              isOutline: true,
                              icon: Icons.folder_outlined,
                              onPressed: () => shellController.navigateTo(AppRoutes.PROJECTS),
                            ),
                          ],
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
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryCyan.withOpacity(0.12),
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
          const SizedBox(height: 14),
          Text(edu['title']!, style: AppTypography.subtitle.copyWith(fontSize: 16)),
          const SizedBox(height: 4),
          Text(
            edu['institute']!,
            style: AppTypography.caption.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildEduDetailRow("Board:", edu['board']!),
          _buildEduDetailRow("Group:", edu['group']!),
          _buildEduDetailRow("Passing Year:", edu['year']!),
          _buildEduDetailRow("Result:", edu['result']!, isResult: true),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 12, color: AppColors.textMuted),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  edu['location']!,
                  style: AppTypography.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEduDetailRow(String label, String val, {bool isResult = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.caption),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              val,
              textAlign: TextAlign.right,
              style: AppTypography.caption.copyWith(
                color: isResult ? AppColors.accentGreen : AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  void _showTrainingModal({
    required String tag,
    required String title,
    required String subtitle,
    required String desc,
    required List<String> tags,
  }) {
    ModalDialog.show(
      title: title,
      subtitle: subtitle,
      content: Column(
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
          Text(desc, style: AppTypography.body1.copyWith(color: AppColors.textSecondary, height: 1.5)),
          const SizedBox(height: 20),
          Text(
            "Technologies & Topics Mastered:",
            style: AppTypography.subtitle.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags.map((t) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Text(
                  t,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.primaryCyan,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
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
      padding: const EdgeInsets.all(16),
      onTap: () => _showTrainingModal(
        tag: tag,
        title: title,
        subtitle: subtitle,
        desc: desc,
        tags: tags,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    fontSize: 10,
                  ),
                ),
              ),
              InkWell(
                onTap: () => _showTrainingModal(
                  tag: tag,
                  title: title,
                  subtitle: subtitle,
                  desc: desc,
                  tags: tags,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "See More ->",
                      style: AppTypography.caption.copyWith(
                        color: AppColors.primaryCyan,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(title, style: AppTypography.subtitle.copyWith(fontSize: 15), maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          Text(subtitle, style: AppTypography.caption.copyWith(color: AppColors.primaryCyan), maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8),
          Text(desc, style: AppTypography.body2.copyWith(color: AppColors.textSecondary, height: 1.4), maxLines: 3, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: tags.map((t) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Text(
                  t,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.primaryCyan,
                    fontSize: 10,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDevOpsRoadmapBadge(String title, String subtitle, String status, Color statusColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: AppTypography.body2.copyWith(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                Text(subtitle, style: AppTypography.caption),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              status,
              style: AppTypography.caption.copyWith(color: statusColor, fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
