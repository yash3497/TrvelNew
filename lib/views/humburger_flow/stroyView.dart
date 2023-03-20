import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';
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

  @override
  Widget build(BuildContext context) {
    final controller =StoryController();
    final List<StoryItem> storyItem = [
      for(int i=0; i<=days;i++)
      StoryItem(TripLibraryDetailsScreen2(),  duration: Duration(milliseconds: 5000)),
      StoryItem(TripLibraryDetailsScreen2(),  duration: Duration(milliseconds: 5000)),
      StoryItem(TripLibraryDetailsScreen2(),  duration: Duration(milliseconds: 5000)),

    ];
    return StoryView(
        storyItems: storyItem,
        controller: controller,
     // inline: false,
      repeat: true,
    );
  }
}
