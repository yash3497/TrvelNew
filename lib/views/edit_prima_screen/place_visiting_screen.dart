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
  final List dayWiseList = ['Day 1', 'Day 2', 'Day 3'];

  final List saveTripList = [
    {'img': 'assets/images/road.png', 'name': 'Road'},
    {'img': 'assets/images/train.png', 'name': 'Train'},
    {'img': 'assets/images/plane.png', 'name': 'Flight'},
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
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
            height: height(context) * 0.52,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                padding: EdgeInsets.zero,
                itemBuilder: (context, i) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TouristSpotsScreen()));
                        },
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sri Krishna Math',
                                  style: bodyText18w600(color: black),
                                ),
                                addVerticalSpace(5),
                                Text('Religious,Culture'),
                                addVerticalSpace(3),
                                SizedBox(
                                  width: width(context) * 0.56,
                                  child: Text(
                                    'Lorem Ipsum dolor sit amet Lorem Ipsum dolor  Lorem Ipsum dolor sit sit Lorem Ipsum dolor sit..',
                                    style: bodyText12Small(
                                        spacing: 1.4, color: black),
                                  ),
                                ),
                                addVerticalSpace(5),
                                Row(
                                  children: [
                                    Text(
                                      'Learn more on ',
                                      style: bodytext12Bold(color: black),
                                    ),
                                    Image.asset('assets/images/google.png')
                                  ],
                                )
                              ],
                            ),
                            addHorizontalySpace(10),
                            SizedBox(
                                height: height(context) * 0.12,
                                child: Image.asset(
                                  'assets/images/agarbatti.png',
                                  fit: BoxFit.fill,
                                ))
                          ],
                        ),
                      ),
                      addVerticalSpace(30)
                    ],
                  );
                }),
          ),
          addVerticalSpace(15),
          Text(
            'How are we going Mumbai to Sinhgad Fort?',
            style: bodyText16w600(color: black),
          ),
          addVerticalSpace(5),
          Text(
            'Train',
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
    );
  }
}
