import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_golang_yt/controllers/data_controller.dart';
import 'package:flutter_golang_yt/screens/add_task.dart';
import 'package:flutter_golang_yt/screens/home_screen.dart';
import 'package:flutter_golang_yt/screens/view_task.dart';
import 'package:flutter_golang_yt/widgets/button_widget.dart';
import 'package:flutter_golang_yt/widgets/task_widget.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
// import 'package:intl/intl.dart';
import '../colors/app_colors.dart';
import 'edit_task.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);
  loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    // var now = DateTime.now();
    // var formatter = DateFormat('yyyy-MM-dd');
    // String formattedDate = formatter.format(now);
    // List myData = [
    //   "Finish Tutorial",
    //   "Go for a walk",
    // ];
    // print(myData);
    // print(myData.length);

    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: AppColors.blue,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );
    final rightEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: AppColors.red,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(30),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: AppColors.mainColor,
              size: 30,
            ),
          ),
          Center(
            child: Container(
                padding: EdgeInsets.only(top: 10),
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height / 3.2,
                child: Image(image: AssetImage("assets/focus.png"))),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            // width: double.maxFinite,
            // height: MediaQuery.of(context).size.height / 3.2,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => HomeScreen(),
                        transition: Transition.native,
                        duration: const Duration(milliseconds: 500));
                  },
                  child: Icon(
                    Icons.home_filled,
                    color: AppColors.blue,
                  ),
                ),
                Gap(10),
                GestureDetector(
                  onTap: () {
                    Get.to(() => AddTask(),
                        transition: Transition.native,
                        duration: const Duration(milliseconds: 500));
                  },
                  child: Icon(
                    Icons.add_circle_rounded,
                    color: AppColors.mainColor,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.calendar_month,
                  color: AppColors.blue,
                ),
                Gap(10),
                Text(
                  // formattedDate,
                  "3/2/2023",
                  style: TextStyle(fontSize: 20, color: AppColors.mainColor),
                )
              ],
            ),
          ),
          Flexible(child: GetBuilder<DataController>(
            builder: (controller) {
              return ListView.builder(
                  itemCount: controller.myData.length,
                  itemBuilder: ((context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Dismissible(
                        background: leftEditIcon,
                        secondaryBackground: rightEditIcon,
                        onDismissed: (DismissDirection direction) {
                          print("confirmed");
                        },
                        confirmDismiss: (DismissDirection direction) async {
                          if (direction == DismissDirection.startToEnd) {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffedf0f8).withOpacity(0.5),
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20))),
                                  height: 250,
                                  // margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.off(() => ViewTask(
                                                id: int.parse(controller
                                                    .myData[index]["id"]
                                                    .toString())));
                                          },
                                          child: ButtonWidget(
                                              bgcolor: AppColors.blue,
                                              text: "View",
                                              textcolor: Colors.white),
                                        ),
                                      ),
                                      Gap(20),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.off(() => EditTask(
                                                id: int.parse(controller
                                                    .myData[index]["id"]
                                                    .toString())));
                                          },
                                          child: ButtonWidget(
                                              bgcolor: AppColors.orange,
                                              text: "Edit",
                                              textcolor: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                            return false;
                          } else {
                            controller.deleteData(
                                int.parse(controller.myData[index]["id"]));
                            return Future.delayed(
                                Duration(seconds: 1),
                                (() =>
                                    direction == DismissDirection.endToStart));
                          }
                        },
                        key: ObjectKey(index),
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 20, right: 20, bottom: 10),
                          child: TaskWidget(
                            text: controller.myData[index]["task_name"],
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    );
                  }));
            },
          ))
        ],
      ),
    );
  }
}
