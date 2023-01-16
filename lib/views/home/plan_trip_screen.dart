import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/humburger_flow/my_account/trip_intrest_screen.dart';
import 'package:travel_app/views/humburger_flow/trip_library_screen.dart';
import 'package:travel_app/widget/custom_appbar.dart';
import 'package:travel_app/widget/custom_button.dart';
import 'package:travel_app/widget/custom_textfield.dart';

import '../../widget/custom_dropdown_button.dart';

class PlanATrip extends StatefulWidget {
  const PlanATrip({super.key});

  @override
  State<PlanATrip> createState() => _PlanATripState();
}

class _PlanATripState extends State<PlanATrip> {
  final items = ['Mumbai', 'Pune', 'indore', 'Jaipur', 'Baroda'];
  final items3 = ['Mumbai', 'Pune', 'indore', 'Jaipur', 'Baroda'];
  final items2 = [
    'Trip to the Beach',
    'Camping Trip',
    'Road Trip',
    'Group Tour',
    'Trip to the city'
  ];
  String? selectedValue;
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(title: 'Let’s Plan your trip')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(12),
              height: height(context) * 0.85,
              width: width(context) * 0.95,
              decoration: shadowDecoration(15, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(height(context) * 0.08),
                  CustomDropDownButton(
                    lableText: ' Trip Start Location* ',
                    itemList: items,
                  ),
                  addVerticalSpace(25),
                  CustomDropDownButton(
                    lableText: ' Type of Trip you are planning* ',
                    itemList: items2,
                  ),
                  addVerticalSpace(25),
                  CustomDropDownButton(
                    lableText: '  Plan Trip at  ',
                    itemList: items3,
                  ),
                  addVerticalSpace(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    lastDate: DateTime(2101),
                                    builder: (context, child) {
                                      return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme: ColorScheme.light(
                                              primary: primary,
                                            ),
                                          ),
                                          child: child!);
                                    },
                                  );
                                  if (pickedDate != null) {
                                    print(pickedDate);
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);

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
                                    lastDate: DateTime(2101),
                                    builder: (context, child) {
                                      return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme: ColorScheme.light(
                                              primary: primary,
                                            ),
                                          ),
                                          child: child!);
                                    },
                                  );
                                  if (pickedDate != null) {
                                    print(pickedDate);
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);

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
                        width: width(context) * 0.32,
                        decoration:
                            myFillBoxDecoration(0, black.withOpacity(0.05), 10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 30,
                                width: width(context) * 0.25,
                                decoration:
                                    myOutlineBoxDecoration(1, primary, 7),
                                child: const Center(
                                  child: Text('1 Day'),
                                ),
                              ),
                              Container(
                                  height: 30,
                                  width: width(context) * 0.25,
                                  decoration:
                                      myFillBoxDecoration(1, primary, 7),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color: black,
                                        size: 18,
                                      ),
                                      Text(
                                        'I’m Flexible',
                                        style: bodytext12Bold(color: black),
                                      )
                                    ],
                                  ))
                            ]),
                      )
                    ],
                  ),
                  addVerticalSpace(25),
                  CustomDropDownButton(
                    lableText: '  Travel Mode  ',
                    itemList: items3,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => YourTripInterest()));
                      },
                      child: Text(
                        'Your Trip Intrest',
                        style: TextStyle(
                            color: primary,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600),
                      )),
                  addVerticalSpace(height(context) * 0.1),
                  Center(
                    child: SizedBox(
                        height: 40,
                        width: width(context) * 0.5,
                        child: CustomButton(
                            name: 'Explore Trips',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => TripLibraryScreen()));
                            })),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
