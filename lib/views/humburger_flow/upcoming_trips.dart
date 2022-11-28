import 'package:flutter/material.dart';
import 'package:travel_app/views/home/festival_and_celebrations_screen.dart';
import 'package:travel_app/views/humburger_flow/trip_library_screen.dart';

import '../../utils/constant.dart';

class UpcomingTripsScreen extends StatelessWidget {
  const UpcomingTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: black,
              )),
          backgroundColor: white,
          title: Text(
            'Upcoming Trips',
            style: bodyText20w700(color: black),
          ),
          actions: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => TripLibraryScreen()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 30,
                    width: width(context) * 0.16,
                    decoration:
                        myFillBoxDecoration(0, black.withOpacity(0.1), 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/upcomingicon2.png',
                          color: black,
                        ),
                        addHorizontalySpace(5),
                        Image.asset(
                          'assets/images/upcomingicon1.png',
                          color: black,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              // height: height(context) * 0.79,
              child: ListView.builder(itemBuilder: (ctx, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TripLibraryDetailsScreen()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    height: height(context) * 0.317,
                    width: width(context) * 0.93,
                    decoration: shadowDecoration(15, 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                child: Image.asset('assets/images/beach.png')),
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
                                  height: height(context) * 0.06,
                                  width: width(context) * 0.95,
                                  padding: EdgeInsets.only(left: 5),
                                  color: black.withOpacity(0.5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            '6th Feb 2022',
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
                                            'Udupi, Karnataka',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: white),
                                          ),
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
                                'Nagaur Cattle Festival',
                                style: bodyText22w700(color: black),
                              ),
                              addVerticalSpace(2),
                              Text(
                                'Animal Husbandry dept & Stare Tourism dept',
                                style: bodyText14normal(color: black),
                              ),
                              addVerticalSpace(8),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }))
        ],
      ),
    );
  }
}
