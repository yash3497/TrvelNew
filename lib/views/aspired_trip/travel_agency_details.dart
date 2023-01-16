import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/aspired_trip/checklist_budget_screen_travel_agency.dart';
import 'package:travel_app/views/aspired_trip/explore_trip_destinaton_screen_travelagency.dart';
import 'package:travel_app/widget/custom_button.dart';

import 'detailsOfTripWidget.dart';
import 'your_stay_screen_travel_agency.dart';

class TravelAgencyDetailsScreen extends StatefulWidget {
  const TravelAgencyDetailsScreen({super.key});

  @override
  State<TravelAgencyDetailsScreen> createState() =>
      _TravelAgencyDetailsScreenState();
}

class _TravelAgencyDetailsScreenState extends State<TravelAgencyDetailsScreen> {
  bool isShow = false;

  List mainIconTabbar = [
    Icon(
      Icons.person,
      color: black,
      size: 30,
    ),
    Icon(
      Icons.location_city_outlined,
      color: black,
      size: 30,
    ),
    Icon(
      Icons.train_outlined,
      color: black,
      size: 30,
    ),
    const ImageIcon(AssetImage('assets/images/tabbaricon.png')),
    Icon(
      Icons.currency_rupee,
      color: black,
      size: 30,
    ),
  ];

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: black,
            )),
        title: Column(
          children: [
            Text(
              'Udupi, Karnataka',
              style: bodyText20w700(color: black),
            ),
            Text(
              'Family Trip - Feb 14 2022',
              style: bodyText14normal(color: black),
            )
          ],
        ),
        actions: [
          Icon(
            Icons.more_vert,
            color: black,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: height(context) * 0.1,
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
                              margin: EdgeInsets.all(10),
                              height: height(context) * 0.07,
                              width: 55,
                              decoration: selectIndex == i
                                  ? myFillBoxDecoration(0, primary, 10)
                                  : myFillBoxDecoration(
                                      0, black.withOpacity(0.1), 10),
                              child: Center(
                                child: mainIconTabbar[i],
                              ),
                            ),
                          ),
                        ],
                      );
                    })),
            if (selectIndex == 0) DetailsOfTripWidget(isShow: isShow),
            if (selectIndex == 1)
              SizedBox(height: height(context) * 0.8, child: YourStayScreen()),
            if (selectIndex == 2)
              SizedBox(
                  height: height(context) * 0.78,
                  child: YourTravelJourneyDetails()),
            if (selectIndex == 3)
              SizedBox(
                  height: height(context) * 1.2,
                  child: ExploreTripDestination()),
            if (selectIndex == 4)
              SizedBox(
                  height: height(context) * 0.78,
                  child: CheckListAndBudgetScreen())
          ],
        ),
      ),
    );
  }
}

class YourTravelJourneyDetails extends StatelessWidget {
  const YourTravelJourneyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Travel Journey details',
              style: bodyText18w600(color: black),
            ),
            addVerticalSpace(10),
            Row(
              children: [
                Spacer(),
                Text(
                  'Booking id: 540986',
                  style: bodyText14w600(color: primary),
                )
              ],
            ),
            addVerticalSpace(10),
            Text(
              'Air India',
              style: bodyText16w600(color: black),
            ),
            Text(
              'AX-748',
              style: bodyText13normal(color: black.withOpacity(0.5)),
            ),
            Text(
              'ETKT - 5555444412134',
              style: bodyText13normal(color: black.withOpacity(0.5)),
            ),
            addVerticalSpace(20),
            Text(
              'Travelers',
              style: bodyText14normal(color: black.withOpacity(0.4)),
            ),
            addVerticalSpace(5),
            Text(
              '8 Adults',
              style: bodyText16w600(color: black),
            ),
            addVerticalSpace(10),
            SizedBox(
              width: width(context) * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BOM',
                        style: bodyText14normal(color: black.withOpacity(0.4)),
                      ),
                      addVerticalSpace(5),
                      Text(
                        'Mumbai',
                        style: bodyText16w600(color: black),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MAN',
                        style: bodyText14normal(color: black.withOpacity(0.4)),
                      ),
                      addVerticalSpace(5),
                      Text(
                        'Mangalore',
                        style: bodyText16w600(color: black),
                      ),
                    ],
                  )
                ],
              ),
            ),
            addVerticalSpace(10),
            Text(
              'BOM',
              style: bodyText14normal(color: black.withOpacity(0.4)),
            ),
            addVerticalSpace(5),
            Text(
              'Seat - 24A, 23A, 22A, 21A, 20A, 19A, B25, B26',
              style: bodyText16w600(color: black),
            ),
            addVerticalSpace(height(context) * 0.05),
            Center(
              child: SizedBox(
                width: width(context) * 0.6,
                child: Text(
                  'This is not your e-ticket.Ask your travel advisor for detail',
                  textAlign: TextAlign.center,
                  style: bodyText14normal(color: black.withOpacity(0.5)),
                ),
              ),
            ),
            Spacer(),
            CustomButton(name: 'Show uploaded Government id', onPressed: () {}),
            addVerticalSpace(30)
          ],
        ),
      ),
    );
  }
}
