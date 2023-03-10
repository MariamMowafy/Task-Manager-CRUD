import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../colors/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final double? borderRadius;
  final int? maxLine;
  const TextFieldWidget(
      {Key? key,
      required this.textController,
      required this.hintText,
      this.borderRadius = 30,
      this.maxLine = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: true,
      maxLines: maxLine,
      controller: textController,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.textHolder,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: const BorderSide(color: Colors.white, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: const BorderSide(color: Colors.white, width: 1),
          )),
    );
  }
}
