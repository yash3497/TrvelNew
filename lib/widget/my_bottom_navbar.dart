import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/providers/locProvider.dart';
import 'package:travel_app/providers/location_provider.dart';
import 'package:location/location.dart' as loco;

import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/home/inbox_screen.dart';
import 'package:travel_app/views/humburger_flow/prima_profile/prima_profile_screen.dart';
import 'package:travel_app/views/humburger_flow/upcoming_trips.dart';
import 'package:travel_app/widget/custom_tab_indicator.dart';
import 'package:travel_app/widget/prima_bottom_navbar.dart';

import '../dummy.dart';
import '../views/home/home_screen.dart';
import '../views/prima/go_prima_screen.dart';
import 'my_drawer.dart';

registerUserSignupPage(
    String address, String lati, String lngi, String locality) async {
  LocationProvider _locationProvider = LocationProvider();
  List abc = [];
  abc.add(locality + '/$lati/$lngi');
  final _fireStore = FirebaseFirestore.instance;
  if (FirebaseAuth.instance.currentUser != null) {
    print('=========================================');
    var x = await _fireStore
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    List y = x.data()!['homeLocations'];
    if (y.contains('$locality/$lati/$lngi')) {
      await _fireStore
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'address': address,
        'lat': lati,
        'lng': lngi,
        'locality': locality,
        'homeLocationIndex': 0
      }, SetOptions(merge: true));
    } else {
      await _fireStore
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'address': address,
        'lat': lati,
        'lng': lngi,
        'locality': locality,
        'homeLocations': FieldValue.arrayUnion(abc),
        'homeLocationIndex': 0
      }, SetOptions(merge: true));
    }
  }
  print('-----lat' + lati);
  print('-----lat' + lngi);
}

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
    UpcomingTripsScreen(),
    const Text(''),
    const InboxScreen(),
    const Text(''),
  ];

  var _counT = 0;
  void getCounT(_counT) async {
    SharedPreferences counter = await SharedPreferences.getInstance();
    counter.setInt('counT', _counT);
  }

  showSnackBar(BuildContext context, String str, [Color clr = Colors.black]) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(str),
      backgroundColor: clr,
    ));
  }

  // registerUser() async {

  //   LocationProvider _locationProvider = LocationProvider();
  //   final _fireStore = FirebaseFirestore.instance;
  //   print('test');

  //   print(_locationProvider.lat);
  //   print(_locationProvider.long);
  //   await _fireStore.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
  //     'address': _locationProvider.fetchCurrentPosition(),
  //     'lat': _locationProvider.lat,
  //     'lng': _locationProvider.long,
  //   });
  // }

  getLoc() async {
    LocationProvider _locationProvider = LocationProvider();
    await _locationProvider.fetchCurrentPosition();
    // registerUser();
    await _locationProvider.locationDeatials();
  }

  @override
  void initState() {
    _getCurrentPosition(context);
    // addPr();
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
                      tabController?.animateTo(1);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (ctx) => const UpcomingTripsScreen()));
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
                    if (FirebaseAuth.instance.currentUser != null) {
                      var x = await FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .get();
                      bool y = x.data()!['isPrima'];
                      print(y);
                      print(FirebaseAuth.instance.currentUser!.uid);
                      if (!y) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) =>
                                    const GoPrimaSubscriptionScreen()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const PrimaMyBottomBar()));
                      }
                    } else {
                      showSnackBar(context, "Please Login First!", Colors.red);
                    }
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => InboxScreen()));
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
              padding: const EdgeInsets.symmetric(horizontal: 8),
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

String _currentAddress = '';
Position? _currentPosition;
String lat = '';
String lng = '';

Future<bool> _handleLocationPermission(BuildContext context) async {
  // bool serviceEnabled;
  LocationPermission permission;
  loco.Location location = loco.Location();
  bool serviceEnabled;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    permission = await Geolocator.requestPermission();
    return false;
  }
  return true;
}

Future<void> _getCurrentPosition(BuildContext context) async {
  final hasPermission = await _handleLocationPermission(context);

  if (!hasPermission) return;
  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
      .then((Position position) {
    _currentPosition = position;
    _getAddressFromLatLng(_currentPosition!);
  }).catchError((e) {
    debugPrint(e);
  });
}

Future<void> _getAddressFromLatLng(Position position) async {
  await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude)
      .then((List<Placemark> placemarks) {
    Placemark place = placemarks[0];

    _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";

    registerUserSignupPage(
        _currentAddress,
        _currentPosition!.latitude.toStringAsFixed(2),
        _currentPosition!.longitude.toStringAsFixed(2),
        place.locality ?? '');
  }).catchError((e) {
    debugPrint(e);
  });
}
