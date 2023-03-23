import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:travel_app/widget/custom_dropdown_button.dart';
import 'package:travel_app/widget/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../utils/constant.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        "Specify_type": _string1,
        "where_to": _string2,
        "Mode_of_travel": _string3,
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
        "Specify_type": _string1,
        "where_to": _string2,
        "Mode_of_travel": _string3,
        "start_date": endDateController.text,
        "End_date": endDateController.text,
        "Specify_trip_name": specitTripNameController.text,
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

String _string1 = "";
String _string2 = "";
String _string3 = "";
String _image = "";

final TextEditingController startLocationController = TextEditingController();
// final TextEditingController specifyTripTypeController = TextEditingController();
// final TextEditingController andTripController = TextEditingController();
// final TextEditingController modeTravelController = TextEditingController();
final TextEditingController startDateController = TextEditingController();
final TextEditingController endDateController = TextEditingController();
final TextEditingController specitTripNameController = TextEditingController();

class Step1 extends StatefulWidget {
  const Step1({super.key});

  @override
  State<Step1> createState() => _Step1State();
}

var b = 1;

class _Step1State extends State<Step1> {
  @override
  void initState() {
    getDetails();
    gethomelocation();
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
      _string1 = profile.data()?['Specify_type'];
      _string2 = profile.data()?['where_to'];
      _string3 = profile.data()?['Mode_of_travel'];
      startDateController.text = profile.data()?['start_date'];
      endDateController.text = profile.data()?['End_date'];
      specitTripNameController.text = profile.data()?['Specify_trip_name'];

      setState(() {});
    }
  }

  void gethomelocation() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      startLocationController.text = profile.data()?['locality'];

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
        addVerticalSpace(25),
        CustomDropDownButton(
            value: _string1,
            // controller: specitTripNameController,
            lableText: 'Specify tirp type',
            itemList: [
              'Adventure that thrills',
              'Fairs and Festiva',
              'Road trip'
            ]),
        addVerticalSpace(25),
        CustomDropDownButton(
            value: _string2,
            controller: specitTripNameController,
            lableText: 'Where to ?',
            itemList: [
              'jaipur',
              'Bengaluru ',
              'Vadodara',
              'Mysuru',
              'Jaisalmer',
              'Patan',
              'Thanjavur',
              'Kasargod',
              'Belgavi',
              'Ujjain'
            ]),
        addVerticalSpace(25),
        CustomDropDownButton(
            value: _string3,
            // controller: specitTripNameController,
            lableText: 'Mode of trip',
            itemList: ['Flight', 'Train', 'Road']),
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
              InkWell(
                  onTap: () {
                    pickUploadImage();
                  },
                  child: Text('Choose a cover pic')),
            ],
          ),
        ),
        addVerticalSpace(20),
        SizedBox(
          height: height(context) * 0.06,
          width: width(context) * 0.95,
          child: Theme(
            data: ThemeData(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: primary,
                  ),
            ),
            child: TextField(
              // minLines: 2,
              // maxLines: 2,
              controller: specitTripNameController,
              // onChanged:(String){ onChanged},
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Specify a trip name',
                // labelStyle: bodyText14w600(color: primarhy),

                focusColor: primary,

                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                // contentPadding:
                //     const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              ),
            ),
          ),
        ),
        addVerticalSpace(20),
      ],
    );
  }

  void pickUploadImage() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
        imageQuality: 75);
    Reference ref = FirebaseStorage.instance.ref().child('profileImg');

    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      print(value);
      setState(() {
        _image = value;
      });
    });
  }
}

class Step4 extends StatefulWidget {
  const Step4({Key? key}) : super(key: key);

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
