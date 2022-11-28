import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../utils/constant.dart';
import 'create_prima_profile.dart';

class TripoMeterManage extends StatelessWidget {
  const TripoMeterManage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height(context) * 1.15,
          child: Stack(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    height: height(context) * 0.42,
                    width: width(context) * 1,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/prima3.png'))),
                    child: SafeArea(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: white,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Text(
                              'Tripometer',
                              style: bodyText20w700(color: white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 12.0, top: 10),
                            child: ImageIcon(
                                color: white,
                                const AssetImage(
                                  'assets/images/editicon.png',
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: height(context) * 0.38,
                    child: Container(
                      height: height(context),
                      padding: EdgeInsets.all(10),
                      width: width(context) * 1,
                      decoration: shadowDecoration(20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alexander Doe',
                            style: bodyText30W600(color: black),
                          ),
                          Container(
                            decoration: shadowDecoration(5, 2),
                            height: 23,
                            width: width(context) * 0.35,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Verified Member',
                                    style: bodytext12Bold(color: black),
                                  ),
                                  Icon(
                                    Icons.help,
                                    color: black.withOpacity(0.4),
                                    size: 20,
                                  ),
                                ]),
                          ),
                          const Divider(
                            height: 35,
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'What excites you?',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.edit_note))
                            ],
                          ),
                          addVerticalSpace(10),
                          WhatExcitesYouWidget(),
                          addVerticalSpace(20),
                          const Text(
                            'My Tripometer',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          addVerticalSpace(10),
                          TripometerWidget(),
                          addVerticalSpace(20),
                          Text(
                            "*'As you like adjust the trip type to highlight it in your profile",
                            style: bodyText12Small(color: black),
                          ),
                          addVerticalSpace(30)
                        ],
                      ),
                    ))
              ]),
        ),
      ),
    );
  }
}
