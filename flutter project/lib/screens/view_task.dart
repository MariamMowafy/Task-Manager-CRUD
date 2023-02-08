import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_golang_yt/controllers/data_controller.dart';
import 'package:flutter_golang_yt/screens/all_tasks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../colors/app_colors.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field.dart';

class ViewTask extends StatelessWidget {
  final int id;
  const ViewTask({Key? key, required this.id}) : super(key: key);
  _loadSingleTask() async {
    await Get.find<DataController>().getSingleData(id.toString());
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    _loadSingleTask();
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder<DataController>(builder: (controller) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      padding: EdgeInsets.only(top: 10, right: 5),
                      height: MediaQuery.of(context).size.height / 4,
                      child: Image(image: AssetImage("assets/fly.png"))),
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
                              Gap(MediaQuery.of(context).size.height / 12),
                              Text(
                                "You are doing great!",
                                style: TextStyle(
                                    color: AppColors.smallTextColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Gap(30),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.25,
                                child: Text(
                                  "Title",
                                  style: TextStyle(
                                      color: AppColors.smallTextColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Gap(10),
                              Center(
                                child: Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.25,
                                    height:
                                        MediaQuery.of(context).size.height / 22,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColors.textHolder),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SingleChildScrollView(
                                          child: Text(
                                            '${controller.singleData["task_name"]}',
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                              Gap(20),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.25,
                                child: Text(
                                  "Description",
                                  style: TextStyle(
                                      color: AppColors.smallTextColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Gap(10),
                              Center(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2.75,
                                  width:
                                      MediaQuery.of(context).size.width / 1.25,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: AppColors.textHolder),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SingleChildScrollView(
                                        child: Text(
                                          '${controller.singleData["task_detail"]}',
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Gap(20),
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
          );
        }));
  }
}
