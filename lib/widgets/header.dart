import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/images.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/router/router.dart';
import 'package:my_portfolio/widgets/scale_button.dart';

class Header extends StatelessWidget {
  final bool isCustom;
  final Widget? customWidget;
  final bool hasBackButton;

  const Header({
    super.key,
    this.isCustom = false,
    this.customWidget,
    this.hasBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    Widget navLink(IconData icon, String title, VoidCallback? onTap) {
      if (isMobile) {
        return ScaleButton(
          onTap: onTap,
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextButton(
            onPressed: onTap,
            child: Row(
              children: [
                Icon(icon, color: Colors.white, size: 20),
                const SizedBox(width: 6),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        );
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFF223649))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (hasBackButton) ...[
            ScaleButton(
              onLongPress: () {
                Get.offAndToNamed(AppRouter.initialRoute);
              },
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                ),
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ],
          // Logo
          Visibility(
            visible: !hasBackButton,
            child: ScaleButton(
              onTap: () => Get.toNamed(AppRouter.initialRoute),
              child: Row(
                children: const [
                  Icon(Icons.change_history, color: Colors.white, size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Boritheareach's Portfolio",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Right side logic
          if (isCustom && customWidget != null)
            customWidget!
          else if (isMobile)
            MenuAnchor(
              style: MenuStyle(
                backgroundColor: WidgetStateProperty.all(
                  const Color(0xFF182634),
                ),
              ),
              builder: (context, controller, child) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => controller.open(),
              ),
              menuChildren: [
                MenuItemButton(
                  child: navLink(Icons.person, 'About', () {
                    Get.toNamed(AppRouter.aboutRoute);
                  }),
                ),
                MenuItemButton(
                  child: navLink(Icons.work, 'Projects', () {
                    Get.toNamed(AppRouter.projectsRoute);
                  }),
                ),
              ],
            )
          else
            Row(
              children: [
                navLink(Icons.person, 'About', () {
                  Get.toNamed(AppRouter.aboutRoute);
                }),
                navLink(Icons.work, 'Projects', () {
                  Get.toNamed(AppRouter.projectsRoute);
                }),
                const SizedBox(width: 16),
                ScaleButton(
                  onTap: () {},
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(AppImages.myProfile),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
