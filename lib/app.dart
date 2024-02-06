import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_demo/ui/screen/auth/landing/landing_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SAIP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
              Get.theme.colorScheme.primary,
            ),
            foregroundColor: const MaterialStatePropertyAll<Color>(
              Colors.black,
            ),
            fixedSize:
                const MaterialStatePropertyAll<Size>(Size.fromHeight(60)),
          ),
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
          ),
        ),
      ),
      home: const LandingView(),
    );
  }
}
