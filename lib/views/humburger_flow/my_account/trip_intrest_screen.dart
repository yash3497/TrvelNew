import 'package:flutter/material.dart';
import 'package:travel_app/utils/constant.dart';

import '../../../widget/custom_appbar.dart';
import '../../../widget/custom_button.dart';

class YourTripInterest extends StatefulWidget {
  @override
  _YourTripInterestState createState() => _YourTripInterestState();
}

class _YourTripInterestState extends State<YourTripInterest> {
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(title: 'Trip Interest')),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Adventure',
                        style: bodyText18w600(color: black),
                      ),
                      InkWell(onTap: () {}, child: Text('Select all'))
                    ],
                  ),
                ),
                filterChipWidget(chipName: chipList),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Religious ',
                        style: bodyText18w600(color: black),
                      ),
                      InkWell(onTap: () {}, child: Text('Select all')),
                    ],
                  ),
                ),
                filterChipWidget(chipName: chipList),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nature ',
                        style: bodyText18w600(color: black),
                      ),
                      InkWell(onTap: () {}, child: Text('Select all')),
                    ],
                  ),
                ),
                filterChipWidget(chipName: chipList),
                addVerticalSpace(height(context) * 0.2)
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

  filterChipWidget({required this.chipName});

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * 0.18,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.chipName.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 2.8),
          itemBuilder: (ctx, i) {
            return InkWell(
              onTap: () {
                setState(() {
                  widget.chipName[i]['isSelect'] =
                      !widget.chipName[i]['isSelect'];
                });
              },
              child: Container(
                margin: EdgeInsets.all(5),
                height: height(context) * 0.045,
                width: width(context) * 0.3,
                decoration: widget.chipName[i]['isSelect']
                    ? myFillBoxDecoration(0, primary, 50)
                    : myOutlineBoxDecoration(2, primary, 50),
                child: Center(
                  child: Text(widget.chipName[i]['name']),
                ),
              ),
            );
          }),
    );
  }
}
