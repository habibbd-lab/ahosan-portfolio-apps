import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class Orbital3dAvatar extends StatefulWidget {
  final String? imagePath;
  final double size;

  const Orbital3dAvatar({
    super.key,
    this.imagePath,
    this.size = 380,
  });

  @override
  State<Orbital3dAvatar> createState() => _Orbital3dAvatarState();
}

class _Orbital3dAvatarState extends State<Orbital3dAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static const List<String> techNodes = [
    "Flutter",
    "AI",
    "HTML5",
    "CSS3",
    "JavaScript",
    "Bootstrap",
    "Photoshop",
    "Illustrator",
    "Docker",
    "Linux",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final avatarSize = widget.size * 0.42;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final progress = _controller.value * 2 * math.pi;

        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 1. Background 3D Perspective Orbital Ring Painter
              CustomPaint(
                size: Size(widget.size, widget.size),
                painter: _OrbitalRingsPainter(progress: progress),
              ),

              // 2. Central 3D Avatar Circle
              Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const RadialGradient(
                    colors: [
                      Color(0x3300F2FE),
                      Color(0x000A0F1D),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryCyan.withOpacity(0.35),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                    BoxShadow(
                      color: AppColors.electricBlue.withOpacity(0.2),
                      blurRadius: 50,
                      spreadRadius: 15,
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.primaryGradient,
                    border: Border.all(color: AppColors.primaryCyan, width: 2),
                  ),
                  child: ClipOval(
                    child: Container(
                      color: AppColors.surfaceDark,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // --- ADDED IMAGE HERE ---
                          Image.asset(
                            'assets/my-photo/MD Ahosan Habib.jpeg',
                            width: avatarSize,
                            height: avatarSize,
                            fit: BoxFit.cover, // Ensures the image scales perfectly within the circle
                          ),
                          // Overlay hint ring
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.primaryCyan.withOpacity(0.3),
                                width: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // 3. Orbiting Satellite Tech Badges
              ...List.generate(techNodes.length, (index) {
                final baseAngle = (index * 2 * math.pi / techNodes.length);
                final currentAngle = baseAngle + progress * 0.5;

                // 3D Perspective Ellipse Mapping
                final radiusX = widget.size * 0.40;
                final radiusY = widget.size * 0.26;
                final tiltAngle = -0.35; // Perspective tilt angle

                final rawX = radiusX * math.cos(currentAngle);
                final rawY = radiusY * math.sin(currentAngle);

                // Rotate coordinates by tilt angle
                final x = rawX * math.cos(tiltAngle) - rawY * math.sin(tiltAngle);
                final y = rawX * math.sin(tiltAngle) + rawY * math.cos(tiltAngle);

                // Depth scaling & opacity simulating 3D Z-distance
                final zDepth = math.sin(currentAngle);
                final scale = 0.82 + 0.28 * ((zDepth + 1) / 2);
                final opacity = 0.65 + 0.35 * ((zDepth + 1) / 2);

                return Transform.translate(
                  offset: Offset(x, y),
                  child: Transform.scale(
                    scale: scale,
                    child: Opacity(
                      opacity: opacity.clamp(0.4, 1.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundSecondary.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.primaryCyan.withOpacity(0.6),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryCyan.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          techNodes[index],
                          style: AppTypography.caption.copyWith(
                            color: AppColors.primaryCyan,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

class _OrbitalRingsPainter extends CustomPainter {
  final double progress;

  _OrbitalRingsPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final rx = size.width * 0.40;
    final ry = size.height * 0.26;

    final paintRing = Paint()
      ..color = AppColors.primaryCyan.withOpacity(0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final paintGlowRing = Paint()
      ..color = AppColors.electricBlue.withOpacity(0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    // Draw main perspective tilted orbit
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(-0.35);

    canvas.drawOval(
      Rect.fromCenter(center: Offset.zero, width: rx * 2, height: ry * 2),
      paintGlowRing,
    );
    canvas.drawOval(
      Rect.fromCenter(center: Offset.zero, width: rx * 2, height: ry * 2),
      paintRing,
    );

    // Inner secondary tilted ring
    final innerPaint = Paint()
      ..color = AppColors.accentGreen.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawOval(
      Rect.fromCenter(center: Offset.zero, width: rx * 1.4, height: ry * 1.4),
      innerPaint,
    );

    // Draw orbiting glowing particles along ring
    final particlePaint = Paint()
      ..color = AppColors.primaryCyan
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 4; i++) {
      final angle = progress + (i * math.pi / 2);
      final px = rx * math.cos(angle);
      final py = ry * math.sin(angle);
      canvas.drawCircle(Offset(px, py), 3, particlePaint);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _OrbitalRingsPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
