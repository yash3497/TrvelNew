
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/edit_prima_screen/prima_trip_1to4_screen.dart';
import 'package:travel_app/views/publish%20your%20trip/step1.dart';
import 'package:travel_app/views/publish%20your%20trip/step2.dart';
import 'package:travel_app/widget/custom_appbar.dart';
import 'package:travel_app/widget/custom_button.dart';
import 'package:travel_app/widget/custom_dropdown_button.dart';
import 'package:travel_app/widget/custom_textfield.dart';

import '../../model/prima_profile_model.dart';

class PublishYourTripScreen extends StatefulWidget {
  const PublishYourTripScreen({Key? key}) : super(key: key);

  @override
  _PublishYourTripScreenState createState() => _PublishYourTripScreenState();
}


class _PublishYourTripScreenState extends State<PublishYourTripScreen> {


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
      SeeTripController.text = profile.data()?['who see trip'];
      InvitedMemberController.text = profile.data()?['Inveted Member'];
      MaxMemberController.text = profile.data()?['Max Member'];
      SpendsController.text = profile.data()?['Spends'];
      setState(() {});
    }
  }
  int _activeCurrentStep = 0;
  bool isChecked = false;
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();


  final TextEditingController SeeTripController = TextEditingController();
  final TextEditingController InvitedMemberController = TextEditingController();
  final TextEditingController MaxMemberController = TextEditingController();
  final TextEditingController SpendsController = TextEditingController();

  addStep3PublishTripDetails() async {
    // Call the user's CollectionReference to add a new user

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Trip_Plan")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "who see trip": seetripvalue,
      "Inveted Member": InvitedMembervalue,
      "Max Member": MaxMembervalue,
      "Spends": spendvalue,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  String InvitedMembervalue="All Members";
  String seetripvalue="Public";
  String MaxMembervalue="1";
  String spendvalue="For him/her self";

  List<Step> stepList() => [
        Step(
            state: _activeCurrentStep <= 0
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 0,
            label: const Text('Plan'),
            title: const SizedBox(),
            content: const Step1()),
        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 1,
            label: const Text('About Trip'),
            title: const SizedBox(),
            content: const Step2()),
        Step(
            state: StepState.complete,
            isActive: _activeCurrentStep >= 2,
            label: const Text('Members'),
            title: const SizedBox(),
            content: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width(context) * 0.42,
                      child: CustomDropDownButton(
                        value: seetripvalue,
                          itemList: ['Public', 'Private'],
                          controller: SeeTripController,
                          lableText: 'Who can see your trip'),
                    ),
                    SizedBox(
                      width: width(context) * 0.42,
                      child: CustomDropDownButton(
                        value: InvitedMembervalue,
                          itemList: ['All Members', 'Only Friends'],
                          controller: InvitedMemberController,
                          lableText: 'Members Type invited'),
                    )
                  ],
                ),
                addVerticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width(context) * 0.4,
                      child: CustomDropDownButton(itemList: [
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        '6',
                        '7',
                        '8',
                        '9',
                        '10'
                      ],
                         value: MaxMembervalue,
                        controller: MaxMemberController,
                          lableText: 'Max Members for Trip'),
                    ),
                    SizedBox(
                      width: width(context) * 0.44,
                      child: CustomDropDownButton(
                          itemList: ['For him/her self'],
                         value: spendvalue,
                        controller: SpendsController,
                          lableText: 'How spends distributed?'),
                    )
                  ],
                )
              ],
            )),
        Step(
            state: StepState.complete,
            isActive: _activeCurrentStep >= 3,
            label: const Text('Publish'),
            title: const SizedBox(),
            content: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  height: height(context) * 0.11,
                  width: width(context),
                  decoration: shadowDecoration(10, 2),
                  child: Center(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: myFillBoxDecoration(
                                  0, black.withOpacity(0.2), 50),
                            ),
                            const Text('Host'),
                          ],
                        ),
                        addHorizontalySpace(10),
                        Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: myFillBoxDecoration(0, primary, 50),
                              child: Icon(
                                Icons.person_add,
                                color: black,
                              ),
                            ),
                          ],
                        ),
                        addHorizontalySpace(8),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: [
                              Text(
                                'Trip Member',
                                style: bodyText14normal(
                                    color: black.withOpacity(0.4)),
                              ),
                              Text(
                                '1/6 added',
                                style: bodyText14w600(color: black),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                addVerticalSpace(15),
                SizedBox(
                  width: width(context) * 0.8,
                  child: Text(
                    'Recommend a travel agency to help in booking for this trip',
                    style: bodyText14w600(color: black),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: primary,
                        checkColor: black,
                        value: isChecked,
                        onChanged: (val) {
                          isChecked = val!;
                          setState(() {});
                        }),
                    Text('Create a chat room')
                  ],
                ),
                addVerticalSpace(height(context) * 0.2)
              ],
            ))
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(title: 'Plan and Publish your trip')),
      body: Theme(
        data: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: primary,
              ),
        ),
        child: Stepper(
          elevation: 0,
          margin: EdgeInsets.zero,

          controlsBuilder: (BuildContext context, ControlsDetails,
              {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
            return Column(
              children: [
                addVerticalSpace(40),
                _activeCurrentStep == 0 | 1 | 2
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              if (_activeCurrentStep == 0) {
                                return;
                              }
                              setState(() {
                                _activeCurrentStep -= 1;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: width(context) * 0.4,
                              decoration:
                                  myOutlineBoxDecoration(2, primary, 10),
                              child: const Center(
                                child: Text('Preview'),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          PrimaTrip1To4Screens()));
                            },
                            child: Container(
                              height: 40,
                              width: width(context) * 0.4,
                              decoration: myFillBoxDecoration(0, primary, 10),
                              child: const Center(
                                child: Text('Publish'),
                              ),
                            ),
                          )
                        ],
                      )
                    : CustomButton(
                        name: 'Save and Proceed',
                        onPressed: () {
                          if (_activeCurrentStep < (stepList().length - 1)) {

                            switch(_activeCurrentStep){
                              case 0:
                                  //addPublishTripDetails();
                                  addStep1PublishTripDetails();
                              break;
                              case 1: addStep2PublishTripDetails();
                              break;
                              case 2: addStep3PublishTripDetails();
                            }
                            setState(() {
                              _activeCurrentStep += 1;
                            });
                          }
                        }),
              ],
            );
          },
          type: StepperType.horizontal,
          currentStep: _activeCurrentStep,
          steps: stepList(),

          onStepContinue: () {
            if (_activeCurrentStep < (stepList().length - 1)) {
              setState(() {
                _activeCurrentStep += 1;
              });
            }
          },

          onStepCancel: () {
            if (_activeCurrentStep == 0) {
              return;
            }

            setState(() {
              _activeCurrentStep -= 1;
            });
          },
          // onStepTap allows to directly click on the particular step we want
          onStepTapped: (int index) {
            setState(() {
              _activeCurrentStep = index;
            });
          },
        ),
      ),
    );
  }
}
