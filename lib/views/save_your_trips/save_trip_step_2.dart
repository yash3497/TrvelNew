import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
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

  int currentIndex1 = 0;
  int currentIndex2 = 1;
  int currentIndex3 = 2;
  String startplace = "";
  String endplace = "";
  String mode = "";
  void getData() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Plan_trip')
      .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      startplace = profile.data()?['StartTrip'];
      endplace = profile.data()?['endtrip'];
      mode = profile.data()?['tripmode'];

    }
    setState(() {

    });
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Mode of Travel', style: TextStyle(fontSize: 20, color: black)),
        addVerticalSpace(15),
        Text('Departure city'),
        Text(
          '$startplace',
          style: bodyText16w600(color: black),
        ),
        addVerticalSpace(10),
        Icon(Icons.arrow_downward),
        addVerticalSpace(10),
        Text('Trip Destination'),
        Text(
          '$endplace',
          style: bodyText16w600(color: black),
        ),
        const Divider(
          height: 30,
          thickness: 1,
        ),
        InkWell(
          onTap: (){
            TravelMode(context);
          },
          child: SizedBox(
            height: height(context) * 0.15,
            child: ListView.builder(
                itemCount: saveTripList.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, i) {
                  return  Column(
                      children: [
                        if(mode == 'Bus')
                         Container(
                            height: height(context) * 0.1,
                            width: width(context) * 0.23,
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(12),
                            decoration: currentIndex1 == i
                                ? myFillBoxDecoration(0, primary, 10)
                                : myFillBoxDecoration(0, white, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Image.asset(
                                    saveTripList[i]['img'],
                                    color: currentIndex1 == i ? white : primary,
                                  ),
                                ),
                                addVerticalSpace(10),
                                Text(
                                  saveTripList[i]['name'],
                                  style: bodyText16w600(color: black),
                                )
                              ],
                            ),
                        )else if(mode == 'Train')
                          Container(
                            height: height(context) * 0.1,
                            width: width(context) * 0.23,
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(12),
                            decoration: currentIndex2 == i
                                ? myFillBoxDecoration(0, primary, 10)
                                : myFillBoxDecoration(0, white, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Image.asset(
                                    saveTripList[i]['img'],
                                    color: currentIndex2 == i ? white : primary,
                                  ),
                                ),
                                addVerticalSpace(10),
                                Text(
                                  saveTripList[i]['name'],
                                  style: bodyText16w600(color: black),
                                )
                              ],
                            ),
                          )else
                          Container(
                            height: height(context) * 0.1,
                            width: width(context) * 0.23,
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(12),
                            decoration: currentIndex3 == i
                                ? myFillBoxDecoration(0, primary, 10)
                                : myFillBoxDecoration(0, white, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Image.asset(
                                    saveTripList[i]['img'],
                                    color: currentIndex3 == i ? white : primary,
                                  ),
                                ),
                                addVerticalSpace(10),
                                Text(
                                  saveTripList[i]['name'],
                                  style: bodyText16w600(color: black),
                                )
                              ],
                            ),
                          )
                      ],
                    );

                }),
          ),
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
        if(mode=='Bus')
        SizedBox(
          width: width(context) * 0.56,
          child: CustomDropDownButton(
            itemList: ['Yes', 'No'],
            lableText: '  Bus booking  ',
          ),
        )else if(mode == 'Train')
          SizedBox(
            width: width(context) * 0.56,
            child: CustomDropDownButton(
              itemList: ['Yes', 'No'],
              lableText: '  Train booking  ',
            ),
          )else
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
  TravelMode(BuildContext context) {

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          contentPadding: const EdgeInsets.all(6),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          content: Builder(
            builder: (context) {
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;

              return Container(
                height: 200,
                child: Center(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top: 50,left: 20,right: 10),
                        child: Text('your travel mode is aleready selected. So now \n          you can not change Travel Mode. ',style: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily),),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
