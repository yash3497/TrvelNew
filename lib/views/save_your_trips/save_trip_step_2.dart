import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/widget/custom_dropdown_button.dart';

class SaveTripStep2 extends StatefulWidget {
  SaveTripStep2({super.key});

  @override
  State<SaveTripStep2> createState() => _SaveTripStep2State();
}

class _SaveTripStep2State extends State<SaveTripStep2> {
  final List saveTripList = [
    {'img': 'assets/images/road.png', 'name': 'Road'},
    {'img': 'assets/images/train.png', 'name': 'Train'},
    {'img': 'assets/images/plane.png', 'name': 'Flight'},
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Mode of Travel', style: TextStyle(fontSize: 20, color: black)),
        addVerticalSpace(15),
        Text('Departure city'),
        Text(
          'Mumbai, Maharashtra',
          style: bodyText16w600(color: black),
        ),
        addVerticalSpace(10),
        Icon(Icons.arrow_downward),
        addVerticalSpace(10),
        Text('Trip Destination'),
        Text(
          'Sinhagad, Maharashtra',
          style: bodyText16w600(color: black),
        ),
        const Divider(
          height: 30,
          thickness: 1,
        ),
        SizedBox(
          height: height(context) * 0.15,
          child: ListView.builder(
              itemCount: saveTripList.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) {
                return InkWell(
                  onTap: () {
                    currentIndex = i;
                    setState(() {});
                  },
                  child: Column(
                    children: [
                      Container(
                        height: height(context) * 0.1,
                        width: width(context) * 0.23,
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(12),
                        decoration: currentIndex == i
                            ? myFillBoxDecoration(0, primary, 10)
                            : myFillBoxDecoration(0, white, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 30,
                              child: Image.asset(
                                saveTripList[i]['img'],
                                color: currentIndex == i ? white : primary,
                              ),
                            ),
                            addVerticalSpace(10),
                            Text(
                              saveTripList[i]['name'],
                              style: bodyText16w600(color: black),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
        const Divider(
          height: 30,
          thickness: 1,
        ),
        const Text(
            'If required, Our travel partners may request you change in travel due to seat availability and Itinerary as per travel convenience '),
        const Divider(
          height: 30,
          thickness: 1,
        ),
        addVerticalSpace(15),
        SizedBox(
          width: width(context) * 0.56,
          child: CustomDropDownButton(
            itemList: ['Yes', 'No'],
            lableText: '  Flight booking  ',
          ),
        ),
        addVerticalSpace(15),
        Text('It will take 8 hours to reach')
      ],
    );
  }
}
