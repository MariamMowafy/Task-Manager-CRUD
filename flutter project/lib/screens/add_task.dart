import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_golang_yt/colors/app_colors.dart';
import 'package:flutter_golang_yt/controllers/data_controller.dart';
import 'package:flutter_golang_yt/screens/all_tasks.dart';
import 'package:flutter_golang_yt/widgets/button_widget.dart';
import 'package:flutter_golang_yt/widgets/text_field.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    bool _dataValidation() {
      if (nameController.text.trim() == '') {
        Get.snackbar("Task name", "Task name is empty");
        return false;
      } else if (detailController.text.trim() == '') {
        Get.snackbar("Task detail", "Task detail is empty");
        return false;
      }
      return true;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 100),
                    width: 150,
                    child: Image(image: AssetImage("assets/pencil.png"))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      Column(
                        children: [
                          Gap(MediaQuery.of(context).size.height / 4),
                          Center(
                            child: Container(
                                width: MediaQuery.of(context).size.width / 1.25,
                                child: TextFieldWidget(
                                  textController: nameController,
                                  borderRadius: 25,
                                  hintText: "Task name",
                                )),
                          ),
                          Gap(20),
                          Center(
                            child: Container(
                                width: MediaQuery.of(context).size.width / 1.25,
                                child: TextFieldWidget(
                                  textController: detailController,
                                  borderRadius: 20,
                                  hintText: "Task description",
                                  maxLine: 3,
                                )),
                          ),
                          Gap(20),
                          GestureDetector(
                            onTap: () {
                              if (_dataValidation()) {
                                Get.find<DataController>().postData(
                                    nameController.text.trim(),
                                    detailController.text.trim());
                                Get.to(() => AllTasks(),
                                    transition: Transition.fade,
                                    duration: const Duration(seconds: 2));
                              }
                            },
                            child: Center(
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.25,
                                  child: ButtonWidget(
                                    bgcolor: AppColors.mainColor,
                                    text: "Add",
                                    textcolor: Colors.white,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
  }
}
