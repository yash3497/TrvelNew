import 'package:flutter/material.dart';

import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/aspired_trip/aspired_trip2_screen.dart';
import 'package:travel_app/views/home/festival_and_celebrations_screen.dart';
import 'package:travel_app/views/home/quick_escape_screen.dart';
import 'package:travel_app/views/humburger_flow/my_account/my_account.dart';
import 'package:travel_app/views/humburger_flow/my_account/my_trip_friends.dart';
import 'package:travel_app/views/humburger_flow/my_saved_pins.dart';
import 'package:travel_app/views/humburger_flow/prima_profile/create_prima_profile.dart';
import 'package:travel_app/views/humburger_flow/prima_profile/prima_profile_screen.dart';
import 'package:travel_app/views/humburger_flow/trip_library_screen.dart';
import 'package:travel_app/views/humburger_flow/upcoming_trips.dart';
import 'package:travel_app/views/publish%20your%20trip/publish_your_trip.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool isExpand = false;
  bool isExpand1 = false;
  bool isExpand2 = false;
  bool isExpand3 = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: height(context) * 0.2,
            width: width(context),
            decoration: BoxDecoration(gradient: yellowBlackGradient()),
            child: Row(
              children: [
                addHorizontalySpace(10),
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/menu1.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(height(context) * 0.045),
                    Row(
                      children: [
                        Text(
                          'Hii, Alexander',
                          style: bodyText22w700(color: white),
                        ),
                        addHorizontalySpace(3),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Icon(
                            Icons.edit_note,
                            color: white,
                          ),
                        )
                      ],
                    ),
                    // addVerticalSpace(6),
                    Container(
                      height: 23,
                      width: width(context) * 0.35,
                      decoration: myFillBoxDecoration(0, white, 7),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.star_rate_rounded,
                              color: primary,
                              size: 20,
                            ),
                            Text(
                              'Verified Member',
                              style: bodytext12Bold(color: black),
                            )
                          ]),
                    ),
                    addVerticalSpace(6),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyAccountScreen()));
                          },
                          child: Text(
                            'View/ Edit account',
                            style: bodyText14w600(color: black),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
          Theme(
            data: ThemeData(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: primary,
                  ),
            ),
            child: ExpansionTile(
              onExpansionChanged: (value) {
                isExpand1 = !isExpand1;
                setState(() {});
              },
              leading: ImageIcon(
                  color: isExpand1 ? primary : black.withOpacity(0.4),
                  const AssetImage(
                    'assets/images/upcomingicon1.png',
                  )),
              title: Text(
                'View / Manage Trips',
                style: bodyText14w600(color: black),
              ),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width(context) * 0.19),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UpcomingTripsScreen()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const ImageIcon(
                                AssetImage('assets/images/navbar2.png'),
                              ),
                              addHorizontalySpace(10),
                              Text('Upcoming Trips'),
                            ],
                          )),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: width(context) * 0.195, top: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TripLibraryScreen()));
                        },
                        child: Row(
                          children: [
                            const ImageIcon(
                              AssetImage('assets/images/menuicon1.png'),
                            ),
                            addHorizontalySpace(10),
                            Text('Trip Library'),
                          ],
                        ),
                      ),
                    ),
                    addVerticalSpace(8)
                  ],
                ),
              ],
            ),
          ),
          Theme(
            data: ThemeData(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: primary,
                  ),
            ),
            child: ExpansionTile(
              onExpansionChanged: (value) {
                isExpand = !isExpand;
                setState(() {});
              },
              leading: ImageIcon(
                  color: isExpand ? primary : black.withOpacity(0.4),
                  const AssetImage(
                    'assets/images/menu3.png',
                  )),
              title: Text(
                'Prima',
                style: bodyText14w600(color: black),
              ),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width(context) * 0.195),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CreatePrimaProfile()));
                          },
                          child: Row(
                            children: [
                              Icon(Icons.person),
                              addHorizontalySpace(10),
                              Text('Prima Profile'),
                            ],
                          )),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: width(context) * 0.195, top: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PublishYourTripScreen()));
                        },
                        child: Row(
                          children: [
                            const ImageIcon(
                              AssetImage('assets/images/menuicon2.png'),
                            ),
                            addHorizontalySpace(10),
                            Text('Prima Trip'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: width(context) * 0.195, top: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyTripFriendsScreen(
                                        title: 'Friends in vicinity',
                                      )));
                        },
                        child: Row(
                          children: [
                            const ImageIcon(
                              AssetImage('assets/images/menuicon3.png'),
                            ),
                            addHorizontalySpace(10),
                            Text('Friends in Vicinity'),
                          ],
                        ),
                      ),
                    ),
                    addVerticalSpace(8)
                  ],
                ),
              ],
            ),
          ),
          Theme(
            data: ThemeData(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: primary,
                  ),
            ),
            child: ExpansionTile(
              onExpansionChanged: ((value) {
                isExpand2 = !isExpand2;
                setState(() {});
              }),
              leading: ImageIcon(
                  color: isExpand2 ? primary : black.withOpacity(0.4),
                  const AssetImage(
                    'assets/images/menu4.png',
                  )),
              title: Text(
                'Explore Interesting',
                style: bodyText14w600(color: black),
              ),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: width(context) * 0.195,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AspiredTrip2Screen()));
                        },
                        child: Row(
                          children: [
                            const ImageIcon(
                              AssetImage('assets/images/menuicon1.png'),
                            ),
                            addHorizontalySpace(10),
                            Text('Aspired Trips'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: width(context) * 0.195, top: 8),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FestivalAndCelebrationsScreen()));
                          },
                          child: Row(
                            children: [
                              Icon(Icons.travel_explore_outlined),
                              addHorizontalySpace(10),
                              Text('Events & Festivals'),
                            ],
                          )),
                    ),
                    addVerticalSpace(8)
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: ImageIcon(
                color: black.withOpacity(0.4),
                const AssetImage(
                  'assets/images/menu6.png',
                )),
            title: Text(
              'Quick Escape',
              style: bodyText14w600(color: black),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QuickEscapeScreen()));
            },
          ),
          Theme(
            data: ThemeData(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: primary,
                  ),
            ),
            child: ExpansionTile(
              onExpansionChanged: ((value) {
                setState(() {
                  isExpand3 = !isExpand3;
                });
              }),
              leading: ImageIcon(
                  color: isExpand3 ? primary : black.withOpacity(0.4),
                  const AssetImage(
                    'assets/images/menu5.png',
                  )),
              title: Text(
                'My Saved Pins',
                style: bodyText14w600(color: black),
              ),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width(context) * 0.03, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MySavedPinsScreens()));
                        },
                        child: Text('Trip City'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width(context) * 0.03, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MySavedPinsScreens()));
                        },
                        child: Text('Tourist Spots'),
                      ),
                    ),
                    addVerticalSpace(8)
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: ImageIcon(
                color: black.withOpacity(0.4),
                const AssetImage(
                  'assets/images/menu7.png',
                )),
            title: Text(
              'Rate us on App Store',
              style: bodyText14w600(color: black),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Subtract.png',
                fit: BoxFit.fill,
              ),
              Image.asset(
                'assets/images/Subtract (1).png',
                fit: BoxFit.fill,
              ),
              Image.asset(
                'assets/images/Subtract (2).png',
                fit: BoxFit.fill,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(9),
            height: height(context) * 0.3,
            // width: width(context) * 0.2,
            decoration: myOutlineBoxDecoration(1, Colors.black26, 15),
            child: Center(
              child: Text(
                '250*250',
                style: bodyText14w600(color: black),
              ),
            ),
          ),
          addVerticalSpace(height(context) * 0.06),
          Center(
            child: Text(
              'App Version 1.2022',
              style: bodyText12Small(color: black),
            ),
          ),
          addVerticalSpace(10)
        ],
      ),
    );
  }
}
