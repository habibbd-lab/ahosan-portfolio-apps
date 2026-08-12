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

                  // Metadata Attributes Bar
                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: const [
                        _MetaBadge(title: "NAME", value: "Md: Ahosan Habib Hasan"),
                        SizedBox(height: 8),
                        _MetaBadge(title: "LOCATION", value: "Sirajgonj, Bangladesh"),
                        SizedBox(height: 8),
                        _MetaBadge(title: "RESPONSE TIME", value: "< 2 Hours"),
                        SizedBox(height: 8),
                        _MetaBadge(title: "AVAILABILITY", value: "Open for Hire"),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      children: const [
                        Expanded(child: _MetaBadge(title: "NAME", value: "Md: Ahosan Habib Hasan")),
                        SizedBox(width: 12),
                        Expanded(child: _MetaBadge(title: "LOCATION", value: "Sirajgonj, Bangladesh")),
                        SizedBox(width: 12),
                        Expanded(child: _MetaBadge(title: "RESPONSE TIME", value: "< 2 Hours")),
                        SizedBox(width: 12),
                        Expanded(child: _MetaBadge(title: "AVAILABILITY", value: "Open for Hire")),
                      ],
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Direct Channels Grid
                  Text("DIRECT CHANNELS", style: AppTypography.caption.copyWith(color: AppColors.primaryCyan, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                  Text("Quick Contact Channels", style: AppTypography.title2),
                  const SizedBox(height: 24),

                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: [
                        _buildChannelCard(shellController, title: "Direct Email", subtitle: "Primary Inbox Channel", val: PortfolioDataProvider.email, action: "Send Email", link: "mailto:${PortfolioDataProvider.email}"),
                        const SizedBox(height: 16),
                        _buildChannelCard(shellController, title: "Phone Number", subtitle: "Direct Voice Call", val: PortfolioDataProvider.phone, action: "Call Now", link: "tel:${PortfolioDataProvider.phone}"),
                        const SizedBox(height: 16),
                        _buildChannelCard(shellController, title: "WhatsApp Chat", subtitle: "Instant Messaging", val: PortfolioDataProvider.whatsapp, action: "Open WhatsApp", link: PortfolioDataProvider.whatsapp),
                        const SizedBox(height: 16),
                        _buildChannelCard(shellController, title: "FB Messenger", subtitle: "Social Direct Message", val: PortfolioDataProvider.messenger, action: "Open Messenger", link: "https://${PortfolioDataProvider.messenger}"),
                      ],
                    ),
                    desktop: (context, constraints) => GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                      children: [
                        _buildChannelCard(shellController, title: "Direct Email", subtitle: "Primary Inbox Channel", val: PortfolioDataProvider.email, action: "Send Email", link: "mailto:${PortfolioDataProvider.email}"),
                        _buildChannelCard(shellController, title: "Phone Number", subtitle: "Direct Voice Call", val: PortfolioDataProvider.phone, action: "Call Now", link: "tel:${PortfolioDataProvider.phone}"),
                        _buildChannelCard(shellController, title: "WhatsApp Chat", subtitle: "Instant Messaging", val: PortfolioDataProvider.whatsapp, action: "Open WhatsApp", link: PortfolioDataProvider.whatsapp),
                        _buildChannelCard(shellController, title: "FB Messenger", subtitle: "Social Direct Message", val: PortfolioDataProvider.messenger, action: "Open Messenger", link: "https://${PortfolioDataProvider.messenger}"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 64),

                  // Send a Message Form & Base Info Card
                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: [
                        _buildFormSection(),
                        const SizedBox(height: 32),
                        _buildBaseLocationCard(),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 7, child: _buildFormSection()),
                        const SizedBox(width: 32),
                        Expanded(flex: 5, child: _buildBaseLocationCard()),
                      ],
                    ),
                  ),

                  const SizedBox(height: 64),

                  // FAQ Accordion
                  Text("TAG • FAQ", style: AppTypography.caption.copyWith(color: AppColors.primaryCyan, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                  Text("Frequently Asked Questions", style: AppTypography.title2),
                  const SizedBox(height: 8),
                  Text("Common questions about working together, project scope, and deliverables.", style: AppTypography.body2),
                  const SizedBox(height: 32),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Column(
                      children: List.generate(controller.faqs.length, (index) {
                        final faq = controller.faqs[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Obx(() {
                            final isExpanded = controller.expandedFaqIndex.value == index;
                            return GlassCard(
                              padding: const EdgeInsets.all(20),
                              onTap: () => controller.toggleFaq(index),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          faq['question']!,
                                          style: AppTypography.subtitle.copyWith(fontSize: 15),
                                        ),
                                      ),
                                      Icon(
                                        isExpanded ? Icons.remove : Icons.add,
                                        color: AppColors.primaryCyan,
                                      ),
                                    ],
                                  ),
                                  if (isExpanded) ...[
                                    const SizedBox(height: 12),
                                    const Divider(color: AppColors.glassBorder),
                                    const SizedBox(height: 12),
                                    Text(
                                      faq['answer']!,
                                      style: AppTypography.body1,
                                    ),
                                  ],
                                ],
                              ),
                            );
                          }),
                        );
                      }),
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

  Widget _buildChannelCard(ShellController shellController, {
    required String title,
    required String subtitle,
    required String val,
    required String action,
    required String link,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppTypography.subtitle.copyWith(fontSize: 14)),
              IconButton(
                icon: const Icon(Icons.copy, size: 14, color: AppColors.primaryCyan),
                onPressed: () => shellController.copyToClipboard(val, title),
                tooltip: "Copy",
              ),
            ],
          ),
          Text(subtitle, style: AppTypography.caption),
          const SizedBox(height: 8),
          Text(val, style: AppTypography.caption.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 16),
          CustomButton(
            text: action,
            isOutline: true,
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            onPressed: () => shellController.launchURL(link),
          ),
        ],
      ),
    );
  }

  Widget _buildFormSection() {
    return GlassCard(
      padding: const EdgeInsets.all(32),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Send a Message", style: AppTypography.title2),
            const SizedBox(height: 6),
            Text("Fill out the form below for project quotes, job offers, or consultations.", style: AppTypography.body2),
            const SizedBox(height: 24),
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
                StatefulBuilder(
                  builder: (context, setState) {
                    return Checkbox(
                      value: controller.formModel.agreeTerms,
                      activeColor: AppColors.primaryCyan,
                      onChanged: (val) {
                        setState(() {
                          controller.formModel.agreeTerms = val ?? false;
                        });
                      },
                    );
                  },
                ),
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
                  const Icon(Icons.location_on, size: 40, color: AppColors.primaryCyan),
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
              _buildSocialChip("GitHub", PortfolioDataProvider.github),
              _buildSocialChip("LinkedIn", PortfolioDataProvider.linkedin),
              _buildSocialChip("Facebook", PortfolioDataProvider.facebook),
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
      side: const BorderSide(color: AppColors.glassBorder),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Text(title, style: AppTypography.caption.copyWith(color: AppColors.primaryCyan, fontWeight: FontWeight.bold, fontSize: 10)),
          const SizedBox(height: 4),
          Text(value, style: AppTypography.caption.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
