import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/humburger_flow/trip_library_screen.dart';
import 'package:travel_app/widget/custom_button.dart';

import '../humburger_flow/stroyView.dart';
import '../humburger_flow/tourist_spot_screen.dart';

class SaveTripStep1 extends StatefulWidget {
  SaveTripStep1({super.key});

  @override
  State<SaveTripStep1> createState() => _SaveTripStep1State();
}

class _SaveTripStep1State extends State<SaveTripStep1> {
  final List dayWiseList1 = ['Day 1', 'Bonus Tourist Spot'];
  final List dayWiseList2 = ['Day 1', 'Day 2', 'Bonus Tourist Spot'];
  final List dayWiseList3 = ['Day 1', 'Day 2', 'Day 3', 'Bonus Tourist Spot'];
  final List dayWiseList4 = [
    'Day 1',
    'Day 2',
    'Day 3',
    'Day 4',
    'Bonus Tourist Spot'
  ];
  final List dayWiseList5 = [
    'Day 1',
    'Day 2',
    'Day 3',
    'Day 4',
    'Day 5',
    'Bonus Tourist Spot'
  ];
  final List dayWiseList6 = [
    'Day 1',
    'Day 2',
    'Day 3',
    'Day 4',
    'Day 5',
    'Day 6',
    'Bonus Tourist Spot'
  ];
  final List dayWiseList7 = [
    'Day 1',
    'Day 2',
    'Day 3',
    'Day 4',
    'Day 5',
    'Day 6',
    'Day 7',
    'Bonus Tourist Spot'
  ];

  // CollectionReference _collectionRef =
  // FirebaseFirestore.instance.collection('Aspired_trips');
  //
  // Future<void> getData() async {
  //   // Get docs from collection reference
  //   QuerySnapshot querySnapshot = await _collectionRef.get();
  //   // Get data from docs and convert map to List
  //   allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  //   setState(() {
  //   });
  //   print(allData);
  // }
  // List allData = [];

  String endplace = "";
  String type = "";
  int days = 0;
  void getTripData() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Plan_trip')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      endplace = profile.data()?['endtrip'];
      days = profile.data()?['totalDays'];
      type = profile.data()?['tripPlan'];

      print(endplace);
    }
    setState(() {
      print(endplace);
    });
  }

  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('tripstate')
      .doc('karnataka')
      .collection('tripcity')
      .doc('Bengaluru')
      .collection('touristSport');
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
    getTripData();
    getallData();
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (endplace != ConnectionState.waiting) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Trek to Sinhagad, $endplace Trip',
                style: TextStyle(fontSize: 18, color: black)),
            Text('Your travel sightseeing'),
            addVerticalSpace(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 1000,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: int.parse(days.toString()) + 1,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              // allData[i]['type'] == type ?
                              InkWell(
                                onTap: () {
                                  if (i != int.parse(days.toString()))
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StoryPageView()));
                                },
                                child: Row(
                                  children: [
                                    // allData[i]['type'] == type ?
                                    SizedBox(
                                        height: height(context) * 0.12,
                                        width: width(context) * 0.24,
                                        child: Image.network(
                                          allData[i]['image'],
                                          fit: BoxFit.fill,
                                        )),
                                   // : SizedBox(),
                                    addHorizontalySpace(10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // allData[i]['type'] == type ?
                                        Row(
                                          children: [
                                            if (int.parse(days.toString()) == 1)
                                              Text(
                                                dayWiseList1[i],
                                                style:
                                                    bodyText18w600(color: black),
                                              )
                                            else if (int.parse(days.toString()) ==
                                                2)
                                              Text(
                                                dayWiseList2[i],
                                                style:
                                                    bodyText18w600(color: black),
                                              )
                                            else if (int.parse(days.toString()) ==
                                                3)
                                              Text(
                                                dayWiseList3[i],
                                                style:
                                                    bodyText18w600(color: black),
                                              )
                                            else if (int.parse(days.toString()) ==
                                                4)
                                              Text(
                                                dayWiseList4[i],
                                                style:
                                                    bodyText18w600(color: black),
                                              )
                                            else if (int.parse(days.toString()) ==
                                                5)
                                              Text(
                                                dayWiseList5[i],
                                                style:
                                                    bodyText18w600(color: black),
                                              )
                                            else if (int.parse(days.toString()) ==
                                                6)
                                              Text(
                                                dayWiseList6[i],
                                                style:
                                                    bodyText18w600(color: black),
                                              )
                                            else
                                              Text(
                                                dayWiseList7[i],
                                                style:
                                                    bodyText18w600(color: black),
                                              ),
                                            addHorizontalySpace(8),

                                            // if (i == 4)
                                            //   InkWell(
                                            //     onTap: () {
                                            //       showDialogBox(context);
                                            //     },
                                            //     child: Icon(
                                            //       Icons.help,
                                            //       color: black.withOpacity(0.5),
                                            //     ),
                                            //   )
                                          ],
                                        ),
                                        // : SizedBox(),
                                        addVerticalSpace(6),
                                        // allData[i]['type'] == type ?
                                        SizedBox(
                                          width: width(context) * 0.56,
                                          child: Text(
                                            allData[i]['name'],
                                              // style:
                                              // bodyText18w600(color: black),
                                          ),
                                        ),
                                        // : SizedBox(),
                                        addVerticalSpace(6),
                                        // SizedBox(
                                        //   width: width(context) * 0.5,
                                        //   child: Text(
                                        //     allData[i]['about'],
                                        //     style: bodyText14normal(color: black),
                                        //   ),
                                        // ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // : SizedBox(),
                              // addVerticalSpace(15),
                              // allData[i]['type'] == type ?
                              const Divider(
                                height: 30,
                                thickness: 1,
                              ),
                                  // :  SizedBox()
                            ],
                          );
                        }),
                    //   child: ListView.builder(
                    //       padding: EdgeInsets.zero,
                    //       shrinkWrap: true,
                    //       itemCount: allData.length,
                    //       physics: const NeverScrollableScrollPhysics(),
                    //       itemBuilder: (ctx, i) {
                    //         return Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             allData[i]['type'] == type ?
                    //             Container(
                    //               height:  33 ,
                    //               width: 51,
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(10),
                    //                   image: DecorationImage(
                    //                       fit: BoxFit.fill,
                    //                       image: NetworkImage(
                    //                           allData[i]['image']))),
                    //               child: Column(
                    //                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //                 crossAxisAlignment: CrossAxisAlignment.start,
                    //                 children: [
                    //                   Row(
                    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                     children: [
                    //                       const Spacer(),
                    //                     ],
                    //                   ),
                    //                   addVerticalSpace(3),
                    //                   // Center(
                    //                   //   child: Icon(
                    //                   //     widget.contentType == 'video'
                    //                   //         ? Icons.play_circle_sharp
                    //                   //         : widget.contentType == 'audio'
                    //                   //         ? Icons.volume_up
                    //                   //         : widget.contentType == 'file'
                    //                   //         ? Icons.file_copy
                    //                   //         : null,
                    //                   //     color: white,
                    //                   //     size: 5.h,
                    //                   //   ),
                    //                   // )
                    //                 ],
                    //               ),
                    //             )
                    //                 : SizedBox(),
                    //             addVerticalSpace(10),
                    //             allData[i]['type'] == type ?
                    //             Text(
                    //               allData[i]['name'],
                    //               // style: kBodyText12wNormal(black),
                    //             )
                    //                 : SizedBox(),
                    //             addVerticalSpace(10),
                    //             allData[i]['type'] == type ?
                    //             Row(
                    //               children: [
                    //                 InkWell(
                    //                     onTap: () {
                    //                       // nextScreen(context,  profileMoreDetails(MP: allData[i],));
                    //                     },
                    //                     child: Text(
                    //                       'Description & more ',
                    //                       // style: kBodyText10wNormal(black),
                    //                     )),
                    //                 const Icon(
                    //                   Icons.arrow_forward,
                    //                   size: 15,
                    //                 )
                    //               ],
                    //             )
                    //                 : SizedBox(),
                    //             addVerticalSpace(10),
                    //             allData[i]['type'] == type ?
                    //             Divider()
                    //                 : SizedBox(),
                    //             addVerticalSpace(10),
                    //
                    //           ],
                    //         );
                    //       })
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return CircularProgressIndicator();
    }
  }

  showDialogBox(BuildContext context) {
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
                      height: height * 0.22,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Dummy Dialog',
                            style: bodyText16w600(color: black),
                          ),
                          Text(
                            'Your request has been sent. Alexander will be your trip friend, after she accepts your request ',
                            textAlign: TextAlign.center,
                            style: bodyText13normal(color: black),
                          ),
                          // addVerticalSpace(height * 0.07),
                          SizedBox(
                            width: width * 0.4,
                            child: CustomButton(
                                name: 'Okay',
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          )
                        ],
                      ));
                },
              ),
            ));
  }
}
