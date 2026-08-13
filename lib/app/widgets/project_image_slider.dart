import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class ProjectImageSlider extends StatefulWidget {
  final List<String> images;
  final double height;
  final String projectTitle;

  const ProjectImageSlider({
    super.key,
    required this.images,
    this.height = 150,
    required this.projectTitle,
  });

  @override
  State<ProjectImageSlider> createState() => _ProjectImageSliderState();
}

class _ProjectImageSliderState extends State<ProjectImageSlider> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildImageWidget(String imagePath, int index) {
    if (imagePath.startsWith('assets/')) {
      return Image.asset(
        imagePath,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildFallbackGradient(index),
      );
    } else if (imagePath.startsWith('http')) {
      return Image.network(
        imagePath,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildFallbackGradient(index),
      );
    }
    return _buildFallbackGradient(index);
  }

  Widget _buildFallbackGradient(int index) {
    final gradients = [
      [const Color(0xFF0F2027), const Color(0xFF203A43), const Color(0xFF2C5364)],
      [const Color(0xFF141E30), const Color(0xFF243B55)],
      [const Color(0xFF1A1A2E), const Color(0xFF16213E), const Color(0xFF0F3460)],
      [const Color(0xFF0D1B2A), const Color(0xFF1B263B), const Color(0xFF415A77)],
    ];

    final gradColors = gradients[index % gradients.length];
    final labels = ["Overview & UI", "Feature Details", "Workflow & Data", "Mobile Client"];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              index % 2 == 0 ? Icons.smartphone : Icons.dashboard_outlined,
              size: 28,
              color: AppColors.primaryCyan,
            ),
            const SizedBox(height: 4),
            Text(
              widget.projectTitle,
              style: AppTypography.caption.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Slide ${index + 1} of 4 • ${labels[index % labels.length]}",
              style: AppTypography.caption.copyWith(
                color: AppColors.primaryCyan,
                fontSize: 9,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayImages = widget.images.isEmpty
        ? [
            'assets/icons/chef_starz_banner.png',
            'assets/icons/chef_starz_slide2.png',
            'slide_3',
            'slide_4',
          ]
        : widget.images;

    return Container(
      height: widget.height,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryCyan.withOpacity(0.3)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: Stack(
          children: [
            // PageView Image Slider
            PageView.builder(
              controller: _pageController,
              itemCount: displayImages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return _buildImageWidget(displayImages[index], index);
              },
            ),

            // Prev Arrow
            if (displayImages.length > 1)
              Positioned(
                left: 4,
                top: 0,
                bottom: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.55),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),

            // Next Arrow
            if (displayImages.length > 1)
              Positioned(
                right: 4,
                top: 0,
                bottom: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.55),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),

            // Page Indicator Dots
            if (displayImages.length > 1)
              Positioned(
                bottom: 6,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    displayImages.length,
                    (idx) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2.5),
                      width: _currentIndex == idx ? 14 : 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: _currentIndex == idx
                            ? AppColors.primaryCyan
                            : Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
