import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/hero_section.dart';
import 'package:my_portfolio/widgets/project_card.dart';

void main() {
  runApp(const ReachPortfolioApp());
}

class ReachPortfolioApp extends StatelessWidget {
  const ReachPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF101A23),
        textTheme: const TextTheme(bodyMedium: TextStyle(fontFamily: 'Inter')),
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: const [
                      HeroSection(),
                      SizedBox(height: 20),
                      SectionTitle(title: 'Featured Projects'),
                      ProjectCard(
                        title: 'E-commerce Platform',
                        description:
                            'A full-featured e-commerce platform with user authentication, product management, and payment integration.',
                        imageUrl:
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuDg8ESK0jKvintq0RnL7wkNIaGcGxpaJBHuPnTrXOvU8N9T5apVG0xIO4sI2a9qNbcdYX4LGW6anG_JfvwUK1ZJ8IGOZNzdeoOLUQgPNSFaXOyE3qGEzFV2lxKG9APfo7lJ9KvjkRLXzu2qEw3H73BqrUK7KhPM1u7V4DTmPVDwd5VyB3m8Yc9UsHKY9KGQE6boTBIZVlX1nLbTVdWFtZ8IYHZ4tVAoJVAROs2Ki-Z5iPthEaIGwKet7NdvZNT_Onh1J1JZHLt-MAmG',
                      ),
                      SizedBox(height: 20),
                      ProjectCard(
                        title: 'Task Management App',
                        description:
                            'A task management application to help users organize their daily tasks and improve productivity.',
                        imageUrl:
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuDAUD-3jILgcmwgvEI_MusLiemqiIDtEbZoF02fb9xiHWlS6gYAEDSwrtOxiz-Wp1tBMv5hjHIymR9gLraanpwX2uN_LBDSOwfdcctKZGriZ59MYpwxIMQn1dykXRvwedCGAWaBgJp1wVFGfJPdy6vzl8-nqdllRog4aBxjEqT-n1-jg66eIH6--AuEeJqd9ZdUtFw2koIiCARBRvBOuvZzd96swPk6mxUEZra1x_aM_qfZC9Ix',
                      ),
                    ],
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
