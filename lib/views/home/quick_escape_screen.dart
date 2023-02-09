import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/model/home_model.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_tab_indicator.dart';

class QuickEscapeScreen extends StatefulWidget {
  const QuickEscapeScreen({super.key});

  @override
  State<QuickEscapeScreen> createState() => _QuickEscapeScreenState();
}

class _QuickEscapeScreenState extends State<QuickEscapeScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    getData();
    super.initState();
  }
  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('Quick_Escape');

  Future<void> getData() async {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            title: 'Quick Escape',
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height(context) * 0.88,
              child: Column(
                children: [
                  addVerticalSpace(5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: Colors.grey,
                      controller: _tabController,
                      onTap: (value) {},
                      isScrollable: false,
                      indicator: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(50),
                          color: primary),
                      indicatorColor: primary,
                      labelColor: black,
                      labelStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                      unselectedLabelStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      tabs: const [
                        Tab(
                          text: 'Family',
                        ),
                        Tab(
                          text: 'Friends',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(controller: _tabController, children: [
                      SizedBox(
                        height: height(context) * 0.87,
                        child: ListView.builder(itemCount: allData.length,itemBuilder: (ctx, i) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context,MaterialPageRoute(builder: (context)=>));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10, bottom: 5),
                                    height: height(context) * 0.43,
                                    width: width(context) * 0.93,
                                    decoration: shadowDecoration(15, 2),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(15),
                                                    topRight: Radius.circular(15)),
                                                child: Image.network(allData[i]['imageUrl'])),
                                            Positioned(
                                                top: -5,
                                                right: -5,
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.bookmark_border,
                                                      color: white,
                                                    ))),
                                            Positioned(
                                                bottom: 0,
                                                left: 0,
                                                child: Container(
                                                  padding: EdgeInsets.only(left: 8),
                                                  height: height(context) * 0.064,
                                                  width: width(context),
                                                  color: black.withOpacity(0.4),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.calendar_month,
                                                            color: primary,
                                                            size: 20,
                                                          ),
                                                          addHorizontalySpace(5),
                                                          Text(
                                                            allData[i]['Date'],
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.w500,
                                                                color: white),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.location_on_rounded,
                                                            color: primary,
                                                            size: 20,
                                                          ),
                                                          addHorizontalySpace(5),
                                                          Text(
                                                            allData[i]['Chandigarh'],
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.w500,
                                                                color: white),
                                                          ),
                                                          addHorizontalySpace(width(context) * 0.3),
                                                          Container(
                                                            height: 20,
                                                            width: width(context) * 0.2,
                                                            decoration:
                                                            myFillBoxDecoration(0, primary, 4),
                                                            child: Center(
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    '         ',
                                                                    style: bodytext12Bold(color: black),
                                                                  ),
                                                                  Text(
                                                                    allData[i]['days'],
                                                                    style: bodytext12Bold(color: black),
                                                                  ),
                                                                  Text(
                                                                    ' Days',
                                                                    style: bodytext12Bold(color: black),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                allData[i]['festivalname'],
                                                style: bodyText22w700(color: black),
                                              ),
                                              Text(
                                                'Animal Husbandry dept & Stare Tourism dept',
                                                style: bodyText14normal(color: black),
                                              ),
                                              addVerticalSpace(11),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/cardrive.png',
                                                  ),
                                                  addHorizontalySpace(5),
                                                  SizedBox(
                                                    width: width(context) * 0.15,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                         allData[i]['CarTime'],
                                                          style: bodytext12Bold(color: black),
                                                        ),
                                                        Text(
                                                          ' hours',
                                                          style: bodytext12Bold(color: black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    '  |  ',
                                                    style: bodyText16normal(color: black),
                                                  ),
                                                  Image.asset(
                                                    'assets/images/train2.png',
                                                  ),
                                                  addHorizontalySpace(5),
                                                  SizedBox(
                                                    width: width(context) * 0.15,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          allData[i]['TrainTime'],
                                                          style: bodytext12Bold(color: black),
                                                        ),
                                                        Text(
                                                          ' hours',
                                                          style: bodytext12Bold(color: black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    '  |  ',
                                                    style: bodyText16normal(color: black),
                                                  ),
                                                  Image.asset(
                                                    'assets/images/flight.png',
                                                  ),
                                                  addHorizontalySpace(5),
                                                  SizedBox(
                                                    width: width(context) * 0.15,
                                                    child: Text(
                                                      'No direct flights',
                                                      style: bodytext12Bold(color: black),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: height(context) * 0.87,
                        child: ListView.builder(itemCount: allData.length,itemBuilder: (ctx, i) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context,MaterialPageRoute(builder: (context)=>));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10, bottom: 5),
                                    height: height(context) * 0.43,
                                    width: width(context) * 0.93,
                                    decoration: shadowDecoration(15, 2),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(15),
                                                    topRight: Radius.circular(15)),
                                                child: Image.network(allData[i]['imageUrl'])),
                                            Positioned(
                                                top: -5,
                                                right: -5,
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.bookmark_border,
                                                      color: white,
                                                    ))),
                                            Positioned(
                                                bottom: 0,
                                                left: 0,
                                                child: Container(
                                                  padding: EdgeInsets.only(left: 8),
                                                  height: height(context) * 0.064,
                                                  width: width(context),
                                                  color: black.withOpacity(0.4),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.calendar_month,
                                                            color: primary,
                                                            size: 20,
                                                          ),
                                                          addHorizontalySpace(5),
                                                          Text(
                                                            allData[i]['Date'],
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.w500,
                                                                color: white),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.location_on_rounded,
                                                            color: primary,
                                                            size: 20,
                                                          ),
                                                          addHorizontalySpace(5),
                                                          Text(
                                                            allData[i]['Chandigarh'],
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.w500,
                                                                color: white),
                                                          ),
                                                          addHorizontalySpace(width(context) * 0.3),
                                                          Container(
                                                            height: 20,
                                                            width: width(context) * 0.2,
                                                            decoration:
                                                            myFillBoxDecoration(0, primary, 4),
                                                            child: Center(
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    '        ',
                                                                    style: bodytext12Bold(color: black),
                                                                  ),
                                                                  Text(
                                                                    allData[i]['days'],
                                                                    style: bodytext12Bold(color: black),
                                                                  ),
                                                                  Text(
                                                                    ' Days',
                                                                    style: bodytext12Bold(color: black),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                allData[i]['festivalname'],
                                                style: bodyText22w700(color: black),
                                              ),
                                              Text(
                                                'Animal Husbandry dept & Stare Tourism dept',
                                                style: bodyText14normal(color: black),
                                              ),
                                              addVerticalSpace(11),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/cardrive.png',
                                                  ),
                                                  addHorizontalySpace(5),
                                                  SizedBox(
                                                    width: width(context) * 0.15,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          allData[i]['CarTime'],
                                                          style: bodytext12Bold(color: black),
                                                        ),
                                                        Text(
                                                          ' hours',
                                                          style: bodytext12Bold(color: black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    '  |  ',
                                                    style: bodyText16normal(color: black),
                                                  ),
                                                  Image.asset(
                                                    'assets/images/train2.png',
                                                  ),
                                                  addHorizontalySpace(5),
                                                  SizedBox(
                                                    width: width(context) * 0.15,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          allData[i]['TrainTime'],
                                                          style: bodytext12Bold(color: black),
                                                        ),
                                                        Text(
                                                          ' hours',
                                                          style: bodytext12Bold(color: black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    '  |  ',
                                                    style: bodyText16normal(color: black),
                                                  ),
                                                  Image.asset(
                                                    'assets/images/flight.png',
                                                  ),
                                                  addHorizontalySpace(5),
                                                  SizedBox(
                                                    width: width(context) * 0.15,
                                                    child: Text(
                                                      'No direct flights',
                                                      style: bodytext12Bold(color: black),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      )
                    ]),
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
// class QuickEscapeDataList extends StatefulWidget {
//   const QuickEscapeDataList({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<QuickEscapeDataList> createState() => _QuickEscapeDataListState();
// }
//
// class _QuickEscapeDataListState extends State<QuickEscapeDataList> {
//
//
//   @override
//   void initState() {
//     // getquickEscape();
//     getData();
//     super.initState();
//   }
//
//   // String cityname="";
//   // String festvalname = "";
//   // var date;
//   // var cartime = 1245325.65/150;
//   // var traintime = 1245325.65/300;
//   // void getquickEscape() async{
//   //   if (FirebaseAuth.instance.currentUser != null) {
//   //     var profile = await FirebaseFirestore.instance
//   //         .collection('Quick_Escape')
//   //         .doc('citys')
//   //         .get();
//   //     cityname = profile['Jaipur'];
//   //     festvalname = profile['festivalname'];
//   //     date = profile['Date'].toDate().toString().split(" ").first;
//   //   }
//   //   setState(() {
//   //   });
//   // }
//   CollectionReference _collectionRef =
//   FirebaseFirestore.instance.collection('Quick_Escape');
//
//   Future<void> getData() async {
//     // Get docs from collection reference
//     QuerySnapshot querySnapshot = await _collectionRef.get();
//     // Get data from docs and convert map to List
//     allData = querySnapshot.docs.map((doc) => doc.data()).toList();
//     setState(() {
//     });
//     print(allData);
//   }
//   List allData = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           InkWell(
//             onTap: () {
//               // Navigator.push(context,MaterialPageRoute(builder: (context)=>));
//             },
//             child: Container(
//               margin: EdgeInsets.only(top: 10, bottom: 5),
//               height: height(context) * 0.40,
//               width: width(context) * 0.93,
//               decoration: shadowDecoration(15, 2),
//               child: Column(
//                 children: [
//                   Stack(
//                     children: [
//                       ClipRRect(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(15),
//                               topRight: Radius.circular(15)),
//                           child: Image.asset('assets/images/beach.png')),
//                       Positioned(
//                           top: -5,
//                           right: -5,
//                           child: IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.bookmark_border,
//                                 color: white,
//                               ))),
//                       Positioned(
//                           bottom: 0,
//                           left: 0,
//                           child: Container(
//                             padding: EdgeInsets.only(left: 8),
//                             height: height(context) * 0.064,
//                             width: width(context),
//                             color: black.withOpacity(0.4),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.calendar_month,
//                                       color: primary,
//                                       size: 20,
//                                     ),
//                                     addHorizontalySpace(5),
//                                     Text(
//                                       '$date',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           color: white),
//                                     )
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.location_on_rounded,
//                                       color: primary,
//                                       size: 20,
//                                     ),
//                                     addHorizontalySpace(5),
//                                     Text(
//                                       '$cityname',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           color: white),
//                                     ),
//                                     addHorizontalySpace(width(context) * 0.3),
//                                     Container(
//                                       height: 20,
//                                       width: width(context) * 0.2,
//                                       decoration:
//                                       myFillBoxDecoration(0, primary, 4),
//                                       child: Center(
//                                         child: Text(
//                                           '2 days',
//                                           style: bodytext12Bold(color: black),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ))
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '$festvalname',
//                           style: bodyText22w700(color: black),
//                         ),
//                         Text(
//                           'Animal Husbandry dept & Stare Tourism dept',
//                           style: bodyText14normal(color: black),
//                         ),
//                         addVerticalSpace(11),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Image.asset(
//                               'assets/images/cardrive.png',
//                             ),
//                             addHorizontalySpace(5),
//                             SizedBox(
//                               width: width(context) * 0.15,
//                               child: Text(
//                                 '${cartime.toInt()} hours',
//                                 style: bodytext12Bold(color: black),
//                               ),
//                             ),
//                             Text(
//                               '  |  ',
//                               style: bodyText16normal(color: black),
//                             ),
//                             Image.asset(
//                               'assets/images/train2.png',
//                             ),
//                             addHorizontalySpace(5),
//                             SizedBox(
//                               width: width(context) * 0.15,
//                               child: Text(
//                                 '${traintime.toInt()} hours',
//                                 style: bodytext12Bold(color: black),
//                               ),
//                             ),
//                             Text(
//                               '  |  ',
//                               style: bodyText16normal(color: black),
//                             ),
//                             Image.asset(
//                               'assets/images/flight.png',
//                             ),
//                             addHorizontalySpace(5),
//                             SizedBox(
//                               width: width(context) * 0.15,
//                               child: Text(
//                                 'No direct flights',
//                                 style: bodytext12Bold(color: black),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
