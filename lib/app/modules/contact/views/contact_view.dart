import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/providers/portfolio_data_provider.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/glass_card.dart';
import '../../../widgets/responsive_builder.dart';
import '../../../widgets/section_header.dart';
import '../../shell/controllers/shell_controller.dart';
import '../../shell/views/shell_view.dart';
import '../../shell/widgets/global_footer.dart';
import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({super.key});

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
                    tag: "Contact",
                    title: "Let's Build Something Amazing Together",
                    subtitle: "Available for freelance, remote contracts, full-time software roles, agency collaborations, and creative partnerships.",
                  ),
                  const SizedBox(height: 36),

                  // Metadata Attributes Bar (at least 2 per row)
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isMobile ? 2 : 4,
                    crossAxisSpacing: isMobile ? 12 : 12,
                    mainAxisSpacing: isMobile ? 12 : 12,
                    childAspectRatio: isMobile ? 1.7 : 2.5,
                    children: const [
                      _MetaBadge(title: "NAME", value: "Md: Ahosan Habib Hasan"),
                      _MetaBadge(title: "LOCATION", value: "Sirajgonj, Bangladesh"),
                      _MetaBadge(title: "RESPONSE TIME", value: "< 2 Hours"),
                      _MetaBadge(title: "AVAILABILITY", value: "Open for Hire"),
                    ],
                  ),

                  const SizedBox(height: 48),

                  // Direct Channels Grid (at least 2 per row)
                  Text("DIRECT CHANNELS", style: AppTypography.caption.copyWith(color: AppColors.primaryCyan, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                  Text("Quick Contact Channels", style: AppTypography.title2),
                  const SizedBox(height: 24),

                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isMobile ? 2 : 4,
                    crossAxisSpacing: isMobile ? 12 : 16,
                    mainAxisSpacing: isMobile ? 12 : 16,
                    childAspectRatio: isMobile ? 0.78 : 1.2,
                    children: [
                      _buildChannelCard(shellController, title: "Direct Email", subtitle: "Primary Inbox Channel", val: PortfolioDataProvider.email, action: "Send Email", link: PortfolioDataProvider.emailUrl, isMobile: isMobile),
                      _buildChannelCard(shellController, title: "Phone Number", subtitle: "Direct Voice Call", val: PortfolioDataProvider.phone, action: "Call Now", link: PortfolioDataProvider.phoneUrl, isMobile: isMobile),
                      _buildChannelCard(shellController, title: "WhatsApp Chat", subtitle: "Instant Messaging", val: PortfolioDataProvider.whatsapp, action: "Open WhatsApp", link: PortfolioDataProvider.whatsappUrl, isMobile: isMobile),
                      _buildChannelCard(shellController, title: "FB Messenger", subtitle: "Social Direct Message", val: PortfolioDataProvider.messenger, action: "Open Messenger", link: PortfolioDataProvider.messengerUrl, isMobile: isMobile),
                    ],
                  ),

                  const SizedBox(height: 64),

                  // Send a Message Form & Base Info Card
                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: [
                        _buildFormSection(true),
                        const SizedBox(height: 32),
                        _buildBaseLocationCard(),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 7, child: _buildFormSection(false)),
                        const SizedBox(width: 32),
                        Expanded(flex: 5, child: _buildBaseLocationCard()),
                      ],
                    ),
                  ),

                  const SizedBox(height: 64),

                  // FAQ Accordion (2 per row layout)
                  Text("TAG • FAQ", style: AppTypography.caption.copyWith(color: AppColors.primaryCyan, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                  Text("Frequently Asked Questions", style: AppTypography.title2),
                  const SizedBox(height: 8),
                  Text("Common questions about working together, project scope, and deliverables.", style: AppTypography.body2, textAlign: TextAlign.center),
                  const SizedBox(height: 32),

                  Obx(() {
                    final faqs = controller.faqs;

                    Widget buildFaqItem(int index) {
                      final faq = faqs[index];
                      final isExpanded = controller.expandedFaqIndex.value == index;
                      return GlassCard(
                        padding: EdgeInsets.all(isMobile ? 14 : 18),
                        onTap: () => controller.toggleFaq(index),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    faq['question']!,
                                    style: AppTypography.subtitle.copyWith(
                                      fontSize: isMobile ? 13 : 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: isExpanded
                                        ? AppColors.primaryCyan.withOpacity(0.15)
                                        : AppColors.surfaceDark,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    isExpanded ? Icons.remove : Icons.add,
                                    color: AppColors.primaryCyan,
                                    size: isMobile ? 16 : 20,
                                  ),
                                ),
                              ],
                            ),
                            if (isExpanded) ...[
                              const SizedBox(height: 12),
                              Divider(color: AppColors.glassBorder, height: 1),
                              const SizedBox(height: 12),
                              Text(
                                faq['answer']!,
                                style: AppTypography.body1.copyWith(
                                  color: AppColors.textSecondary,
                                  fontSize: isMobile ? 12 : 14,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ],
                        ),
                      );
                    }

                    if (isMobile) {
                      return Column(
                        children: List.generate(faqs.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: buildFaqItem(index),
                          );
                        }),
                      );
                    } else {
                      final half = (faqs.length / 2).ceil();
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: List.generate(half, (i) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: buildFaqItem(i),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              children: List.generate(faqs.length - half, (i) {
                                final index = half + i;
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: buildFaqItem(index),
                                );
                              }),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
                ],
              ),
            ),
            const GlobalFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildChannelCard(ShellController shellController, {
    required String title,
    required String subtitle,
    required String val,
    required String action,
    required String link,
    bool isMobile = false,
  }) {
    return GlassCard(
      padding: EdgeInsets.all(isMobile ? 12 : 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTypography.subtitle.copyWith(fontSize: isMobile ? 13 : 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: Icon(Icons.copy, size: 14, color: AppColors.primaryCyan),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () => shellController.copyToClipboard(val, title),
                tooltip: "Copy",
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(subtitle, style: AppTypography.caption.copyWith(fontSize: isMobile ? 10 : 12), maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 6),
          Text(
            val,
            style: AppTypography.caption.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: isMobile ? 11 : 13),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          const SizedBox(height: 8),
          CustomButton(
            text: action,
            isOutline: true,
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: isMobile ? 8 : 12),
            width: double.infinity,
            onPressed: () => shellController.launchURL(link),
          ),
        ],
      ),
    );
  }

  Widget _buildFormSection(bool isMobile) {
    return GlassCard(
      padding: EdgeInsets.all(isMobile ? 16 : 32),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Send a Message", style: AppTypography.title2),
            const SizedBox(height: 6),
            Text("Fill out the form below for project quotes, job offers, or consultations.", style: AppTypography.body2),
            const SizedBox(height: 24),
            if (isMobile) ...[
              CustomTextField(
                label: "Your Name *",
                hint: "John Doe",
                onChanged: (val) => controller.formModel.name = val,
                validator: (val) => (val == null || val.isEmpty) ? "Name is required" : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: "Your Email *",
                hint: "john@example.com",
                onChanged: (val) => controller.formModel.email = val,
                validator: (val) => (val == null || !val.contains('@')) ? "Valid email required" : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: "Phone Number (Optional)",
                hint: "+1 (555) 000-0000",
                onChanged: (val) => controller.formModel.phone = val,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: "Company / Org (Optional)",
                hint: "Agency or Business Name",
                onChanged: (val) => controller.formModel.company = val,
              ),
            ] else ...[
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: "Your Name *",
                      hint: "John Doe",
                      onChanged: (val) => controller.formModel.name = val,
                      validator: (val) => (val == null || val.isEmpty) ? "Name is required" : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      label: "Your Email *",
                      hint: "john@example.com",
                      onChanged: (val) => controller.formModel.email = val,
                      validator: (val) => (val == null || !val.contains('@')) ? "Valid email required" : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: "Phone Number (Optional)",
                      hint: "+1 (555) 000-0000",
                      onChanged: (val) => controller.formModel.phone = val,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      label: "Company / Org (Optional)",
                      hint: "Agency or Business Name",
                      onChanged: (val) => controller.formModel.company = val,
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 16),
            CustomTextField(
              label: "Subject *",
              hint: "Flutter App Project / Full Stack Website Consultation",
              onChanged: (val) => controller.formModel.subject = val,
              validator: (val) => (val == null || val.isEmpty) ? "Subject is required" : null,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Project Details / Message *",
              hint: "Describe your project goals, scope, requirements, or inquiry here...",
              maxLines: 4,
              onChanged: (val) => controller.formModel.message = val,
              validator: (val) => (val == null || val.length < 10) ? "Please enter at least 10 characters" : null,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Obx(() => Checkbox(
                  value: controller.agreeTerms.value,
                  activeColor: AppColors.primaryCyan,
                  onChanged: (val) {
                    controller.agreeTerms.value = val ?? false;
                    controller.formModel.agreeTerms = val ?? false;
                  },
                )),
                Expanded(
                  child: Text(
                    "I agree to the storing and processing of my data in accordance with the Privacy Policy.",
                    style: AppTypography.caption,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Obx(() {
              return CustomButton(
                text: controller.isSubmitting.value ? "Sending..." : "Send Message Now",
                width: double.infinity,
                onPressed: controller.submitForm,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildBaseLocationCard() {
    return GlassCard(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Base & Timezone", style: AppTypography.title2),
          const SizedBox(height: 6),
          Text("Based in Dhaka, Bangladesh (UTC+6). Remote contract friendly across US, EU, and Asian timezones.", style: AppTypography.body2),
          const SizedBox(height: 20),
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: AppColors.surfaceDark,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.glassBorder),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, size: 40, color: AppColors.primaryCyan),
                  const SizedBox(height: 8),
                  Text("Dhaka, Bangladesh", style: AppTypography.subtitle.copyWith(fontSize: 16)),
                  Text("UTC +6:00 Time Zone • Open for Global Contracts", style: AppTypography.caption),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text("SOCIAL PROFILES", style: AppTypography.caption.copyWith(color: AppColors.primaryCyan, fontWeight: FontWeight.bold, letterSpacing: 1)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            children: [
              _buildSocialChip("GitHub", PortfolioDataProvider.githubUrl),
              _buildSocialChip("WhatsApp", PortfolioDataProvider.whatsappUrl),
              _buildSocialChip("Email", PortfolioDataProvider.emailUrl),
              _buildSocialChip("Phone", PortfolioDataProvider.phoneUrl),
              _buildSocialChip("LinkedIn", PortfolioDataProvider.linkedinUrl),
              _buildSocialChip("Facebook", PortfolioDataProvider.facebookUrl),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialChip(String label, String url) {
    final shellController = Get.find<ShellController>();
    return ActionChip(
      label: Text(label),
      backgroundColor: AppColors.surfaceDark,
      labelStyle: AppTypography.caption.copyWith(color: AppColors.primaryCyan),
      side: BorderSide(color: AppColors.glassBorder),
      onPressed: () => shellController.launchURL(url),
    );
  }
}

class _MetaBadge extends StatelessWidget {
  final String title;
  final String value;

  const _MetaBadge({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTypography.caption.copyWith(
              color: AppColors.primaryCyan,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTypography.caption.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
