import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                AdventurefilterChipWidget(chipName: chipList),
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
                NaturefilterChipWidget(chipName: chipList),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'City ',
                        style: bodyText18w600(color: black),
                      ),
                      InkWell(onTap: () {}, child: Text('Select all')),
                    ],
                  ),
                ),
                CityfilterChipWidget(chipName: chipList),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Religlous ',
                        style: bodyText18w600(color: black),
                      ),
                      InkWell(onTap: () {}, child: Text('Select all')),
                    ],
                  ),
                ),
                ReliglousfilterChipWidget(chipName: chipList),
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
                child: CustomButton(name: 'Save',
                    onPressed: () {
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

class YourNatureInterest extends StatefulWidget {
  @override
  _YourNatureInterestState createState() => _YourNatureInterestState();
}

class _YourNatureInterestState extends State<YourNatureInterest> {



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
                        'Nature ',
                        style: bodyText18w600(color: black),
                      ),
                      InkWell(onTap: () {}, child: Text('Select all')),
                    ],
                  ),
                ),
                NaturefilterChipWidget(chipName: chipList),
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
                child: CustomButton(
                    name: 'Save',
                    onPressed: () {
                      Navigator.pop(context);
                    }
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
class YourAdventureInterest extends StatefulWidget {
  @override
  _YourAdventureInterestState createState() => _YourAdventureInterestState();
}

class _YourAdventureInterestState extends State<YourAdventureInterest> {
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
                      InkWell(onTap: () {}, child: Text('Select all')),
                    ],
                  ),
                ),
                AdventurefilterChipWidget(chipName: chipList),
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
                child: CustomButton(name: 'Save',
                    onPressed: () {
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
class YourCityInterest extends StatefulWidget {
  @override
  _YourCityInterestState createState() => _YourCityInterestState();
}

class _YourCityInterestState extends State<YourCityInterest> {
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
                        'City',
                        style: bodyText18w600(color: black),
                      ),
                      InkWell(onTap: () {}, child: Text('Select all')),
                    ],
                  ),
                ),
                CityfilterChipWidget(chipName: chipList),
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
                child: CustomButton(name: 'Save',
                    onPressed: () {
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
class YourReliglousInterst extends StatefulWidget {
  @override
  _YourReliglousInterstState createState() => _YourReliglousInterstState();
}

class _YourReliglousInterstState extends State<YourReliglousInterst> {
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
                        'Religlous',
                        style: bodyText18w600(color: black),
                      ),
                      InkWell(onTap: () {}, child: Text('Select all')),
                    ],
                  ),
                ),
                ReliglousfilterChipWidget(chipName: chipList),
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
                child: CustomButton(name: 'Save',
                    onPressed: () {
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
class NaturefilterChipWidget extends StatefulWidget {
  final List chipName;

  NaturefilterChipWidget({required this.chipName});

  @override
  _NaturefilterChipWidgetState createState() => _NaturefilterChipWidgetState();
}

class _NaturefilterChipWidgetState extends State<NaturefilterChipWidget> {


  void initState() {
    getDetails();
    super.initState();
  }
  var _isSelected = false;
  List NatureList = [];
  void getDetails() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("primaAccount")
          .doc("profile")
          .get();
      NatureList = profile['Nature'];
      setState(() {});
    }
  }
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
                    if (NatureList.contains(widget.chipName[i]['name'])) {
                      NatureList
                          .removeAt(NatureList.indexOf(widget.chipName[i]['name']));
                      CollectionReference users = FirebaseFirestore.instance
                            .collection('users');
                              users
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection("primaAccount")
                            .doc("profile")
                           .update({
                        'Nature':
                        FieldValue.arrayRemove([widget.chipName[i]['name']])
                      });
                      setState(() {});
                      getDetails();
                    } else {
                      NatureList.add(widget.chipName[i]['name']);
                      CollectionReference users = FirebaseFirestore.instance
                          .collection('users');
                      users
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection("primaAccount")
                          .doc("profile")
                          .update({
                        'Nature':
                        FieldValue.arrayUnion([widget.chipName[i]['name']])
                      });
                      setState(() {});
                      getDetails();
                    }
                  },
                  child:
                    Container(
                    margin: EdgeInsets.all(5),
                height: height(context) * 0.045,
                width: width(context) * 0.3,
                decoration: NatureList.contains(widget.chipName[i]['name'])
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

class ReliglousfilterChipWidget extends StatefulWidget {
  final List chipName;

  ReliglousfilterChipWidget({required this.chipName});

  @override
  _ReliglousfilterChipWidgetState createState() => _ReliglousfilterChipWidgetState();
}

class _ReliglousfilterChipWidgetState extends State<ReliglousfilterChipWidget> {


  void initState() {
    getDetails();
    super.initState();
  }
  var _isSelected = false;
  List NatureList = [];
  void getDetails() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("primaAccount")
          .doc("profile")
          .get();
      NatureList = profile['Religlous'];
      setState(() {});
    }
  }
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
                if (NatureList.contains(widget.chipName[i]['name'])) {
                  NatureList
                      .removeAt(NatureList.indexOf(widget.chipName[i]['name']));
                  CollectionReference users = FirebaseFirestore.instance
                      .collection('users');
                  users
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("primaAccount")
                      .doc("profile")
                      .update({
                    'Religlous':
                    FieldValue.arrayRemove([widget.chipName[i]['name']])
                  });
                  setState(() {});
                  getDetails();
                } else {
                  NatureList.add(widget.chipName[i]['name']);
                  CollectionReference users = FirebaseFirestore.instance
                      .collection('users');
                  users
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("primaAccount")
                      .doc("profile")
                      .update({
                    'Religlous':
                    FieldValue.arrayUnion([widget.chipName[i]['name']])
                  });
                  setState(() {});
                  getDetails();
                }
              },
              child:
              Container(
                margin: EdgeInsets.all(5),
                height: height(context) * 0.045,
                width: width(context) * 0.3,
                decoration: NatureList.contains(widget.chipName[i]['name'])
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

class CityfilterChipWidget extends StatefulWidget {
  final List chipName;

  CityfilterChipWidget({required this.chipName});

  @override
  _CityfilterChipWidgetState createState() => _CityfilterChipWidgetState();
}

class _CityfilterChipWidgetState extends State<CityfilterChipWidget> {


  void initState() {
    getDetails();
    super.initState();
  }
  var _isSelected = false;
  List NatureList = [];
  void getDetails() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("primaAccount")
          .doc("profile")
          .get();
      NatureList = profile['City'];
      setState(() {});
    }
  }
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
                if (NatureList.contains(widget.chipName[i]['name'])) {
                  NatureList
                      .removeAt(NatureList.indexOf(widget.chipName[i]['name']));
                  CollectionReference users = FirebaseFirestore.instance
                      .collection('users');
                  users
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("primaAccount")
                      .doc("profile")
                      .update({
                    'City':
                    FieldValue.arrayRemove([widget.chipName[i]['name']])
                  });
                  setState(() {});
                  getDetails();
                } else {
                  NatureList.add(widget.chipName[i]['name']);
                  CollectionReference users = FirebaseFirestore.instance
                      .collection('users');
                  users
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("primaAccount")
                      .doc("profile")
                      .update({
                    'City':
                    FieldValue.arrayUnion([widget.chipName[i]['name']])
                  });
                  setState(() {});
                  getDetails();
                }
              },
              child:
              Container(
                margin: EdgeInsets.all(5),
                height: height(context) * 0.045,
                width: width(context) * 0.3,
                decoration: NatureList.contains(widget.chipName[i]['name'])
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

class AdventurefilterChipWidget extends StatefulWidget {
  final List chipName;

  AdventurefilterChipWidget({required this.chipName});

  @override
  _AdventurefilterChipWidgetState createState() => _AdventurefilterChipWidgetState();
}

class _AdventurefilterChipWidgetState extends State<AdventurefilterChipWidget> {


  void initState() {
    getDetails();
    super.initState();
  }
  var _isSelected = false;
  List NatureList = [];
  void getDetails() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("primaAccount")
          .doc("profile")
          .get();
      NatureList = profile['Adventure'];
      setState(() {});
    }
  }
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
                if (NatureList.contains(widget.chipName[i]['name'])) {
                  NatureList
                      .removeAt(NatureList.indexOf(widget.chipName[i]['name']));
                  CollectionReference users = FirebaseFirestore.instance
                      .collection('users');
                  users
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("primaAccount")
                      .doc("profile")
                      .update({
                    'Adventure':
                    FieldValue.arrayRemove([widget.chipName[i]['name']])
                  });
                  setState(() {});
                  getDetails();
                } else {
                  NatureList.add(widget.chipName[i]['name']);
                  CollectionReference users = FirebaseFirestore.instance
                      .collection('users');
                  users
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("primaAccount")
                      .doc("profile")
                      .update({
                    'Adventure':
                    FieldValue.arrayUnion([widget.chipName[i]['name']])
                  });
                  setState(() {});
                  getDetails();
                }
              },
              child:
              Container(
                margin: EdgeInsets.all(5),
                height: height(context) * 0.045,
                width: width(context) * 0.3,
                decoration: NatureList.contains(widget.chipName[i]['name'])
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