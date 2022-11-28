import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/model/home_model.dart';
import 'package:travel_app/utils/constant.dart';

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
    super.initState();
  }

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
                        child: ListView.builder(itemBuilder: (ctx, i) {
                          return QuickEscapeDataList();
                        }),
                      ),
                      SizedBox(
                        height: height(context) * 0.87,
                        child: ListView.builder(itemBuilder: (ctx, i) {
                          return QuickEscapeDataList();
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

class QuickEscapeDataList extends StatelessWidget {
  const QuickEscapeDataList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigator.push(context,MaterialPageRoute(builder: (context)=>));
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
                                  addHorizontalySpace(width(context) * 0.3),
                                  Container(
                                    height: 20,
                                    width: width(context) * 0.2,
                                    decoration:
                                        myFillBoxDecoration(0, primary, 4),
                                    child: Center(
                                      child: Text(
                                        '2 days',
                                        style: bodytext12Bold(color: black),
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
                        'Nagaur Cattle Festival',
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
