
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/views/publish%20your%20trip/add_tourist_spots.dart';

import '../../model/prima_profile_model.dart';
import '../../utils/constant.dart';
import '../../widget/custom_dropdown_button.dart';
import '../../widget/custom_textfield.dart';

addPublishTripDetails() async {
  // Call the user's CollectionReference to add a new user
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  users
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("Trip_Plan")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .set({
    "Uid": FirebaseAuth.instance.currentUser!.uid,
    "Star_Trip_location": startLocationController.text,
    "Specify_type": specifyTripTypeController.text,
    "where_to": andTripController.text,
    "Mode_of_travel": modeTravelController.text,
    "start_date": endDateController.text,
    "End_date": endDateController.text,
    "Specify_trip_name": specitTripNameController.text,
  })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

addStep1PublishTripDetails() async {
  // Call the user's CollectionReference to add a new user

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  users
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("Trip_Plan")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
    "Star_Trip_location": startLocationController.text,
    "Specify_type": specifyTripTypeController.text,
    "where_to": andTripController.text,
    "Mode_of_travel": modeTravelController.text,
    "start_date": endDateController.text,
    "End_date": endDateController.text,
    "Specify_trip_name": specitTripNameController.text,
  })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}



final TextEditingController startLocationController = TextEditingController();
final TextEditingController specifyTripTypeController = TextEditingController();
final TextEditingController andTripController = TextEditingController();
final TextEditingController modeTravelController = TextEditingController();
final TextEditingController startDateController = TextEditingController();
final TextEditingController endDateController = TextEditingController();
final TextEditingController specitTripNameController = TextEditingController();

class Step1 extends StatefulWidget {
  const Step1({super.key});

  @override
  State<Step1> createState() => _Step1State();
}

 var b=1;


class _Step1State extends State<Step1> {

  @override
  void initState() {
    getDetails();
    super.initState();
  }
 // final List<String> tripLocation = ['Pune', 'Mumbai', 'chennai'];
  void getDetails() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Trip_Plan')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      startLocationController.text = profile.data()?['Star_Trip_location'];
      specifyTripTypeController.text = profile.data()?['Specify_type'];
      andTripController.text = profile.data()?['where_to'];
      modeTravelController.text = profile.data()?['Mode_of_travel'];
      startDateController.text = profile.data()?['start_date'];
      endDateController.text = profile.data()?['End_date'];
      specitTripNameController.text = profile.data()?['Specify_trip_name'];

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFieldWidget(
          //itemList: tripLocation,
          controller: startLocationController,
          labelText: 'Trip Start Location',
        ),
        addVerticalSpace(20),
        CustomTextFieldWidget(
         // itemList: tripLocation,
          controller: specifyTripTypeController,
          labelText: 'Specify trip Type',
        ),
        addVerticalSpace(20),
        CustomTextFieldWidget(
            controller: andTripController,
            labelText: 'Where to?'),
        addVerticalSpace(20),
        CustomTextFieldWidget(
            //itemList: ['Mumbai', 'Pune', 'Banglore'],
          controller: modeTravelController,
            labelText: '  Mode of Travel  '),
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
                      controller: startDateController,
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
                            startDateController.text = formattedDate;
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
                      controller: endDateController,
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
                              b = pickedDate.day;
                          setState(() {
                            endDateController.text = formattedDate;
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
                      '$b',
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
        CustomTextFieldWidget(
            controller: specitTripNameController,
            labelText: 'Specify a trip name',
                 ),
        addVerticalSpace(20),
      ],
    );
  }
}
