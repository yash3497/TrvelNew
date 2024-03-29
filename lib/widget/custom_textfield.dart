import 'package:flutter/material.dart';

import '../utils/constant.dart';

class CustomTextFieldWidget extends StatelessWidget {
  CustomTextFieldWidget(
      {required this.labelText, this.icon, this.onClick, this.controller, this.Enable});

  String labelText;
  Icon? icon;
  bool? Enable;
  TextEditingController? controller;
  VoidCallback? onClick;
  // void Function()? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * 0.05,
      width: width(context) * 0.95,
      child: Theme(
        data: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: primary,
              ),
        ),
        child: TextField(
          enabled: Enable ,
          onTap: onClick,
          controller: controller,
          // onChanged:(String){ onChanged},
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            suffixIcon: icon,
            labelText: labelText,
            // labelStyle: bodyText14w600(color: primarhy),

            focusColor: primary,

            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26, width: 1.0),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primary, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.only(
              left: 20,
            ),
          ),
        ),
      ),
    );
  }
}
