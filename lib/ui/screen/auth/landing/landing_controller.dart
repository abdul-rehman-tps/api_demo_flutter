import 'package:get/get.dart';
import 'package:api_demo/ui/screen/auth/login/login_view.dart';

class LandingController extends GetxController {
  void onLoginTap() {
    Get.to(
      const LoginView(),
      duration: const Duration(seconds: 1),
      transition: Transition.fadeIn,
    );
  }

  void onRegisterTap() {}
}
