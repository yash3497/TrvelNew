import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/views/edit_prima_screen/trip_members_screen.dart';

import '../../utils/constant.dart';
import 'entertainment_of_trip.dart';

class EntertainmentTab extends StatelessWidget {
  EntertainmentTab({super.key});
  final List picList = [
    {'img': 'assets/images/ent1.png', 'name': 'Hiking'},
    {'img': 'assets/images/ent2.png', 'name': 'Camping'},
    {'img': 'assets/images/ent3.png', 'name': 'Cooking'},
    {'img': 'assets/images/ent4.png', 'name': 'Singing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addVerticalSpace(10),
          Row(
            children: [
              Text(
                'Entertainment',
                style: bodyText16w600(color: black),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => EntertainmentOfTripScreen()));
                },
                child: Icon(
                  Icons.add_circle,
                  color: primary,
                  size: 30,
                ),
              )
            ],
          ),
          addVerticalSpace(15),
          SizedBox(
            height: height(context) * 0.16,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: picList.length,
                itemBuilder: (ctx, i) {
                  return Column(
                    children: [
                      SizedBox(
                        height: height(context) * 0.13,
                        width: width(context) * 0.35,
                        child: Image.asset(
                          picList[i]['img'],
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(picList[i]['name'])
                    ],
                  );
                }),
          ),
          addVerticalSpace(15),
          Center(
            child: Container(
              height: height(context) * 0.3,
              width: width(context) * 0.65,
              decoration: myFillBoxDecoration(0, black.withOpacity(0.1), 10),
              child: const Center(
                child: Icon(
                  Icons.image,
                  size: 50,
                ),
              ),
            ),
          ),
          addVerticalSpace(20),
          Text(
            'Meeting point & Time',
            style: bodyText14w600(color: black),
          ),
          SizedBox(
            width: width(context) * 0.67,
            child: Text(
                'Mc Donald, Near Thane Railway Station (W) Saturday 12th Oct 2022 12:00 PM'),
          ),
          addVerticalSpace(height(context) * 0.1)
        ],
      ),
    );
  }
}
