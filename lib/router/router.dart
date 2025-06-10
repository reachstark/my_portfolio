import 'package:get/get.dart';
import 'package:my_portfolio/pages/about_page.dart';
import 'package:my_portfolio/pages/porfolio_home.dart';
import 'package:my_portfolio/pages/projects_page.dart';

class AppRouter {
  static String initialRoute = '/';
  static String projectsRoute = '/projects';
  static String viewProjectRoute = '/view-project';
  static String aboutRoute = '/about';

  static final List<GetPage> routes = [
    GetPage(name: initialRoute, page: () => PortfolioPage()),
    GetPage(name: projectsRoute, page: () => ProjectsPage()),
    GetPage(name: aboutRoute, page: () => AboutPage()),
  ];
}
