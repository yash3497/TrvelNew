import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/views/edit_prima_screen/trip_members_screen.dart';

import '../../utils/constant.dart';
import '../humburger_flow/tourist_spot_screen.dart';
import '../humburger_flow/trip_map_screen.dart';

class PlaceVisitingScreen extends StatefulWidget {
  PlaceVisitingScreen({super.key});

  @override
  State<PlaceVisitingScreen> createState() => _PlaceVisitingScreenState();
}

class _PlaceVisitingScreenState extends State<PlaceVisitingScreen> {
  final List dayWiseList = [
    'Day 1',
    '',
    'Day 2',
    '',
    'Day 3',
    '',
    'Day 4',
    '',
    'Day 5',
    '',
    'Day 6',
    '',
    'Day 7',
    '',
    'Day 8',
    '',
    'Day 9',
    '',
    'Day 10',
    '',
    'Day 11',
    '',
    'Day 12',
    '',
    'Day 13',
    '',
    'Day 14',
    '',
    'Day 15'
  ];

  final List saveTripList = [
    {'img': 'assets/images/road.png', 'name': 'Road'},
    {'img': 'assets/images/train.png', 'name': 'Train'},
    {'img': 'assets/images/plane.png', 'name': 'Flight'},
  ];
  int currentIndex = 0;

  String travelMode = "";

  void getdata() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Prima_Trip_Plan")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      travelMode = profile.data()?['Mode_of_travel'];
    }
    setState(() {
    });
  }

  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('users')
  .doc(FirebaseAuth.instance.currentUser!.uid)
  .collection('Prima_Trip_Plan')
  .doc(FirebaseAuth.instance.currentUser!.uid)
  .collection('tourisprot');
  Future<void> getallData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    // Get data from docs and convert map to List
    allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    setState(() {
    });
    print(allData);
  }
  List allData = [];


  @override
  void initState() {
    getdata();
    getallData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //     height: height(context) * 0.7,
            //     child: ListView.builder(
            //         physics: NeverScrollableScrollPhysics(),
            //         padding: EdgeInsets.zero,
            //         itemCount: dayWiseList.length,
            //         itemBuilder: (context, i) {
            //           return Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   // Text(
            //                   //   dayWiseList[i],
            //                   //   style: bodyText20w700(color: black),
            //                   // ),
            //                 ],
            //               ),
            //               // Text('Monday, Feb 14 2022'),
            //               addVerticalSpace(10),

            //               // const Divider(
            //               //   thickness: 1,
            //               // ),
            //             ],
            //           );
            //         })),
            SizedBox(
              height: 500,
              width: width(context) * 0.95,
              child:  ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (ctx, i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TouristSpotsScreen(MP: allData[i],)));
                          },
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dayWiseList[i]
                                    ,
                                    style: bodyText18w600(color: black),
                                  ),
                                  addVerticalSpace(10),
                                  SizedBox(
                                    width: width(context)*0.50,
                                    child: Text(
                                      allData[i]['TouristSportName'],
                                      style: bodyText18w600(color: black),
                                    ),
                                  ),
                                  addVerticalSpace(5),
                                  // Text('Religious,Culture'),
                                  // addVerticalSpace(3),
                                  SizedBox(
                                    width: width(context) * 0.56,
                                    child: Text(
                                      allData[i]['touristDes'],
                                      style: bodyText12Small(
                                          spacing: 1.4, color: black),
                                    ),
                                  ),
                                  addVerticalSpace(5),
                                  // Row(
                                  //   children: [
                                  //     Text(
                                  //       'Learn more on ',
                                  //       style: bodytext12Bold(color: black),
                                  //     ),
                                  //     Image.asset('assets/images/google.png')
                                  //   ],
                                  // )
                                ],
                              ),
                              addHorizontalySpace(10),
                              SizedBox(
                                // width: width(context) * 0.23,
                                  height: height(context) * 0.12,
                                  child: Image.network(
                                    allData[i]['TouristSportImage'],
                                    fit: BoxFit.fill,
                                  ))
                            ],
                          ),
                        ),
                        addVerticalSpace(30)
                      ],
                    );
                  }
              ),
            ),

            addVerticalSpace(15),
            Text(
              'How are we going Mumbai to Sinhgad Fort?',
              style: bodyText16w600(color: black),
            ),
            addVerticalSpace(5),
            Text(
              '$travelMode',
              style: bodyText14normal(color: black),
            )

            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: SizedBox(
            //     height: height(context) * 0.12,
            //     child: ListView.builder(
            //         itemCount: saveTripList.length,
            //         scrollDirection: Axis.horizontal,
            //         padding: EdgeInsets.zero,
            //         physics: const NeverScrollableScrollPhysics(),
            //         itemBuilder: (ctx, i) {
            //           return InkWell(
            //             onTap: () {
            //               currentIndex = i;
            //               setState(() {});
            //             },
            //             child: Column(
            //               children: [
            //                 Container(
            //                   height: height(context) * 0.08,
            //                   width: width(context) * 0.2,
            //                   padding: EdgeInsets.all(5),
            //                   margin: EdgeInsets.all(15),
            //                   decoration: currentIndex == i
            //                       ? myFillBoxDecoration(0, primary, 10)
            //                       : myFillBoxDecoration(0, white, 10),
            //                   child: Column(
            //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                     children: [
            //                       SizedBox(
            //                         height: 25,
            //                         child: Image.asset(
            //                           saveTripList[i]['img'],
            //                           color: currentIndex == i ? white : primary,
            //                         ),
            //                       ),
            //                       addVerticalSpace(5),
            //                       Text(
            //                         saveTripList[i]['name'],
            //                         style: bodyText16normal(color: black),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           );
            //         }),
            //   ),
            // ),
            ,
            addVerticalSpace(height(context) * 0.09)
          ],
        ),
      ),
    );
  }
}
