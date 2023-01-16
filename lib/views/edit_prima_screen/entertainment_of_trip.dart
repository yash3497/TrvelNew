import 'package:flutter/material.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/widget/custom_button.dart';

import '../../../widget/custom_appbar.dart';

class EntertainmentOfTripScreen extends StatefulWidget {
  @override
  _EntertainmentOfTripScreenState createState() =>
      _EntertainmentOfTripScreenState();
}

class _EntertainmentOfTripScreenState extends State<EntertainmentOfTripScreen> {
  List chipList = [
    {'name': "Camping", 'isSelect': false},
    {'name': "Waterfalls", 'isSelect': false},
    {'name': "Hills and Trek", 'isSelect': false},
    {'name': "Biking", 'isSelect': false},
    {'name': "Safari", 'isSelect': false},
    {'name': "Water Sports", 'isSelect': false},
    {'name': "Mangroves", 'isSelect': false},
    {'name': "Tribal", 'isSelect': false},
    {'name': "Ropeways", 'isSelect': false},
  ];
  final List sportsList = [
    {'name': "Cricket", 'isSelect': false},
    {'name': "Batminton", 'isSelect': false},
    {'name': "Vally Ball", 'isSelect': false},
    {'name': "Football", 'isSelect': false},
    {'name': "Archery", 'isSelect': false},
    {'name': "Swimming", 'isSelect': false},
  ];
  final List natureList = [
    {'name': "Binding", 'isSelect': false},
    {'name': "Jungle Safari", 'isSelect': false},
    {'name': "Hiking", 'isSelect': false},
    {'name': "Sunrise/Sunset", 'isSelect': false},
    {'name': "Vaily & River", 'isSelect': false},
    {'name': "Botony", 'isSelect': false},
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(title: 'Entertainment of Trip')),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "What excites you?",
                      style: bodyText20w700(color: black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Adventure',
                    style: bodyText18w600(color: black),
                  ),
                ),
                filterChipWidget(height: 0.23, chipName: chipList),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Sports',
                    style: bodyText18w600(color: black),
                  ),
                ),
                filterChipWidget(height: 0.15, chipName: sportsList),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Religious ',
                    style: bodyText18w600(color: black),
                  ),
                ),
                filterChipWidget(height: 0.23, chipName: chipList),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Nature ',
                    style: bodyText18w600(color: black),
                  ),
                ),
                filterChipWidget(height: 0.16, chipName: natureList),
                addVerticalSpace(height(context) * 0.09),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: width(context) * 0.25,
            child: Center(
              child: SizedBox(
                width: width(context) * 0.5,
                child: CustomButton(name: 'Save', onPressed: () {}),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class filterChipWidget extends StatefulWidget {
  final List chipName;
  final double height;

  filterChipWidget({required this.chipName, required this.height});

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * widget.height,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.chipName.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 2.1),
          itemBuilder: (ctx, i) {
            return InkWell(
              onTap: () {
                setState(() {
                  widget.chipName[i]['isSelect'] =
                      !widget.chipName[i]['isSelect'];
                });
              },
              child: Column(
                children: [
                  widget.chipName[i]['isSelect']
                      ? Text(
                          'Sumit',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: black),
                        )
                      : Text(
                          '',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: height(context) * 0.04,
                    width: width(context) * 0.3,
                    decoration: widget.chipName[i]['isSelect']
                        ? myFillBoxDecoration(0, primary, 8)
                        : myOutlineBoxDecoration(2, primary, 8),
                    child: Center(
                      child: Text(widget.chipName[i]['name']),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
