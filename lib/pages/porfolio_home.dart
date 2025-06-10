import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/hero_section.dart';
import 'package:my_portfolio/widgets/project_card.dart';

import '../controller/firebase_controller.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    double maxWidth = 716;
    final fbX = Get.find<FirebaseController>();

    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Obx(
                    () => Column(
                      children: [
                        HeroSection(maxWidth: maxWidth),
                        const SizedBox(height: 20),
                        const SectionTitle(title: 'Featured Projects'),
                        // Display only featured projects
                        ...fbX.projects
                            .where((project) => project.isFeatured)
                            .map((project) => ProjectCard(project: project)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
