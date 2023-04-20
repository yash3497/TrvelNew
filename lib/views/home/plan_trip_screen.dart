import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/humburger_flow/my_account/trip_intrest_screen.dart';
import 'package:travel_app/views/humburger_flow/trip_library_screen.dart';
import 'package:travel_app/widget/custom_appbar.dart';
import 'package:travel_app/widget/custom_button.dart';
import 'package:travel_app/widget/custom_textfield.dart';

import '../../widget/custom_dropdown_button.dart';
import '../save_your_trips/save_your_trips.dart';

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
  final TextEditingController enterdate = TextEditingController();

  String startplace = "";
  void getData() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('tripstate')
          .doc('karnataka')
          .collection('tripcity')
          .doc('Bengaluru')
          .get();
      startplace = profile.data()?['locality'];
    }
    setState(() {});
  }
  String _cityImage = "";
  void getCityImageData() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('tripstate')
          .doc('karnataka')
          .collection('tripcity')
          .doc('Bengaluru')
          .get();
      _cityImage = profile.data()?['cityImage'];
    }
    setState(() {});
  }
  setTripPlan() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Plan_trip")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "StartTrip": startplace,
      "tripPlan": _string1,
      "endtrip": _string2,
      "StartDate": startDate.text,
      "EndDate": endDate.text,
      "tripmode": _string3,
      "totalDays": totalDays,
      "mainualyEnterDays": enterdate.text,
      "Flexible":flexible,
      "BookingId":'',
      "cityImage":_cityImage
    });
    setState(() {});
  }

  @override
  void initState() {
    getData();
    getCityImageData();
    super.initState();
  }

  String _string1 = "Select";
  String _string2 = "Select";
  String _string3 = "Select";
  var firstDate;
  var secondDate;
  int totalDays = 0;
  bool dateEnable = true;
  bool? flexible ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(title: 'Let’s Plan your trip')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(12),
              height: height(context) * 0.88,
              width: width(context) * 0.95,
              decoration: shadowDecoration(15, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(height(context) * 0.04),
                  const Text('        Trip Start Location*'),
                  addVerticalSpace(10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                        height: 43,
                        width: width(context) * 0.85,
                        decoration:
                            myOutlineBoxDecoration(1, Colors.black26, 10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            '$startplace',
                            style: const TextStyle(fontSize: 15),
                          ),
                        )),
                  ),
                  addVerticalSpace(25),
                  Container(
                      child: const Text(
                          '       Type of Trip you are planning*  ')),
                  addVerticalSpace(10),

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 43,
                      width: width(context) * 0.85,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: const Border(
                                top: BorderSide(
                                  color: Colors.black26,
                                ),
                                bottom: BorderSide(color: Colors.black26),
                                right: BorderSide(color: Colors.black26),
                                left: BorderSide(color: Colors.black26))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(10),
                            value: _string1,
                            isExpanded: true,
                            onChanged: (newValue) {
                              setState(() {
                                _string1 = newValue!;
                              });
                            },
                            items: [
                              'Select',
                              'Family',
                              'Friends',
                              'Religious',
                              'Couple',
                              'Adventure',
                              'Unexplored',
                              'Escape alone'
                            ]
                                .map<DropdownMenuItem<String>>((String value) =>
                                    DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ))
                                .toList(),

                            // add extra sugar..
                            icon: const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Icon(
                                Icons.arrow_drop_down,
                              ),
                            ),
                            iconSize: 25,
                            iconEnabledColor: primary,
                            iconDisabledColor: black.withOpacity(0.7),
                            underline: const SizedBox(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // CustomDropDownButton(
                  //   lableText: ' Type of Trip you are planning* ',
                  //   itemList: items2,
                  // ),
                  addVerticalSpace(25),
                  Container(child: const Text('       Plan trip at  ')),
                  addVerticalSpace(10),

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 43,
                      width: width(context) * 0.85,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: const Border(
                                top: BorderSide(
                                  color: Colors.black26,
                                ),
                                bottom: BorderSide(color: Colors.black26),
                                right: BorderSide(color: Colors.black26),
                                left: BorderSide(color: Colors.black26))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(10),
                            value: _string2,
                            isExpanded: true,
                            onChanged: (newValue) {
                              setState(() {
                                _string2 = newValue!;
                              });
                            },
                            items: [
                              'Select',
                              'Tripura',
                              'Gujarat',
                              'Mizoram',
                              'Punjab',
                              'Uttar Pradesh',
                              'Uttrakhand',
                              'Karnataka',
                              'Madhya Pradesh',
                              'Odisha',
                              'Himachal Pradesh',
                              'Chandigarh',
                              'Delhi',
                              'Sikkim',
                              'Assam',
                              'Telangana',
                              'Rajasthan',
                              'Maharashtra',
                              'Andhra Pradesh',
                              'Haryana',
                              'Kerala',
                              'Madhya Pradesh',
                              'Manipur',
                              'Bihar',
                              'West Bengal',
                              'Jammu and Kashmir',
                              'Tamil Nadu'


                            ]
                                .map<DropdownMenuItem<String>>((String value) =>
                                    DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ))
                                .toList(),

                            // add extra sugar..
                            icon: const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Icon(
                                Icons.arrow_drop_down,
                              ),
                            ),
                            iconSize: 25,
                            iconEnabledColor: primary,
                            iconDisabledColor: black.withOpacity(0.7),
                            underline: const SizedBox(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // addVerticalSpace(25),
                  // CustomDropDownButton(
                  //   lableText: '  Plan Trip at  ',
                  //   itemList: items3,
                  // ),
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
                                Enable: dateEnable,
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
                                    firstDate = pickedDate.day;
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
                                Enable: dateEnable,
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
                                    secondDate = pickedDate.day;
                                    totalDays = secondDate - firstDate;
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
                              if (dateEnable)
                                Container(
                                  height: 30,
                                  width: width(context) * 0.25,
                                  decoration:
                                      myOutlineBoxDecoration(1, primary, 7),
                                  child: Center(
                                    child: Text('$totalDays Days'),
                                  ),
                                )
                              else
                                Container(
                                  height: 30,
                                  width: width(context) * 0.25,
                                  decoration:
                                      myOutlineBoxDecoration(1, primary, 7),
                                  child: Center(
                                    child: Text('${enterdate.text} Days'),
                                  ),
                                ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    dateEnable = !dateEnable;
                                    flexible = dateEnable;
                                  });
                                },
                                child: Container(
                                    height: 30,
                                    width: width(context) * 0.25,
                                    decoration: dateEnable
                                        ? myFillBoxDecoration(1, primary, 7)
                                        : myFillBoxDecoration(
                                            1, Colors.black12, 7),
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
                                        ),
                                      ],
                                    )),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 230, top: 5),
                    child: InkWell(
                        onTap: () {
                          KnowMore(context);
                        },
                        child: const Text(
                          'Know More',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        )),
                  ),
                  addVerticalSpace(15),
                  if (!dateEnable)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 20),
                      child: CustomTextFieldWidget(
                          controller: enterdate,
                          labelText: 'Please Enter Your Trip Days'),
                    ),
                  Container(
                    child: const Text('       Travel Mode'),
                  ),
                  addVerticalSpace(10),

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 43,
                      width: width(context) * 0.85,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: const Border(
                                top: BorderSide(
                                  color: Colors.black26,
                                ),
                                bottom: BorderSide(color: Colors.black26),
                                right: BorderSide(color: Colors.black26),
                                left: BorderSide(color: Colors.black26))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(10),
                            value: _string3,
                            isExpanded: true,
                            onChanged: (newValue) {
                              setState(() {
                                _string3 = newValue!;
                              });
                            },
                            items: ['Select', 'Bus', 'Train', 'Flight']
                                .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                          value: value,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ))
                                .toList(),

                            // add extra sugar..
                            icon: const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Icon(
                                Icons.arrow_drop_down,
                              ),
                            ),
                            iconSize: 25,
                            iconEnabledColor: primary,
                            iconDisabledColor: black.withOpacity(0.7),
                            underline: const SizedBox(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // CustomDropDownButton(
                  //
                  //   lableText: '  Travel Mode  ',
                  //   itemList: items3,
                  // ),
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
                  addVerticalSpace(50),
                  Center(
                    child: SizedBox(
                        height: 40,
                        width: width(context) * 0.5,
                        child: CustomButton(
                            name: 'Explore Trips',
                            onPressed: () {
                              setTripPlan();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          const SaveYourTripsScreen()));
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

  KnowMore(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              contentPadding: const EdgeInsets.all(6),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Builder(
                builder: (context) {
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;

                  return Container(
                    height: 200,
                    child: Center(
                      child: Column(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 10),
                              child: Center(
                                  child: Text(
                                "The dates taken here might require change as per travel seat availability and other convenience of the trip to the selected trip destination. If you wish our travel operator to suggest you a date for the trip, opt for I'm flexible. The number of days here suggested is for sightseeing and travel times will be added after the mode of travel is saved.",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.roboto().fontFamily),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ));
  }
}
