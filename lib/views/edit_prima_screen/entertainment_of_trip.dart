import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final List FreeTime = [
    {'name': "Camping", 'isSelect': false},
    {'name': "Bonfire", 'isSelect': false},
    {'name': "Singing", 'isSelect': false},
    {'name': "Cooking", 'isSelect': false},
    {'name': "Archey", 'isSelect': false},
    {'name': "Reading", 'isSelect': false},
    {'name': "Star Gazing", 'isSelect': false},
    {'name': "Dancing", 'isSelect': false},
    {'name': "Fishing", 'isSelect': false},
    {'name': "Boating", 'isSelect': false},
    {'name': "Shopping", 'isSelect': false},
    {'name': "Arts and crafts", 'isSelect': false},
    {'name': "Casino", 'isSelect': false},
    {'name': "Luxury Stay", 'isSelect': false},
    {'name': "Cruise", 'isSelect': false},
  ];
  final List wellnessList  = [
    {'name': "Yoga", 'isSelect': false},
    {'name': "Medition", 'isSelect': false},
    {'name': "Naturopathy", 'isSelect': false},
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
                    'Free Time',
                    style: bodyText18w600(color: black),
                  ),
                ),
                filterChipWidget(height: 0.37, chipName: FreeTime),
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Wellness ',
                    style: bodyText18w600(color: black),
                  ),
                ),
                filterChipWidget(height: 0.16, chipName: wellnessList),
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
                child: CustomButton(name: 'Save', onPressed: () {
                  Navigator.pop(context);
                }),
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

  String name = "";
  void getdata() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("primaAccount")
          .doc('profile')
          .get();
      name = profile.data()?['firstName'];
    }
    setState(() {
    });
  }
  @override
  void initState() {
    getdata();
    getDetails();
    super.initState();
  }
  List EntertainmentList = [];
  void getDetails() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Prima_Trip_Plan")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      EntertainmentList = profile['Entertainment'];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * widget.height +30,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.chipName.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 1.9),
          itemBuilder: (ctx, i) {
            return GestureDetector(
              onTap: () {
                if (EntertainmentList.contains(widget.chipName[i]['name'])) {
                  EntertainmentList.removeAt(
                      EntertainmentList.indexOf(widget.chipName[i]['name']));
                  CollectionReference users =
                  FirebaseFirestore.instance.collection('users');
                  users
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("Prima_Trip_Plan")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    'Entertainment':
                    FieldValue.arrayRemove([widget.chipName[i]['name']])
                  });
                  setState(() {
                    widget.chipName[i]['isSelect'] =
                    !widget.chipName[i]['isSelect'];
                  });
                  getDetails();
                } else {
                  EntertainmentList.add(widget.chipName[i]['name']);
                  CollectionReference users =
                  FirebaseFirestore.instance.collection('users');
                  users
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("Prima_Trip_Plan")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    'Entertainment':
                    FieldValue.arrayUnion([widget.chipName[i]['name']])
                  });
                  setState(() {
                    widget.chipName[i]['isSelect'] =
                    !widget.chipName[i]['isSelect'];
                  });
                  getDetails();
                }
              },
              child: Column(
                children: [
                  widget.chipName[i]['isSelect']
                      ? Text(
                          '$name',
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
                  if(EntertainmentList.contains(widget.chipName[i]['name']))
                    Text(
                      '$name',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: black),
                    )else
                    Text(
                      '',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: black),
                    ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: height(context) * 0.045,
                    width: width(context) * 0.3,
                    decoration: EntertainmentList.contains(widget.chipName[i]['name'])
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
