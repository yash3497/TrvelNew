import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/views/aspired_trip/save_trip_and_get_qoute.dart';

import '../../model/home_model.dart';
import '../../utils/constant.dart';
import '../../widget/custom_button.dart';

class AspiredTripDetailsScreen extends StatefulWidget {
  const AspiredTripDetailsScreen({super.key});

  @override
  State<AspiredTripDetailsScreen> createState() => _AspiredTripDetailsScreenState();
}

class _AspiredTripDetailsScreenState extends State<AspiredTripDetailsScreen> {


  String _festival = "Rakhi";
  String _location = "Jodhpur";
  String _image = "https://images.unsplash.com/photo-1486870591958-9b9d0d1dda99?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80";
  String _date = "26 jan 2023";
  addupcomingDetails() async {
    // Call the user's CollectionReference to add a new user

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("upcomingtrip")
        .doc('VB5hR7xMSptSRiVGJ3YF')
        .set({
      'Festivalname': _festival,
      'location': _location,
      'image': _image,
      'date': _date,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height(context) * 0.42,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/beach.png'))),
                  child: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios)),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.bookmark_border_rounded,
                              color: white,
                            )),
                        Padding(
                          padding: EdgeInsets.only(right: 12.0, top: 10),
                          child: ImageIcon(
                              color: white,
                              AssetImage(
                                'assets/images/forward.png',
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trek to Karnala fort',
                        style: bodyText30W600(color: black),
                      ),
                      Text(
                        'Hills, Nature view, Monsoon',
                      ),
                      addVerticalSpace(8),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: primary,
                          ),
                          Text(
                            'Nagaur, Rajasthan',
                            style: bodyText16normal(color: black),
                          )
                        ],
                      ),
                      addVerticalSpace(10),
                      Text(
                        'About',
                        style: bodyText20w700(color: black),
                      ),
                      addVerticalSpace(5),
                      Text(
                        'Experience pleasant and cool environment with scenic beauty Nagaur Fair is the second biggest cattle fair in India held each year in Rajput town of Nagaur. more',
                        style: TextStyle(
                            height: 1.3,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: black),
                      ),
                      addVerticalSpace(15),
                      Text(
                        'Itinerary',
                        style: bodyText20w700(color: black),
                      ),
                      addVerticalSpace(15),
                      SizedBox(
                        height: height(context) * 0.48,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: itinerary.length,
                            itemBuilder: (ctx, i) {
                              return Column(
                                children: [
                                  Row(children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        margin: EdgeInsets.only(right: 8),
                                        height: height(context) * 0.13,
                                        width: width(context) * 0.37,
                                        child: Image.asset(
                                          itinerary[i]['img'],
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          itinerary[i]['name'],
                                          style: bodyText16w600(color: black),
                                        ),
                                        addVerticalSpace(5),
                                        SizedBox(
                                          width: width(context) * 0.55,
                                          child: Text(
                                            'The Krishna Matha was founded by the Vaishnavite saint Jagadguru Shri Madhvacharya in the 13th century.',
                                            style: TextStyle(height: 1.3),
                                          ),
                                        )
                                      ],
                                    )
                                  ]),
                                  addVerticalSpace(15)
                                ],
                              );
                            }),
                      ),
                      addVerticalSpace(8),
                      Text(
                        'Suitable for',
                        style: bodyText20w700(color: black),
                      ),
                      addVerticalSpace(2),
                      Text(
                        'Family/friends and Group/Friends',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: black),
                      ),
                      addVerticalSpace(15),
                      Text(
                        'Includes',
                        style: bodyText20w700(color: black),
                      ),
                      addVerticalSpace(4),
                      Text(
                        'Tsdgsgs sgSBGh sgsag skjg fhsjkg sdgsg sdjg sgsbkgbksg eg seg sekg eg ef,jaf a,jf ajf akagksgl skglse egkksg lisglisg selig seg ',
                        style: TextStyle(
                            height: 1.3,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: black),
                      ),
                      addVerticalSpace(15),
                      Text(
                        'Expected Budget',
                        style: bodyText20w700(color: black),
                      ),
                      const Text(
                        '₹5,000/person',
                      ),
                      addVerticalSpace(height(context) * 0.1),
                      addVerticalSpace(8)
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 9,
            child: CustomButton(
                name: 'Save trip and do booking',
                onPressed: () {
                  addupcomingDetails();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SaveTripAndGetQuote(
                                message1:
                                    'Our travel partners may request you change in date as per travel seat reservations',
                                message2:
                                    'Expected budget: 5000 per person (Cost includes hotel booking and travel booking)',
                              )));
                }),
          )
        ],
      ),
    );
  }
}
