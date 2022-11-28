import 'package:flutter/material.dart';
import 'package:travel_app/views/aspired_trip/save_trip_and_get_qoute.dart';
import 'package:travel_app/widget/custom_button.dart';

import '../../model/home_model.dart';
import '../../utils/constant.dart';
import '../../widget/custom_appbar.dart';

class FestivalAndCelebrationsScreen extends StatefulWidget {
  const FestivalAndCelebrationsScreen({super.key});

  @override
  State<FestivalAndCelebrationsScreen> createState() =>
      _FestivalAndCelebrationsScreenState();
}

class _FestivalAndCelebrationsScreenState
    extends State<FestivalAndCelebrationsScreen> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            title: 'Festivals and Celebrations',
          )),
      body: Column(
        children: [
          SizedBox(
            height: height(context) * 0.88,
            child: Column(
              children: [
                addVerticalSpace(5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TabBar(
                    padding: EdgeInsets.zero,
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
                        fontSize: 14, fontWeight: FontWeight.w600),
                    unselectedLabelStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400),
                    tabs: const [
                      Tab(
                        text: 'August',
                      ),
                      Tab(
                        text: 'September',
                      ),
                      Tab(
                        text: 'October',
                      ),
                      Tab(
                        text: 'November',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child:
                      TabBarView(controller: _tabController, children: const [
                    FestivalsDataList(),
                    FestivalsDataList(),
                    FestivalsDataList(),
                    FestivalsDataList(),
                  ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FestivalsDataList extends StatelessWidget {
  const FestivalsDataList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height(context) * 0.87,
        child: ListView.builder(itemBuilder: (ctx, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowDetailsOfFestivals()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 5),
                  height: height(context) * 0.36,
                  width: width(context) * 0.93,
                  decoration: shadowDecoration(15, 2),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                              borderRadius: const BorderRadius.only(
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
                            Text(
                              'Animal Husbandry dept & Stare Tourism dept',
                              style: bodyText14normal(color: black),
                            ),
                            addVerticalSpace(10),
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
        }));
  }
}

class ShowDetailsOfFestivals extends StatelessWidget {
  ShowDetailsOfFestivals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height(context) * 0.42,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/festivalmain.png'))),
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
                            icon: Icon(Icons.bookmark_border_rounded)),
                        const Padding(
                          padding: EdgeInsets.only(right: 12.0, top: 10),
                          child: ImageIcon(
                              AssetImage('assets/images/forward.png')),
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
                        'Nagaur Cattle Festival',
                        style: bodyText30W600(color: black),
                      ),
                      Text(
                        'Religious, Culture.',
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
                        'The Krishna Matha was founded by the Vaishnavite saint Jagadguru Shri Madhvacharya in the 13th century. He was the founder of the Dwaita school of Vedanta.It is believed that Madhwacharya found the vigraha of Shri Krishna in a large ball of gopichandana.',
                        style: TextStyle(
                            height: 1.3,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: black),
                      ),
                      addVerticalSpace(15),
                      Row(
                        children: [
                          addHorizontalySpace(7),
                          Stack(
                            children: [
                              Container(
                                width: width(context) * 0.32,
                                child: Row(
                                  children: [
                                    for (int i = 0; i < overlap2.length; i++)
                                      Align(
                                        widthFactor: 0.5,
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: white,
                                          backgroundImage:
                                              AssetImage(overlap2[i]),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  left: 80,
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor:
                                        Colors.blue.withOpacity(0.4),
                                    child: Text(
                                      '+ 50',
                                      style: bodyText11Small(color: white),
                                    ),
                                  ))
                            ],
                          ),
                          Text('Shown Interest')
                        ],
                      ),
                      addVerticalSpace(15),
                      Text(
                        'Nearby Tourist Spots',
                        style: bodyText20w700(color: black),
                      ),
                      addVerticalSpace(15),
                      SizedBox(
                        height: height(context) * 0.16,
                        child: ListView.builder(
                            itemCount: nearbySpots.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, i) {
                              return Column(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    margin: EdgeInsets.only(right: 8),
                                    height: height(context) * 0.12,
                                    width: width(context) * 0.37,
                                    child: Image.asset(
                                      nearbySpots[i]['img'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                addVerticalSpace(5),
                                Text(
                                  nearbySpots[i]['name'],
                                )
                              ]);
                            }),
                      ),
                      addVerticalSpace(10),
                      Text(
                        'Includes',
                        style: bodyText20w700(color: black),
                      ),
                      addVerticalSpace(5),
                      Text(
                        'The Krishna Matha was founded by the Vaishnavite saint Jagadguru Shri Madhvacharya in the 13th century. He was the founder of the Dwaita school of Vedanta.It is believed that Madhwacharya found the vigraha of Shri Krishna in a large ball of gopichandana.',
                        style: TextStyle(
                            height: 1.3,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: black),
                      ),
                      addVerticalSpace(35),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: height(context) * 0.05,
            left: 9,
            child: CustomButton(
                name: 'Interested! Save Trip and Get Quote',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => SaveTripAndGetQuote(
                              message1:
                                  'The best mode of travel and travel booking will be suggested by our travel partner for this trip',
                              message2: '')));
                }),
          )
        ],
      ),
    );
  }
}
