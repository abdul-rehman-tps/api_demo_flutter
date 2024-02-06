import 'package:api_demo/ui/screen/auth/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

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
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.white,
        ),
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
      home: const LoginView(),
    );
  }
}
