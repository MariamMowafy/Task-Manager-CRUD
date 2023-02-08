import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_golang_yt/colors/app_colors.dart';
import 'package:flutter_golang_yt/screens/add_task.dart';
import 'package:flutter_golang_yt/screens/all_tasks.dart';
import 'package:flutter_golang_yt/widgets/button_widget.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.only(left: 20, top: 80, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                  text: "Hello",
                  style: TextStyle(
                      color: AppColors.smallTextColor,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: "\nHave a beautiful day!",
                        style: TextStyle(
                          color: AppColors.smallTextColor,
                          fontSize: 14,
                        )),
                  ]),
            ),
            Gap(50),
            Center(
              child: Image(
                height: MediaQuery.of(context).size.height / 3,
                image: AssetImage("assets/wave.png"),
              ),
            ),
            Gap(60),
            InkWell(
              onTap: () {
                Get.to(() => AddTask(),
                    transition: Transition.native,
                    duration: const Duration(milliseconds: 500));
              },
              child: ButtonWidget(
                  bgcolor: AppColors.orange,
                  text: "Add Task",
                  textcolor: Colors.white),
            ),
            Gap(20),
            InkWell(
              onTap: () {
                Get.to(() => AllTasks(),
                    transition: Transition.native,
                    duration: const Duration(milliseconds: 500));
              },
              child: ButtonWidget(
                  bgcolor: AppColors.blue,
                  text: "View Tasks",
                  textcolor: Colors.white),
            ),
          ],
        ),
        decoration: const BoxDecoration(
          // image: DecorationImage(
          color: Color(0xFAF5F2),
          //     image: AssetImage("assets/bg2.jpg"), fit: BoxFit.cover)
        ),
      ),
    );
  }
}
