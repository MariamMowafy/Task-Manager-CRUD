import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_golang_yt/colors/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final Color bgcolor;
  final String text;
  final Color textcolor;
  const ButtonWidget(
      {Key? key,
      required this.bgcolor,
      required this.text,
      required this.textcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
          color: bgcolor, borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: textcolor),
        ),
      ),
    );
  }
}
