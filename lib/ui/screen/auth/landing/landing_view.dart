import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_demo/ui/screen/auth/landing/landing_controller.dart';
import 'package:api_demo/ui/widget/custom_button.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    final LandingController c = Get.put(LandingController());

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
                  SizedBox(height: Get.mediaQuery.size.height * 0.25),
                  Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/logo_saib.png', width: 250),
                        const SizedBox(height: 32),
                        const Text('Welcome', textAlign: TextAlign.center),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                              icon: Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/ic_aboutus.png',
                                    width: 40,
                                  ),
                                  const Text('About Us'),
                                ],
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/ic_locator.png',
                                    width: 40,
                                  ),
                                  const Text('ATM Locator'),
                                ],
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/ic_phone.png',
                                    width: 40,
                                  ),
                                  const Text('Contact Us'),
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 64),
                        SizedBox(
                          width: 250,
                          child: CustomButton(
                            actionText: 'Login',
                            onTap: () async => c.onLoginTap(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: 250,
                          child: CustomButton(
                            actionText: 'Register',
                            onTap: () async => c.onRegisterTap(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
