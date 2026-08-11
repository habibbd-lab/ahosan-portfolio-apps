import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/responsive_builder.dart';
import '../controllers/shell_controller.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/mobile_drawer.dart';
import '../widgets/top_nav_bar.dart';

class ShellView extends GetView<ShellController> {
  final Widget child;

  const ShellView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBuilder.isDesktop(context);
    final isMobile = ResponsiveBuilder.isMobile(context);

    return Scaffold(
      appBar: isDesktop
          ? const TopNavBar()
          : AppBar(
              title: const Text(
                "AHOSAN HABIB HASAN",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
      drawer: isDesktop ? null : const MobileDrawer(),
      body: child,
      bottomNavigationBar: isMobile ? const BottomNavBar() : null,
    );
  }
}
