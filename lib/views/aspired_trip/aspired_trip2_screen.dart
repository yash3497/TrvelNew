import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/views/aspired_trip/aspired_trip_details_screen.dart';
import 'package:travel_app/widget/custom_appbar.dart';
import 'package:travel_app/widget/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constant.dart';
import 'package:travel_app/views/start/signup_with_social_media_screen.dart';

var _count = 0;
void getCount(_count) async {
  SharedPreferences counter = await SharedPreferences.getInstance();
  counter.setInt('count', _count);
}


class aspiredScreen extends StatefulWidget {
  const aspiredScreen({super.key});

  @override
  State<aspiredScreen> createState() =>
      _aspiredScreen();
}

class _aspiredScreen
    extends State<aspiredScreen> with TickerProviderStateMixin {
  TabController? _tabController;
  bool isShow = false;


  @override
  void initState() {

    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: black,
            )),
        title: isShow
            ? CustomTextFieldWidget(labelText: '  Search  ')
            : Text(
          'Touch Nature at Hills',
          style: bodyText20w700(color: black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isShow = !isShow;
                });
              },
              icon: Icon(
                Icons.search,
                color: black,
              ))
        ],
      ),
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

                        text: 'Aspired Trip',
                      ),
                      Tab(
                        text: 'Festival Trip',
                      ),

                    ],
                  ),
                ),
                Expanded(
                  child:
                  TabBarView(controller: _tabController, children: const [
                    AspiredTrip2Screen(),
                    AspiredTrip2Screen(),
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

class AspiredTrip2Screen extends StatefulWidget {
  const AspiredTrip2Screen({super.key});

  @override
  State<AspiredTrip2Screen> createState() => _AspiredTrip2ScreenState();
}

class _AspiredTrip2ScreenState extends State<AspiredTrip2Screen> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (ctx, i) {
            return InkWell(
              onTap: () {
                if (FirebaseAuth.instance.currentUser != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AspiredTripDetailsScreen()));
                } else if (_count == 10) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupWithSocialMediaScreen(),
                    ),
                  );
                } else {
                  _count++;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AspiredTripDetailsScreen()));
                }
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: height(context) * 0.35,
                width: width(context) * 0.95,
                decoration: shadowDecoration(15, 0.2),
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
                              height: height(context) * 0.04,
                              width: width(context) * 0.95,
                              padding: EdgeInsets.only(left: 5),
                              color: black.withOpacity(0.5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width(context) * 0.88,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_rounded,
                                          color: primary,
                                          size: 20,
                                        ),
                                        addHorizontalySpace(5),
                                        Text(
                                          'Panvel, Maharashtra',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: white),
                                        ),
                                        Spacer(),
                                        Text(
                                          '1-2 Days',
                                          style: bodyText14w600(color: white),
                                        )
                                      ],
                                    ),
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
                            'Trek to Karnala fort',
                            style: bodyText22w700(color: black),
                          ),
                          addVerticalSpace(7),
                          Text(
                            'Experience pleasant and cool environment with sce',
                            style: bodyText14normal(color: black),
                          ),
                          addVerticalSpace(4),
                          Text(
                            'Expected ₹: 2,000/per person',
                            style: bodyText14w600(color: black),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }))
        ],
      ),
    );
  }
}
