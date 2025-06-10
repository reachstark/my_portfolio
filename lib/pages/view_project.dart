import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/model/project_model.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_portfolio/widgets/scale_button.dart';
import 'package:my_portfolio/widgets/view_image_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

void viewProjectDetails(ProjectModel project) {
  Get.to(() => ViewProject(project: project), transition: Transition.downToUp);
}

class ViewProject extends StatelessWidget {
  final ProjectModel project;

  const ViewProject({super.key, required this.project});

  void _launchUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Column(
        children: [
          Header(isCustom: true, hasBackButton: true),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 716),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Thumbnail
                      if (project.thumbnail != null)
                        ScaleButton(
                          onTap: () => showZoomableImageDialog(
                            context,
                            project.thumbnail!,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              imageUrl: project.thumbnail!,
                              width: double.infinity,
                              height: isMobile ? 200 : 370,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 27, 48, 69),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.error, color: Colors.red),
                                    const SizedBox(height: 8),
                                    Text(
                                      error.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 24),

                      // Title Row + Badges
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              project.title,
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (project.isFeatured)
                            _badge("Featured", color: primaryColor),
                          if (project.isOpenSource == true)
                            _badge("Open Source", color: Colors.green),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Tags
                      if (project.tags.isNotEmpty)
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: project.tags
                              .map(
                                (tag) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF182634),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Text(
                                    tag,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      if (project.tags.isNotEmpty) const SizedBox(height: 16),

                      // Description
                      Text(
                        project.description,
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 24),

                      // Action Buttons
                      Wrap(
                        spacing: 16,
                        children: [
                          if ((project.githubLink?.isNotEmpty ?? false) &&
                              project.isOpenSource == true)
                            OutlinedButton.icon(
                              onPressed: () => _launchUrl(project.githubLink!),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: primaryColor,
                              ),
                              icon: const Icon(Icons.code),
                              label: const Text("GitHub"),
                            ),
                          if (project.isDownloadable &&
                              (project.downloadUrl?.isNotEmpty ?? false))
                            ElevatedButton.icon(
                              onPressed: () => _launchUrl(project.downloadUrl!),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                foregroundColor: Colors.white,
                              ),
                              icon: const Icon(Icons.download),
                              label: const Text("Download"),
                            ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Screenshots
                      if (project.images.isNotEmpty) ...[
                        Text("Screenshots", style: theme.textTheme.titleLarge),
                        const SizedBox(height: 16),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: isMobile ? 200 : 320,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                          ),
                          items: project.images.map((imgUrl) {
                            return ScaleButton(
                              onTap: () =>
                                  showZoomableImageDialog(context, imgUrl),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  imageUrl: imgUrl,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.broken_image),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                      const SizedBox(height: 32),
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

  Widget _badge(String label, {Color color = Colors.blue}) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Text(label, style: TextStyle(color: color, fontSize: 12)),
    );
  }
}
