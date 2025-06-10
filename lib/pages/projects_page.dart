import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/model/project_model.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/project_card.dart';

import '../controller/firebase_controller.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final TextEditingController _searchController = TextEditingController();
  final fbX = Get.find<FirebaseController>();

  bool openSourceOnly = false;
  String _searchQuery = '';
  late List<ProjectModel> filteredProjects;

  @override
  void initState() {
    super.initState();
    filteredProjects = fbX.projects;
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyBuilder() {
      final visibleProjects = filteredProjects.where((project) {
        final isMatchingQuery = project.title.toLowerCase().contains(
          _searchQuery.toLowerCase(),
        );
        return isMatchingQuery &&
            (!openSourceOnly || project.isOpenSource == true);
      }).toList();

      if (visibleProjects.isEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Icon(Icons.search_off_rounded, size: 64, color: primaryColor),
                const SizedBox(height: 16),
                Text(
                  'No projects found',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Try adjusting your search or filter options.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      }

      return Wrap(
        spacing: 16,
        children: visibleProjects.map((project) {
          return ProjectCard(project: project);
        }).toList(),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Header(isCustom: true, hasBackButton: true),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 716),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Projects",
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Browse a selection of my projects, showcasing my software development skills and experience.",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 24),

                      // Filters
                      Row(
                        children: [
                          Expanded(
                            child: SearchBar(
                              controller: _searchController,
                              textStyle: WidgetStateProperty.all(
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Colors.grey.shade200,
                                ),
                              ),
                              onChanged: (value) => setState(() {
                                _searchQuery = value;
                              }),
                              leading: Icon(Icons.search_rounded),
                              trailing: [
                                IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: _clearSearch,
                                ),
                              ],
                              hintText: "Search for a project",
                            ),
                          ),
                          const SizedBox(width: 16),
                          DropdownButton<String>(
                            elevation: 0,
                            borderRadius: BorderRadius.circular(8),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            dropdownColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            icon: const Icon(Icons.filter_list),
                            value: openSourceOnly ? 'Open Source' : 'All',
                            items: const [
                              DropdownMenuItem<String>(
                                value: 'Open Source',
                                child: Text('Open Source'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'All',
                                child: Text('All'),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                openSourceOnly = value == 'Open Source';
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Projects
                      bodyBuilder(),
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
