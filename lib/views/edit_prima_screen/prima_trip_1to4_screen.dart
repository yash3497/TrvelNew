import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/views/edit_prima_screen/edit_prima_trip_screen.dart';
import 'package:travel_app/views/edit_prima_screen/entertainment_screen.dart';
import 'package:travel_app/views/edit_prima_screen/place_visiting_screen.dart';
import 'package:travel_app/views/edit_prima_screen/trip_members_screen.dart';
import 'package:travel_app/widget/custom_button.dart';

import '../../utils/constant.dart';
import '../humburger_flow/my_account/report_incorrect_user_screen.dart';

class PrimaTrip1To4Screens extends StatefulWidget {
  const PrimaTrip1To4Screens({super.key});

  @override
  State<PrimaTrip1To4Screens> createState() => _PrimaTrip1To4ScreensState();
}

class _PrimaTrip1To4ScreensState extends State<PrimaTrip1To4Screens> {
  List mainIconTabbar = [
    {
      'icon': Icon(
        Icons.people_rounded,
        color: black,
        size: 25,
      ),
      'name': 'Trip Members',
    },
    {
      'icon': Icon(
        Icons.route_outlined,
        color: black,
        size: 25,
      ),
      'name': 'Places visiting',
    },
    {
      'icon': Icon(
        Icons.image_outlined,
        color: black,
        size: 25,
      ),
      'name': 'Entertainment',
    },
    {
      'icon': Icon(
        Icons.tiktok_outlined,
        color: black,
        size: 25,
      ),
      'name': 'What to bring',
    },
  ];

  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height(context) * 0.35,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/editprima2.png'))),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: white,
                                )),
                            const Spacer(),
                            Image.asset('assets/images/arrowforward.png',
                                color: white),
                            addHorizontalySpace(15),
                            Image.asset('assets/images/msg.png', color: white),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) =>
                                              const EditPrimaTripScreen()));
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: white,
                                ))
                          ],
                        ),
                        addVerticalSpace(height(context) * 0.15),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin: const EdgeInsets.only(right: 20),
                            height: 25,
                            width: width(context) * 0.3,
                            decoration: myFillBoxDecoration(0, primary, 50),
                            child: const Center(
                              child: Text('Feb 06 - 09'),
                            ),
                          ),
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
                        'Trek to Fort Sinhagad',
                        style: bodyText30W600(color: black),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: primary,
                          ),
                          Text(
                            'Pune, Maharashtra',
                            style: bodyText16normal(color: black),
                          )
                        ],
                      ),
                      addVerticalSpace(10),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text:
                                'Sinhagad is a hill fortress located at around 49 km southwest of the city of Pune, India. Some of the information available at this fort suggests that.',
                            style: TextStyle(
                                fontSize: 16, height: 1.4, color: black)),
                        TextSpan(
                            text: ' more',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                color: primary,
                                fontWeight: FontWeight.w600))
                      ])),
                    ],
                  ),
                ),
                SizedBox(
                    height: height(context) * 0.08,
                    child: ListView.builder(
                        itemCount: mainIconTabbar.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, i) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  selectIndex = i;
                                  setState(() {});
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(12),
                                  height: height(context) * 0.05,
                                  width: selectIndex == i
                                      ? width(context) * 0.35
                                      : width(context) * 0.13,
                                  decoration: selectIndex == i
                                      ? myFillBoxDecoration(0, primary, 10)
                                      : shadowDecoration(10, 2),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      mainIconTabbar[i]['icon'],
                                      addHorizontalySpace(5),
                                      selectIndex == i
                                          ? Text(mainIconTabbar[i]['name'])
                                          : const SizedBox()
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        })),
                if (selectIndex == 0) TripMembersTabPrimaProfile(),
                if (selectIndex == 1) PlaceVisitingScreen(),
                if (selectIndex == 2) EntertainmentTab(),
                if (selectIndex == 3) const WhatToBringTab(),
              ],
            ),
          ),
          Positioned(
              bottom: 30,
              left: width(context) * 0.27,
              child: CustomRequestToJoinButton()),
        ],
      ),
    );
  }
}

class WhatToBringTab extends StatelessWidget {
  const WhatToBringTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addVerticalSpace(10),
          Row(
            children: [
              Text(
                'What to Bring',
                style: bodyText16w600(color: black),
              ),
              const Spacer(),
              const Icon(
                Icons.edit,
              )
            ],
          ),
          addVerticalSpace(20),
          const Text(
            'The document you upload here is not visible to anyone and it is only saved in your device. It is offlineit also makes you a verified traveller, that helps you in quick check-ins and mee',
            style: TextStyle(height: 1.3),
          ),
          addVerticalSpace(15),
          SizedBox(
              height: height(context) * 0.45,
              child: ListView.builder(
                  itemCount: 6,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (ctx, i) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: black.withOpacity(0.1),
                      ),
                      title: Text(
                        'Ritesh Zagade',
                        style: bodyText16w600(color: black),
                      ),
                      subtitle: Text('Bring DSLR'),
                      trailing: Text('Rs. 5000'),
                    );
                  })),
          addVerticalSpace(15),
          Row(
            children: [
              Spacer(),
              Text(
                'Total    Rs. 5000',
                style: bodyText16w600(color: black),
              )
            ],
          ),
          Text(
            'How Spends are distributed',
            style: bodyText14w600(color: black),
          ),
          addVerticalSpace(3),
          Text(
            'Each for him/her self',
            style: bodyText12Small(color: black),
          ),
          addVerticalSpace(height(context) * 0.1)
        ],
      ),
    );
  }
}
