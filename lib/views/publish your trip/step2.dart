
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/widget/custom_dropdown_button.dart';

import '../../model/prima_profile_model.dart';
import 'add_tourist_spots.dart';

addStep2PublishTripDetails() async {
  // Call the user's CollectionReference to add a new user
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  users
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("Prima_Trip_Plan")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
    "Include in trip": DoInTripController.text,

  })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
final TextEditingController DoInTripController = TextEditingController();


class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {


  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('TripState')
      .doc('karnataka')
      .collection('TripCity')
  .doc('Bengaluru')
  .collection('touristSport');

  Future<void> getalltData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    // Get data from docs and convert map to List
    allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    setState(() {
    });
    print(allData);

  }
  List allData = [];

  CollectionReference _collectionRef2 =
  FirebaseFirestore.instance.collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Prima_Trip_Plan')
      .doc(FirebaseAuth.instance.currentUser!.uid)
  .collection('tourisprot');

  Future<void> getalltouristData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef2.get();
    // Get data from docs and convert map to List
    allDataTot = querySnapshot.docs.map((doc) => doc.data()).toList();
    setState(() {
    });
    print(allDataTot);

  }
  List allDataTot = [];


  String place = "";
  void getTripCityData() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('TripState')
          .doc('karnataka')
          .collection('TripCity')
          .doc('Bengaluru')
          .get();
      // touritSportDes = profile.data()?['TouristSportDesc'];
      place = profile.data()?['name'];
    }
    setState(() {
    });
  }

  @override
  void initState() {
    // getDetails();
    getalltData();
    getalltouristData();
    getTripCityData();
    super.initState();
  }
  // final List<String> tripLocation = ['Pune', 'Mumbai', 'chennai'];
  // void getDetails() async {
  //   if (FirebaseAuth.instance.currentUser != null) {
  //     var profile = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .collection('Prima_Trip_Plan')
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .get();
  //     DoInTripController.text = profile.data()?['Include in trip'];
  //
  //     setState(() {});
  //   }
  // }

  showSnackBar(BuildContext context, String str, [Color clr = Colors.black]) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(str),
      backgroundColor: clr,
    ));
  }
bool isClick = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addVerticalSpace(10),
        Container(
            decoration: myOutlineBoxDecoration(2, black.withOpacity(0.1), 15),
            width: width(context) * 0.94,
            // height: height(context) * 0.08,
            child: TextField(
                controller: DoInTripController,
                maxLines: 3,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    hintStyle: bodyText13normal(color: black),
                    hintText: 'What you’ll do in Trip'))),
        addVerticalSpace(25),
        Text(
          'Click to add it in the trip',
          style: bodyText16w600(color: black),
        ),
        addVerticalSpace(10),
        SizedBox(
          height: height(context) * 0.20,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: allData.length,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            allData[i]['ischeck'] = !allData[i]['ischeck'];
                          });
                          allData[i]['ischeck'] == true ?
                          showSnackBar(
                              context, "Your tourist sport has been Added.", primary)
                          : showSnackBar(
                              context, "Your tourist sport has been Deleted.", primary);
                            // Call the user's CollectionReference to add a new user
                             CollectionReference users = FirebaseFirestore.instance.collection('users');
                            users
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .collection("Prima_Trip_Plan")
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .collection("tourisprot")
                                .add({
                              "TouristSportImage": allData[i]['image'],
                              "TouristSportName": allData[i]['name'],
                              "touristDes": allData[i]['about'],
                              "address":place,
                              "ischeck":allData[i]['ischeck']

                            })
                                .then((value) => print("User Added"))
                                .catchError((error) => print("Failed to add user: $error"));

                          setState(() {

                          });
                        },
                        child:
                        Container(
                          height: height(context) * 0.11,
                          width: width(context) * 0.23,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(allData[i]['image']))),
                            child:
                            // isClick?
                            allData[i]['ischeck'] ?
                                Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.all(Radius.circular(10))
                                 ),
                                 alignment: Alignment.topRight,
                                  child: Container(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset('assets/images/bGgyE.png')),
                                )
                                :Text("")
                        ),
                      ),
                        SizedBox(
                          child: Text('       ${allData[i]['name']}',
                            overflow: TextOverflow.ellipsis,
                          ),
                          width: width(context) * 0.30,
                        ),

                    ],
                  ),
                );
              }),
        ),
        addVerticalSpace(15),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => AddTouristPointScreen()));
          },
          child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text:
                    'Not found the Tourist spot, you can select either the nearest spot or add tourist spot ',
                    style: bodyText12Small(color: black)),
                TextSpan(text: 'here', style: bodyText12Small(color: primary))
              ])),
        ),
      ],
    );
  }
}

