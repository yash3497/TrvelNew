import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/views/publish%20your%20trip/add_tourist_spots.dart';

import '../../model/prima_profile_model.dart';
import '../../utils/constant.dart';
import '../../widget/custom_dropdown_button.dart';
import '../../widget/custom_textfield.dart';

class Step1 extends StatefulWidget {
  const Step1({super.key});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  final List<String> tripLocation = ['Pune', 'Mumbai', 'chennai'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropDownButton(
          itemList: tripLocation,
          lableText: 'Trip Start Location',
        ),
        addVerticalSpace(20),
        CustomDropDownButton(
          itemList: tripLocation,
          lableText: 'Specify trip Type',
        ),
        addVerticalSpace(20),
        CustomTextFieldWidget(labelText: 'Where to?'),
        addVerticalSpace(20),
        CustomDropDownButton(
            itemList: ['Mumbai', 'Pune', 'Banglore'],
            lableText: '  Mode of Travel  '),
        addVerticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                    height: 40,
                    width: width(context) * 0.5,
                    child: CustomTextFieldWidget(
                      controller: startDate,
                      labelText: 'Start Date',
                      onClick: () async {
                        var pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);

                          setState(() {
                            startDate.text = formattedDate;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      icon: const Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.black,
                      ),
                    )),
                addVerticalSpace(15),
                SizedBox(
                    width: width(context) * 0.5,
                    height: 40,
                    child: CustomTextFieldWidget(
                      controller: endDate,
                      labelText: 'End Date',
                      onClick: () async {
                        var pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);

                          setState(() {
                            endDate.text = formattedDate;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      icon: const Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
            Container(
              height: height(context) * 0.12,
              width: width(context) * 0.25,
              decoration: myOutlineBoxDecoration(2, primary, 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '7',
                      style: bodyText30W600(color: black),
                    ),
                    Text(
                      'Days',
                      style: bodyText16normal(color: black),
                    )
                  ]),
            )
          ],
        ),
        addVerticalSpace(15),
        Container(
          height: height(context) * 0.05,
          width: width(context) * 0.55,
          decoration: myFillBoxDecoration(0, black.withOpacity(0.05), 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.image,
                color: black.withOpacity(0.2),
              ),
              Text('Choose a cover pic'),
            ],
          ),
        ),
        addVerticalSpace(20),
        CustomTextFieldWidget(labelText: 'Specify a trip name'),
        addVerticalSpace(20),
      ],
    );
  }
}
