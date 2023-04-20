import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/views/edit_prima_screen/trip_members_screen.dart';
import 'package:travel_app/widget/custom_button.dart';

import '../../utils/constant.dart';
import 'entertainment_of_trip.dart';

class EntertainmentTab extends StatefulWidget {
  EntertainmentTab({super.key});

  @override
  State<EntertainmentTab> createState() => _EntertainmentTabState();
}

class _EntertainmentTabState extends State<EntertainmentTab> {
  final List picList = [
    {'img': 'assets/images/ent1.png', 'name': 'Hiking'},
    {'img': 'assets/images/ent2.png', 'name': 'Camping'},
    {'img': 'assets/images/ent3.png', 'name': 'Cooking'},
    {'img': 'assets/images/ent4.png', 'name': 'Singing'},
  ];

  String tripName = "";
  String meetTime = "";
  String meetPlace = "";
  List entertainment = [];
  void getdata() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Prima_Trip_Plan")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      tripName = profile.data()?['Specify_trip_name'];
      meetTime = profile.data()?['meetingTime'];
      meetPlace = profile.data()?['meetingPlace'];
      entertainment = profile.data()?['Entertainment'];
    }
    setState(() {
    });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addVerticalSpace(10),
          Row(
            children: [
              Text(
                'Entertainment',
                style: bodyText16w600(color: black),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => EntertainmentOfTripScreen()));
                },
                child: Icon(
                  Icons.add_circle,
                  color: primary,
                  size: 30,
                ),
              )
            ],
          ),
          addVerticalSpace(15),
          // if(entertainment.isEmpty)
          //   Center(
          //     child: Text('You not have any Entertainment. So please Select your Entertainment right side.'),
          //   )else
          SizedBox(
            height: height(context) * 0.16,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: entertainment.length,
                itemBuilder: (ctx, i) {
                  return Column(
                    children: [
                      SizedBox(
                        height: height(context) * 0.13,
                        width: width(context) * 0.35,
                        child: Image.asset(
                          picList[i]['img'],
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(entertainment[i])
                    ],
                  );
                }),
          ),
          addVerticalSpace(15),
          Center(
            child: Container(
              height: height(context) * 0.3,
              width: width(context) * 0.65,
              decoration: myFillBoxDecoration(0, black.withOpacity(0.1), 10),
              child: const Center(
                child: Icon(
                  Icons.image,
                  size: 50,
                ),
              ),
            ),
          ),
          addVerticalSpace(20),
          Text(
            'Meeting point & Time',
            style: bodyText14w600(color: black),
          ),
          Row(
            children: [
              Column(
                children: [

                  SizedBox(
                    width: width(context) * 0.67,
                    child: Text(
                        '$meetPlace'),
                  ),
                  SizedBox(
                    width: width(context) * 0.67,
                    child: Text(
                        '$meetTime'),
                  ),
                  // addVerticalSpace(height(context) * 0.1)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                    height: 40,
                    width: 100,
                    child: CustomButton(name: 'Request to Join', onPressed: (){
                      meetingDialog(context);
                    })),
              ),
            ],
          ),

          addVerticalSpace(50)
        ],
      ),
    );
  }

    meetingDialog(BuildContext context){
      final TextEditingController MeetingPlaceController = TextEditingController();
      final TextEditingController MeetingTimeController = TextEditingController();
      updatemeeting() async {
        // Call the user's CollectionReference to add a new user
        CollectionReference users = FirebaseFirestore.instance.collection('users');
        users
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("Prima_Trip_Plan")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          "meetingPlace": MeetingPlaceController.text,
          "meetingTime": MeetingTimeController.text

        })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      }
      var persentTime1 = DateTime.now().year;
      var persentTime2 = DateTime.now().month;
      var persentTime3 = DateTime.now().day;
      var persentTime4 = DateTime.now().hour;
      var persentTime5 = DateTime.now().minute;
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            contentPadding: const EdgeInsets.all(6),
            shape: const RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(10.0))),
            content: Builder(
              builder: (context) {
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;

                return Container(
                    height: height * 0.34,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Text(
                              '$tripName',
                              style: bodyText16w600(color: black),
                            ),
                            addHorizontalySpace(15),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8.0),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    size: 30,
                                  )),
                            )
                          ],
                        ),
                        Center(child: Text('$persentTime3/$persentTime2/$persentTime1    $persentTime4:$persentTime5')),
                        addVerticalSpace(25),
                        Text(
                          'Meeting point and time',
                          style: bodyText14w600(color: black),
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.4,
                              child: TextField(
                                controller: MeetingPlaceController,
                                decoration: InputDecoration(
                                    hintText:
                                    'Address of meeting point*',
                                    hintStyle: bodyText12Small(
                                        color: black)),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.25,
                              child: TextField(
                                controller: MeetingTimeController,
                                decoration: InputDecoration(
                                    hintText: 'Time*',
                                    hintStyle: bodyText12Small(
                                        color: black)),
                              ),
                            ),
                          ],
                        ),
                        addVerticalSpace(height * 0.05),
                        Center(
                          child: SizedBox(
                            width: width * 0.4,
                            child: CustomButton(
                                name: 'Save',
                                onPressed: () {
                                  updatemeeting();
                                  Navigator.pop(context);
                                }),
                          ),
                        )
                      ],
                    ));
              },
            ),
          ));
    }
}
