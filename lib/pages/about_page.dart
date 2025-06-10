import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/images.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/scale_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    double maxWidth = 716;

    List<String> skills = ['Flutter', 'Dart', 'Vue', 'Firebase', 'Supabase'];
    List<ConnectButton> connectButtons = [
      ConnectButton(
        title: 'Email',
        icon: Icons.email,
        onTap: () {
          launchUrl(Uri.parse('mailto:theareach.apple@gmail.com'));
        },
      ),
      ConnectButton(
        title: 'Github',
        icon: FontAwesomeIcons.github,
        onTap: () => launchUrl(Uri.parse('https://github.com/reachstark')),
      ),
      ConnectButton(
        title: 'Facebook',
        icon: FontAwesomeIcons.facebook,
        onTap: () =>
            launchUrl(Uri.parse('https://www.facebook.com/robert.faketansy')),
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          const Header(hasBackButton: true),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Container(
                          height: isMobile ? 100 : 140,
                          width: isMobile ? 100 : 140,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                            image: DecorationImage(
                              image: AssetImage(AppImages.myProfile),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "LE BORITHEAREACH",
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                    ),
                              ),
                              Text(
                                "Flutter Developer",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                    ),
                              ),
                              Text(
                                'Experienced in crafting, testing, and deploying cross-platform applications using Flutter and Dart. Adept at building intuitive user interfaces and ensuring seamless performance by following best practices and modern development standards.',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Biography',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'A motivated and adaptable individual with a dual academic background in Information Technology from the Royal University of Phnom Penh and English from the Institute of Foreign Languages. Passionate about technology and self-driven learning, I have developed various personal projects using the Dart programming language and Flutter framework, including a BMI calculator and an assistant application. I am confident in my ability to troubleshoot systems, install operating systems, and independently research unfamiliar technologies. With a strong commitment to growth, I continue to enhance my skills through online courses and hands-on experience. I value teamwork, continuous improvement, and aspire to take on greater responsibilities in the future while becoming a reliable and trusted contributor to any organization I join.',
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Skills',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: skills
                          .map(
                            (skill) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF182634),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                skill,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Connect',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(spacing: 16, runSpacing: 8, children: connectButtons),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConnectButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  const ConnectButton({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ScaleButton(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF182634),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(icon, color: Colors.white),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
