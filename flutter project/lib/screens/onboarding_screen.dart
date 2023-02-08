import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_golang_yt/colors/app_colors.dart';
import 'package:flutter_golang_yt/screens/home_screen.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/button_widget.dart';
import 'all_tasks.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 50),
        child: PageView(
          controller: controller,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 5.5),
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("assets/wave.png"),
                    ),
                    Gap(
                      MediaQuery.of(context).size.height / 30,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "WELCOME!",
                          style: TextStyle(
                              color: AppColors.smallTextColor,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text:
                                    "\n\n Congratulations on taking a step\nforward in managing your tasks.",
                                style: TextStyle(
                                  color: AppColors.smallTextColor,
                                  fontSize: 14,
                                )),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 5.5),
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("assets/confused.png"),
                    ),
                    Gap(
                      MediaQuery.of(context).size.height / 30,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "MANAGE DAILY TASKS",
                          style: TextStyle(
                              color: AppColors.smallTextColor,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text:
                                    "\n\nYou an create, update, delete and view\nyour daily tasks with simplicity.",
                                style: TextStyle(
                                  color: AppColors.smallTextColor,
                                  fontSize: 14,
                                )),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 5.5),
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(
                        "assets/flyob.png",
                      ),
                    ),
                    Gap(
                      MediaQuery.of(context).size.height / 30,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "START ENJOYING MORE ORGANIZED LIFE",
                        style: TextStyle(
                            color: AppColors.smallTextColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Gap(20),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 50,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => HomeScreen(),
                              transition: Transition.native,
                              duration: const Duration(milliseconds: 500));
                        },
                        child: ButtonWidget(
                            bgcolor: AppColors.blue,
                            text: "Get Started",
                            textcolor: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 50,
        child: Center(
          child: Center(
              child: SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: WormEffect(
                spacing: 15,
                dotColor: AppColors.textGrey.withOpacity(0.3),
                activeDotColor: AppColors.blue),
          )),
        ),
      ),
    );
  }
}
