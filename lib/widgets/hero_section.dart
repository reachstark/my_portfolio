import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/images.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/router/router.dart';

class HeroSection extends StatefulWidget {
  final double maxWidth;
  const HeroSection({super.key, required this.maxWidth});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        width: !isHovered ? widget.maxWidth / 2 : widget.maxWidth,
        height: 580,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
        decoration: BoxDecoration(
          border: isHovered ? Border.all(color: primaryColor, width: 4) : null,
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: AssetImage(AppImages.reachBakong),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Stack(
          children: [
            // Vignette Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  gradient: RadialGradient(
                    center: isHovered
                        ? Alignment.bottomLeft
                        : Alignment.bottomCenter, // Origin at bottom left
                    radius: 1.5,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.6), // Darker at center
                      Colors.transparent, // Fades out
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
              ),
            ),
            // Sunny Gradient Overlay at the topRight
            Positioned.fill(
              child: Visibility(
                visible: isHovered,
                maintainAnimation: true,
                maintainState: true,
                child: AnimatedOpacity(
                  opacity: isHovered ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastEaseInToSlowEaseOut,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      gradient: RadialGradient(
                        center: Alignment.topRight, // Origin at top right
                        radius: 1.5,
                        colors: [
                          Color.fromRGBO(255, 196, 0, 0.6), // Darker at center
                          Colors.transparent, // Fades out
                        ],
                        stops: [0.0, 1.0],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Text and Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isHovered ? "Hi, I'm Le Boritheareach" : "Hello, there!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Visibility(
                      visible: isHovered,
                      maintainAnimation: true,
                      maintainState: true,
                      child: AnimatedOpacity(
                        opacity: isHovered ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 900),
                        child: Text(
                          'A passionate developer with a focus on creating innovative and user-friendly applications. I love turning ideas into reality through code.',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isHovered,
                      maintainAnimation: true,
                      maintainState: true,
                      child: AnimatedOpacity(
                        opacity: isHovered ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () =>
                                Get.toNamed(AppRouter.projectsRoute),
                            child: const Text('View Projects'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
