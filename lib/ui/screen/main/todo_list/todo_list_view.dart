import 'package:api_demo/ui/screen/auth/login/login_controller.dart';
import 'package:api_demo/ui/widget/custom_button.dart';
import 'package:api_demo/ui/widget/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController c = Get.put(LoginController());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_landing.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                width: Get.mediaQuery.size.width,
                child: Image.asset(
                  'assets/images/map_dots.png',
                  fit: BoxFit.cover,
                ),
              ),
              Image.asset('assets/images/line.png'),
              Positioned(
                left: Get.mediaQuery.size.width * 0.28,
                child: Image.asset(
                  'assets/icons/ic_plane.png',
                  width: 80,
                  height: 80,
                ),
              ),
              ListView(
                children: [
                  SizedBox(height: Get.mediaQuery.size.height * 0.16),
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 72.0),
                    children: [
                      Image.asset('assets/images/logo_saib.png', width: 400),
                      const SizedBox(height: 16),
                      const CustomInputField(label: 'User Name'),
                      const SizedBox(height: 8),
                      const CustomInputField(
                        label: 'Password',
                        supportObscure: true,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(
                            () => Checkbox(
                              tristate: false,
                              value: c.isRememberMeChecked.value,
                              onChanged: (value) {
                                c.isRememberMeChecked.value = value!;
                              },
                            ),
                          ),
                          const Text('Remember Me')
                        ],
                      ),
                      const SizedBox(height: 8),
                      CustomButton(
                        actionText: 'Login',
                        onTap: () async => c.onLoginTap(),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: Get.mediaQuery.size.height * 0.16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'assets/icons/ic_aboutus.png',
                          width: 40,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/icons/ic_locator.png',
                          width: 40,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/icons/ic_phone.png',
                          width: 40,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
