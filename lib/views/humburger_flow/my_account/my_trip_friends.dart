import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/views/humburger_flow/my_account/my_following_trip_friends.dart';
import 'package:travel_app/views/humburger_flow/my_account/report_incorrect_user_screen.dart';
import 'package:travel_app/views/start/sign_in_screen.dart';
import 'package:travel_app/widget/custom_appbar.dart';
import 'package:travel_app/widget/custom_textfield.dart';

import 'package:numberpicker/numberpicker.dart';
import 'package:age_calculator/age_calculator.dart';

import '../../../utils/constant.dart';
import '../../../widget/custom_button.dart';

class MyTripFriendsScreen extends StatefulWidget {
  MyTripFriendsScreen({required this.title});
  String title;

  @override
  State<MyTripFriendsScreen> createState() => _MyTripFriendsScreenState();
}

List<dynamic> permanentList = [];
List<dynamic> listo = [];
List<dynamic> friendsInVicinity = [];
List<dynamic> tripFriend = [];
bool isFIV = false;

class _MyTripFriendsScreenState extends State<MyTripFriendsScreen> {
  List<dynamic> allMemList = [];
  bool loading = false;
  late String title;

  getFriendInVicinityList() async {
    friendsInVicinity.clear();
    allMemList.clear();
    permanentList.clear();
    setState(() {
      loading = true;
    });
    var x = await FirebaseFirestore.instance.collection('users').get();
    var y = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    double userLat = double.parse(y.data()!['lat']);
    double userLng = double.parse(y.data()!['lng']);

    for (var element in x.docs) {
      permanentList.add(element.data());
      allMemList.add(element.data());
    }
    print(allMemList);

    //last 30 days active
    for (var element in allMemList) {
      var lastActTime = DateTime.fromMillisecondsSinceEpoch(
          int.parse(element['lastActive'] ?? 0.0) * 1000);
      //prima, friend &
      var nowTime = DateTime.now();

      print('${element['UID']}=====$nowTime ========$lastActTime');
      var diff =
          double.parse(nowTime.difference(lastActTime).inDays.toString());
      if (diff <= 30) {
        friendsInVicinity.add(element);
      }
    }

    //30km radius
    for (var element in allMemList) {
      double lat = double.parse(element['lat'] ?? 0.0);
      double lng = double.parse(element['lng'] ?? 0.0);
      double dist = calculateDistance(userLat, userLng, lat, lng);
      print('$lat -- $lng -- $dist');
      if (dist <= 30 &&
          element['UID'] != FirebaseAuth.instance.currentUser!.uid &&
          !friendsInVicinity.contains(element)) {
        friendsInVicinity.add(element);
        allMemList.remove(element);
      }
    }

    setState(() {
      listo = friendsInVicinity;
      loading = false;
    });
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  void initState() {
    title = widget.title;

    isFIV = title == 'Friends in vicinity' ? true : false;
    isFIV ? getFriendInVicinityList() : getTripFriend();
    // TODO: implement initState
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
        title: Text(
          widget.title,
          style: bodyText20w700(color: black),
        ),
        bottom: !isFIV
            ? PreferredSize(
                preferredSize: Size.fromHeight(15),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyfollowingFriendScreen()));
                  },
                  child: const Text(
                    'Trip Friend Request',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              )
            : const PreferredSize(
                preferredSize: Size.zero,
                child: SizedBox(),
              ),
        actions: [
          InkWell(
            onTap: () {
              filterDialog(context);
            },
            child: Row(
              children: [
                Text(
                  'Filter',
                  style: bodyText14w600(color: black),
                ),
                Icon(
                  Icons.filter_alt_outlined,
                  color: black,
                ),
                addHorizontalySpace(10)
              ],
            ),
          ),
        ],
      ),
      body: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          height: height(context) * 0.95,
          decoration: shadowDecoration(10, 1),
          child: ListView.builder(
              itemCount: listo.length,
              itemBuilder: (ctx, i) {
                print(widget.title);
                return Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          listo[i]['profileImg'] == null
                              ? const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/nearbyfestivals.png'),
                                  radius: 30,
                                )
                              : CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(listo[i]['profileImg']),
                                  radius: 30,
                                ),
                          addHorizontalySpace(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listo[i]['fullName'] ?? '',
                                style: bodyText18w600(color: black),
                              ),
                              addVerticalSpace(3),
                              if (i == 2 || i == 1)
                                Row(
                                  children: [
                                    Icon(
                                      Icons.bar_chart_outlined,
                                      size: 20,
                                      color: primary,
                                    ),
                                    addHorizontalySpace(1),
                                    Text(
                                      'Tripometer',
                                      style: bodyText12Small(color: black),
                                    )
                                  ],
                                ),
                              addVerticalSpace(4),
                              listo[i]['profession'] != null
                                  ? Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/Vector (1).png',
                                          color: primary,
                                        ),
                                        addHorizontalySpace(1),
                                        Text(
                                          friendsInVicinity[i]['profession'] ??
                                              '',
                                          style: bodyText12Small(color: black),
                                        )
                                      ],
                                    )
                                  : SizedBox(),
                              addVerticalSpace(4),
                              listo[i]['locality'] != null
                                  ? Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: primary,
                                        ),
                                        addHorizontalySpace(1),
                                        Text(
                                          friendsInVicinity[i]['locality'],
                                          style: bodyText12Small(color: black),
                                        )
                                      ],
                                    )
                                  : SizedBox(),
                            ],
                          ),
                          const Spacer(),
                          PopupMenuButton<int>(
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 1,
                                child: Text("Send a message"),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: Text(
                                    "${isFIV ? 'Add' : 'Remove'} trip friend"),
                              ),
                              PopupMenuItem(
                                // value: 3,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  ReportIncorrectUserScreen()));
                                    },
                                    child: Text("Report incorrect")),
                              ),
                            ],
                            color: white,
                            elevation: 2,
                          ),
                        ]),
                    const Divider(
                      height: 30,
                      thickness: 1,
                    )
                  ],
                );
              })),
    );
  }

  filterDialog(BuildContext context) {
    TextEditingController locController = TextEditingController();
    TextEditingController profController = TextEditingController();
    bool ageFilter = false;
    final ages = List<String>.generate(
        100, (int index) => (index + 1).toString(),
        growable: false);
    print(ages);

    var currentValue = '';

    void getFilteredFriendInVicinityList() {
      List allMemberList = permanentList;
      friendsInVicinity.clear();

      for (var element in allMemberList) {
        if (locController.text.isNotEmpty) {
          if ((element['address'] ?? '')
              .toString()
              .toLowerCase()
              .contains(locController.text.toLowerCase())) {
            friendsInVicinity.add(element);
            print('loc ele added');
          }
        } else if (profController.text.isNotEmpty) {
          if ((element['profession'] ?? '')
                  .toString()
                  .toLowerCase()
                  .contains(profController.text.toLowerCase()) &&
              !friendsInVicinity.contains(element)) {
            friendsInVicinity.add(element);
            print('pprof ele added');
          }
        } else if (ageFilter == true) {
          if (element['dob'] != null &&
              element['dob'] != "" &&
              element['dob'] != ' ') {
            var d = element['dob'];
            print(element['UID']);
            print(d);

            List<String> parts = d.split('-');
            print(parts);

            DateTime birthday = DateTime(
                int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));

            DateDuration duration;

            duration = AgeCalculator.age(birthday);
            // print('Your age is $duration');
            print(currentValue);
            if (int.parse(currentValue) == duration.years &&
                !friendsInVicinity.contains(element)) {
              friendsInVicinity.add(element);
              print('age ele added');
            }
          } else {
            continue;
          }
        }
      }
      setState(() {});
      print(friendsInVicinity.length);

      Navigator.pop(context);
    }

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              contentPadding: const EdgeInsets.all(6),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Builder(
                builder: (context) {
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;

                  return Container(
                      height: height * 0.6,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Filter Options',
                            style: bodyText30W600(color: black),
                          ),
                          addVerticalSpace(height * 0.02),
                          Row(
                            children: [
                              Text("by Location : "),
                              Spacer(),
                              Container(
                                width: width * 0.35,
                                child: CustomTextFieldWidget(
                                  labelText: 'location',
                                  controller: locController,
                                ),
                              )
                            ],
                          ),
                          addVerticalSpace(height * 0.01),
                          Row(
                            children: [
                              Text("by Age : ${ageFilter ? currentValue : ''}"),
                              Container(
                                width: width * 0.35,
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  items: ages.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: currentValue,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: ((String? val) {
                                    setState(() {
                                      currentValue = val!;
                                      ageFilter = true;
                                      print('$currentValue -- $val');
                                    });
                                  }),
                                ),
                              )
                            ],
                          ),
                          addVerticalSpace(height * 0.01),
                          Row(
                            children: [
                              Text("by profession : "),
                              Spacer(),
                              Container(
                                width: width * 0.35,
                                child: CustomTextFieldWidget(
                                  labelText: 'profession',
                                  controller: profController,
                                ),
                              )
                            ],
                          ),
                          addVerticalSpace(height * 0.07),
                          SizedBox(
                            width: width * 0.4,
                            child: CustomButton(
                                name: 'Filter',
                                onPressed: () {
                                  getFilteredFriendInVicinityList();
                                }),
                          ),
                          addVerticalSpace(height * 0.01),
                          SizedBox(
                            width: width * 0.4,
                            child: CustomButton(
                                name: 'Clear Filter',
                                onPressed: () {
                                  setState(() {
                                    locController.clear();
                                    profController.clear();
                                    ageFilter = false;
                                    currentValue = '25';
                                  });
                                  getFriendInVicinityList();
                                }),
                          )
                        ],
                      ));
                },
              ),
            ));
  }

  getTripFriend() async {
    var x = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    List tfUIDs = x.data()!['tripFriends'];
    var y = await FirebaseFirestore.instance.collection('users').get();
    for (var element in y.docs) {
      for (var tf in tfUIDs) {
        if (element.data()['UID'] == tf) {
          tripFriend.add(element.data());
        }
      }
    }
    setState(() {
      listo = tripFriend;
      print(listo);
    });
  }
}
