import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';
import 'package:travel_app/views/humburger_flow/tourist_spot_screen.dart';
import 'package:travel_app/views/humburger_flow/trip_library_screen.dart';

class StoryPageView extends StatefulWidget {
  const StoryPageView({Key? key}) : super(key: key);

  @override
  State<StoryPageView> createState() => _StoryPageViewState();
}

class _StoryPageViewState extends State<StoryPageView> {

  int days = 0;
  void getTripData() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Plan_trip')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      days = profile.data()?['totalDays'];

    }
    setState(() {
    });
  }
  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('tripstate')
      .doc('karnataka')
      .collection('tripcity')
      .doc('Bengaluru')
      .collection('touristSport');
  Future<void> getallData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    // Get data from docs and convert map to List
    allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    setState(() {
    });
    print(allData);
  }
  List allData = [];


  @override
  void initState() {
    getTripData();
    getallData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller =StoryController();
    final List<StoryItem> storyItem = [
      for(int i=0; i<days;i++)

      StoryItem(TouristSpotsScreen2(MP: allData[i],),  duration: Duration(milliseconds: 30000)),

    ];
    return StoryView(
        storyItems: storyItem,
        controller: controller,
     // inline: false,
      repeat: true,
    );
  }
}
