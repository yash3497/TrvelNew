import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/views/home/home_screen.dart';

import '../../model/home_model.dart';
import '../../utils/constant.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_overlaping_widget.dart';
import 'festival_and_celebrations_screen.dart';

class ProfileFeedScreen extends StatelessWidget {
  const ProfileFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(
            title: 'Feed',
          )),
      body: Column(
        children: [
          SizedBox(
            height: height(context) * 0.85,
            child: ListView.builder(
                itemCount: 6,
                // physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (ctx, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowDetailsOfFestivals()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      height: height(context) * 0.23,
                      width: width(context),
                      child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'February 25, 2022',
                                style: bodyText14normal(color: black),
                              ),
                              Text(
                                '2.30 PM',
                                style: bodyText12Small(color: black),
                              ),
                              addVerticalSpace(16),
                              Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        width: width(context) * 0.5,
                                        height: height(context) * 0.13,
                                        child: Image.asset(
                                          'assets/images/profilefeed.png',
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                  addHorizontalySpace(20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: width(context) * 0.28,
                                        child: Text(
                                          'Lorem ipsum isa place holder text',
                                          style: bodyText14w600(color: black),
                                        ),
                                      ),
                                      addVerticalSpace(20),
                                      OverlapingImageCustomWidget(
                                          overlap: overlap)
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
