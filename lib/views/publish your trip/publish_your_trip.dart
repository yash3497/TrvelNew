
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/edit_prima_screen/prima_trip_1to4_screen.dart';
import 'package:travel_app/views/humburger_flow/prima_profile/prima_profile_screen.dart';
import 'package:travel_app/views/publish%20your%20trip/step1.dart';
import 'package:travel_app/views/publish%20your%20trip/step2.dart';
import 'package:travel_app/widget/custom_appbar.dart';
import 'package:travel_app/widget/custom_button.dart';
import 'package:travel_app/widget/custom_dropdown_button.dart';
import 'package:travel_app/widget/custom_textfield.dart';

import '../../model/prima_profile_model.dart';
import '../humburger_flow/my_account/my_trip_friends.dart';

class PublishYourTripScreen extends StatefulWidget {
  const PublishYourTripScreen({Key? key}) : super(key: key);

  @override
  _PublishYourTripScreenState createState() => _PublishYourTripScreenState();
}


class _PublishYourTripScreenState extends State<PublishYourTripScreen> {


  @override
  void initState() {
    // getDetails();
    getdata();
    getPrimaDeatials();
    super.initState();
  }
  // final List<String> tripLocation = ['Pune', 'Mumbai', 'chennai'];
  String image = "";
  void getPrimaDeatials() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('primaAccount')
          .doc('profile')
          .get();
      image = profile.data()?['imageUrl'];
      setState(() {});
    }
  }
  String member = "";
  String maxmember = "";
  void getdata() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Prima_Trip_Plan")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      member = profile.data()?['Inveted Member'];
      maxmember = profile.data()?['Max_Member'];
    }
    setState(() {
    });
  }
  int _activeCurrentStep = 0;
  bool isChecked = true;
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
        .collection("Prima_Trip_Plan")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "who see trip": seetripvalue,
      "Inveted Member": InvitedMembervalue,
      "Max_Member": MaxMembervalue,
      "Spends": spendvalue,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  String InvitedMembervalue="Public";
  String seetripvalue="Select";
  String MaxMembervalue="Select";
  String spendvalue="Select";

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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        child: const Text(
                            '     Who can see your trip  ')),
                    Container(
                        child: const Text(
                            '                      Members Type invited  ')),
                  ],
                ),
                addVerticalSpace(5),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SizedBox(
                        height: 43,
                        width: width(context) * 0.42,
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
                              value: InvitedMembervalue,
                              isExpanded: true,
                              onChanged: (newValue) {
                                setState(() {
                                  InvitedMembervalue = newValue!;
                                });
                              },
                              items: [
                                'Public',
                                'My Trip friends'
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: 43,
                        width: width(context) * 0.42,
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
                              value: seetripvalue,
                              isExpanded: true,
                              onChanged: (newValue) {
                                setState(() {
                                  seetripvalue = newValue!;
                                });
                              },
                              items: [
                                'Select',
                                'All type',
                                'Only Men',
                                'Only Women'
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
                  ],
                ),
                // SizedBox(
                //   width: width(context) * 0.42,
                //   child: CustomDropDownButton(
                //       value: seetripvalue,
                //       itemList: ['Public', 'My Trip friends'],
                //       controller: SeeTripController,
                //       lableText: 'Who can see your trip'),
                // ),
                // SizedBox(
                //   width: width(context) * 0.42,
                //   child: CustomDropDownButton(
                //       value: InvitedMembervalue,
                //       itemList: ['All type', ' Only Men','Only Women'],
                //       controller: InvitedMemberController,
                //       lableText: 'Members Type invited'),
                // )

              ],
            ),
            addVerticalSpace(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        child: const Text(
                            '     Max Members for Trip  ')),
                    Container(
                        child: const Text(
                            '                      How spends distributed?  ')),
                  ],
                ),
                addVerticalSpace(5),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SizedBox(
                        height: 43,
                        width: width(context) * 0.42,
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
                              value: MaxMembervalue,
                              isExpanded: true,
                              onChanged: (newValue) {
                                setState(() {
                                  MaxMembervalue = newValue!;
                                });
                              },
                              items: [
                                'Select',
                                '1',
                                '2',
                                '3',
                                '4',
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: 43,
                        width: width(context) * 0.42,
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
                              value: spendvalue,
                              isExpanded: true,
                              onChanged: (newValue) {
                                setState(() {
                                  spendvalue = newValue!;
                                });
                              },
                              items: [
                                'Select',
                                'For him/her self',
                                ' Trip host',
                                'Except trip host'
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
                  ],
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     // SizedBox(
            //     //   width: width(context) * 0.4,
            //     //   child: CustomDropDownButton(itemList: [
            //     //     '1',
            //     //     '2',
            //     //     '3',
            //     //     '4',
            //     //     '5',
            //     //     '6',
            //     //     '7',
            //     //     '8',
            //     //     '9',
            //     //     '10'
            //     //   ],
            //     //       value: MaxMembervalue,
            //     //       controller: MaxMemberController,
            //     //       lableText: 'Max Members for Trip'),
            //     // ),
            //     // SizedBox(
            //     //   width: width(context) * 0.44,
            //     //   child: CustomDropDownButton(
            //     //       itemList: ['For him/her self',' Trip host','Except trip host'],
            //     //       value: spendvalue,
            //     //       controller: SpendsController,
            //     //       lableText: 'How spends distributed?'),
            //     // )
            //   ],
            // )
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
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: image == ""
                                ? BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/images/prima3.png')))
                                : BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill, image: NetworkImage(image))),

                            // myFillBoxDecoration(
                            //     0, black.withOpacity(0.2), 50),
                          ),
                        ),
                         Text('Host'),
                      ],
                    ),
                    addHorizontalySpace(10),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyTripFriendsScreen(title: 'added',)));
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: myFillBoxDecoration(0, primary, 50),
                            child: Icon(
                              Icons.person_add,
                              color: black,
                            ),
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
                            '0/ ${maxmember} added',
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
            if(member == "Public")
            SizedBox(
              width: width(context) * 0.8,
              child: Text(
               'Others can see your profile, and this trip and request you to join.',
                style: bodyText14w600(color: black),
              ),
            )else
            SizedBox(
              width: width(context) * 0.8,
              child: Text(
                'Your trip friends can see your profile, and this trip and request you to join.',
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
                    // InkWell(
                    //   onTap: () {
                    //     if (_activeCurrentStep == 0) {
                    //       return;
                    //     }
                    //     setState(() {
                    //       _activeCurrentStep -= 1;
                    //     });
                    //   },
                    //   child: Container(
                    //     height: 40,
                    //     width: width(context) * 0.4,
                    //     decoration:
                    //     myOutlineBoxDecoration(2, primary, 10),
                    //     child: const Center(
                    //       child: Text('Preview'),
                    //     ),
                    //   ),
                    // ),
                    addHorizontalySpace(50),
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
                            addPublishTripDetails();
                          //   addStep1PublishTripDetails();
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
