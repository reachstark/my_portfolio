import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/initializer.dart';
import 'package:my_portfolio/router/router.dart';

const primaryColor = Color(0xFF3D98F4);

void main() async {
  await Initializer.init();
  runApp(const ReachPortfolioApp());
}

class ReachPortfolioApp extends StatelessWidget {
  const ReachPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      supportedLocales: const [Locale('en', 'US'), Locale('km', 'KH')],
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF101A23),
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: primaryColor),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.all(primaryColor),
          checkColor: WidgetStateProperty.all(Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
        ),
        searchBarTheme: SearchBarThemeData(
          backgroundColor: WidgetStateProperty.all(const Color(0xFF182634)),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ),
        scrollbarTheme: ScrollbarThemeData(
          thickness: WidgetStateProperty.all(5),
          thumbColor: WidgetStateProperty.all(
            primaryColor.withValues(alpha: 0.7),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: primaryColor,
          selectionColor: primaryColor,
          selectionHandleColor: primaryColor,
        ),
      ),
      initialRoute: AppRouter.initialRoute,
      getPages: AppRouter.routes,
    );
  }
}
