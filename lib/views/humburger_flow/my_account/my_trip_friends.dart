import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/views/humburger_flow/my_account/my_following_trip_friends.dart';
import 'package:travel_app/views/humburger_flow/my_account/report_incorrect_user_screen.dart';
import 'package:travel_app/views/start/sign_in_screen.dart';
import 'package:travel_app/widget/custom_appbar.dart';

import '../../../utils/constant.dart';
import '../../../widget/custom_button.dart';

class MyTripFriendsScreen extends StatefulWidget {
  MyTripFriendsScreen({required this.title});
  String title;

  @override
  State<MyTripFriendsScreen> createState() => _MyTripFriendsScreenState();
}

class _MyTripFriendsScreenState extends State<MyTripFriendsScreen> {
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(15),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyfollowingFriendScreen()));
            },
            child: const Text(
              'You have trip friend request',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  ),
            ),
          ),
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
              itemCount: 16,
              itemBuilder: (ctx, i) {
                return Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/nearbyfestivals.png'),
                            radius: 30,
                          ),
                          addHorizontalySpace(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sumit patil',
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
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/Vector (1).png',
                                    color: primary,
                                  ),
                                  addHorizontalySpace(1),
                                  Text(
                                    'Software Developer',
                                    style: bodyText12Small(color: black),
                                  )
                                ],
                              ),
                              addVerticalSpace(4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: primary,
                                  ),
                                  addHorizontalySpace(1),
                                  Text(
                                    'Pune',
                                    style: bodyText12Small(color: black),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          PopupMenuButton<int>(
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 1,
                                child: Text("Send a message"),
                              ),
                              const PopupMenuItem(
                                value: 2,
                                child: Text("Remove trip friend"),
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
                      height: height * 0.35,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Filter Options',
                            style: bodyText30W600(color: black),
                          ),
                          Text('Client explain it later'),
                          addVerticalSpace(height * 0.07),
                          SizedBox(
                            width: width * 0.4,
                            child: CustomButton(
                                name: 'Okay',
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          )
                        ],
                      ));
                },
              ),
            ));
  }
}
