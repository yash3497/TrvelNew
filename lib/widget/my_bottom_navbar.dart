import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/providers/location_provider.dart';

import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/home/inbox_screen.dart';
import 'package:travel_app/views/humburger_flow/prima_profile/prima_profile_screen.dart';
import 'package:travel_app/views/humburger_flow/upcoming_trips.dart';
import 'package:travel_app/widget/custom_tab_indicator.dart';
import 'package:travel_app/widget/prima_bottom_navbar.dart';

import '../views/home/home_screen.dart';
import 'my_drawer.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar>
    with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final PageStorageBucket bucket = PageStorageBucket();
  TabController? tabController;
  final List<Widget> mainScreens = [
    HomeScreen(),
    const UpcomingTripsScreen(),
    const Text(''),
    const InboxScreen(),
    const Text(''),
  ];
  showSnackBar(BuildContext context, String str, [Color clr = Colors.black]) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(str),
      backgroundColor: clr,
    ));
  }

  registerUser() async {
    LocationProvider _locationProvider = LocationProvider();
    final _fireStore = FirebaseFirestore.instance;
    await _fireStore.collection("users").doc().set({
      'address': _locationProvider.currentAddress,
      'lat': _locationProvider.newLatLongList,
      'lng': _locationProvider.newLatLongList,
    });
  }

  @override
  void initState() {
    LocationProvider _locationProvider = LocationProvider();
    _locationProvider.fetchCurrentPosition();
    super.initState();
    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: MyDrawer(),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: mainScreens,
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          // notchMargin: 8,
          child: TabBar(
              tabs: [
                const Tab(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/images/navbar1.png',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (FirebaseAuth.instance.currentUser != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const UpcomingTripsScreen()));
                    } else {
                      showSnackBar(context, "Please Login First!", Colors.red);
                    }
                  },
                  child: const Tab(
                    icon: ImageIcon(
                      AssetImage(
                        'assets/images/navbar2.png',
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const PrimaMyBottomBar()));
                  },
                  child: const Tab(
                    icon: SizedBox(
                      height: 50,
                      width: 50,
                      child: ImageIcon(
                        AssetImage(
                          'assets/images/navbar3.png',
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (FirebaseAuth.instance.currentUser != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const InboxScreen()));
                    } else {
                      showSnackBar(context, "Please Login First!", Colors.red);
                    }
                  },
                  child: const Tab(
                    icon: ImageIcon(
                      AssetImage(
                        'assets/images/navbar4.png',
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _globalKey.currentState!.openDrawer();
                  },
                  child: const Tab(
                    icon: SizedBox(
                      height: 50,
                      width: 50,
                      child: ImageIcon(
                        AssetImage(
                          'assets/images/navbar5.png',
                        ),
                      ),
                    ),
                  ),
                )
              ],
              labelPadding: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              labelColor: primary,
              unselectedLabelColor: Colors.grey.shade400,
              isScrollable: false,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.all(0.0),
              indicatorColor: primary,
              controller: tabController,
              indicator: const CustomTabIndicator()),
        ),
      ),
    );
  }
}
