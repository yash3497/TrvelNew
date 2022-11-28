import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/model/save_trip_model.dart';
import 'package:travel_app/views/aspired_trip/travel_agency_details.dart';
import 'package:travel_app/views/humburger_flow/tourist_spot_screen.dart';
import 'package:travel_app/views/humburger_flow/trip_map_screen.dart';
import 'package:travel_app/views/save_your_trips/save_your_trips.dart';
import 'package:travel_app/widget/custom_button.dart';

import '../../utils/constant.dart';

class TripLibraryScreen extends StatefulWidget {
  const TripLibraryScreen({super.key});

  @override
  State<TripLibraryScreen> createState() => _TripLibraryScreenState();
}

class _TripLibraryScreenState extends State<TripLibraryScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'Trip Library',
          style: bodyText20w700(color: black),
        ),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  // Navigator.push(context,MaterialPageRoute(builder: (ctx)=>));
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TabBar(
              padding: EdgeInsets.all(10),
              // labelPadding: EdgeInsets.zero,
              // indicatorPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
              onTap: (value) {},
              isScrollable: true,
              indicator: BoxDecoration(
                  // shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: primary),
              indicatorColor: primary,
              labelColor: black,
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),

              tabs: const [
                Tab(
                  text: 'Unsaved \n  Trips',
                ),
                Tab(
                  text: 'Invited/Requested \n            Trips',
                ),
                Tab(
                  text: 'Search\n  Trips',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              SizedBox(
                height: height(context) * 0.87,
                child: ListView.builder(
                    itemCount: tripLibraryList.length,
                    itemBuilder: (ctx, i) {
                      return CustomTripDataList(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SaveYourTripsScreen()));
                        },
                        img: tripLibraryList[i].img,
                        location: 'Udupi, Karnataka',
                        containerYellowBox: SizedBox(),
                        icon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.bookmark_border,
                              color: white,
                            )),
                      );
                    }),
              ),
              SizedBox(
                height: height(context) * 0.87,
                child: ListView.builder(
                    itemCount: tripLibraryList.length,
                    itemBuilder: (ctx, i) {
                      return CustomTripDataList(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TripLibraryDetailsScreen()));
                        },
                        icon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border_outlined,
                              color: white,
                            )),
                        img: tripLibraryList[i].img,
                        location: 'Udupi, Karnataka',
                        containerYellowBox: Container(
                          height: 20,
                          width: width(context) * 0.3,
                          decoration: myFillBoxDecoration(0, primary, 4),
                          child: Center(
                            child: Text(
                              tripLibraryList[i].inviteAndRequest,
                              style: bodytext12Bold(color: black),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: height(context) * 0.87,
                child: ListView.builder(
                    itemCount: tripLibraryList.length,
                    itemBuilder: (ctx, i) {
                      return CustomTripDataList(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TripLibraryDetailsScreen()));
                        },
                        img: tripLibraryList[i].img,
                        location: 'Udupi, Karnataka',
                        containerYellowBox: SizedBox(),
                        icon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.bookmark_border,
                              color: white,
                            )),
                      );
                    }),
              )
            ]),
          )
        ],
      ),
    );
  }
}

class CustomTripDataList extends StatelessWidget {
  const CustomTripDataList({
    Key? key,
    required this.location,
    required this.containerYellowBox,
    required this.img,
    this.icon,
    required this.onTap,
  }) : super(key: key);
  final String location;
  final Widget containerYellowBox;
  final String img;
  final Widget? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 5),
            height: height(context) * 0.37,
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
                        child: Image.asset(img)),
                    Positioned(
                        top: -5,
                        right: 1,
                        child: Row(
                          children: [
                            icon!,
                            InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.more_vert,
                                  color: white,
                                )),
                          ],
                        )),
                    Positioned(
                        bottom: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: width(context),
                              color: Colors.black.withOpacity(0.4),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: white,
                                    size: 20,
                                  ),
                                  addHorizontalySpace(5),
                                  Text(
                                    location,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: white),
                                  ),
                                  addHorizontalySpace(width(context) * 0.25),
                                  containerYellowBox
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tourist Spots list',
                        style: bodyText22w700(color: black),
                      ),
                      Text(
                        'Hill Station, Trekking, Waterfalls',
                        style: bodyText14normal(color: black),
                      ),
                      addVerticalSpace(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/images/cardrive.png',
                          ),
                          addHorizontalySpace(5),
                          SizedBox(
                            width: width(context) * 0.15,
                            child: Text(
                              '12 Hours drive',
                              style: bodytext12Bold(color: black),
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
                            child: Text(
                              '16 Hours journey',
                              style: bodytext12Bold(color: black),
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
    );
  }
}

class TripLibraryDetailsScreen extends StatelessWidget {
  TripLibraryDetailsScreen({super.key});

  final List dayWiseList = ['Day 1', 'Day 2', 'Day 3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: height(context),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height(context) * 0.43,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/temple.png'))),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: height(context) * 0.11,
                            width: width(context) * 1,
                            padding: EdgeInsets.only(left: 5),
                            color: black.withOpacity(0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: primary,
                                      size: 20,
                                    ),
                                    Text(
                                      'Udupi, Karnataka',
                                      style: bodyText16normal(color: white),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 5),
                                  child: Text(
                                    'Family trip ',
                                    style: bodyText14normal(color: white),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 5),
                                  child: Text(
                                    'Feb 14 - 21, 2022',
                                    style: bodyText13normal(color: white),
                                  ),
                                ),
                                addVerticalSpace(10)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      height: height(context) * 1.3,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: dayWiseList.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        dayWiseList[i],
                                        style: bodyText20w700(color: black),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TripMapScreen()));
                                          },
                                          child: Image.asset(
                                              'assets/images/akar-icons_map.png'))
                                    ],
                                  ),
                                  Text('Monday, Feb 14 2022'),
                                  addVerticalSpace(10),
                                  SizedBox(
                                    height: height(context) * 0.32,
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: 2,
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context, i) {
                                          return Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              TouristSpotsScreen()));
                                                },
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Sri Krishna Math',
                                                          style: bodyText18w600(
                                                              color: black),
                                                        ),
                                                        Text(
                                                          'Religious,Culture',
                                                          style: TextStyle(
                                                              height: 1.4),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              width(context) *
                                                                  0.56,
                                                          child: Text(
                                                            'Lorem Ipsum dolor sit amet Lorem Ipsum dolor  Lorem Ipsum dolor sit sit Lorem Ipsum dolor sit..',
                                                            style:
                                                                bodyText12Small(
                                                                    spacing:
                                                                        1.5,
                                                                    color:
                                                                        black),
                                                          ),
                                                        ),
                                                        addVerticalSpace(5),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Learn more on ',
                                                              style:
                                                                  bodytext12Bold(
                                                                      color:
                                                                          black),
                                                            ),
                                                            Image.asset(
                                                                'assets/images/google.png')
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    addHorizontalySpace(10),
                                                    SizedBox(
                                                        height:
                                                            height(context) *
                                                                0.12,
                                                        child: Image.asset(
                                                          'assets/images/agarbatti.png',
                                                          fit: BoxFit.fill,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              addVerticalSpace(15)
                                            ],
                                          );
                                        }),
                                  ),
                                  // const Divider(
                                  //   thickness: 1,
                                  // ),
                                ],
                              ),
                            );
                          })),
                  addVerticalSpace(30)
                ],
              ),
            ),
          ),
          Positioned(
            bottom: height(context) * 0.06,
            left: width(context) * 0.17,
            child: Center(
                child: SizedBox(
                    width: width(context) * 0.65,
                    child: CustomButton(
                        name: 'See your travel Utility',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TravelAgencyDetailsScreen()));
                        }))),
          )
        ],
      ),
    );
  }
}
