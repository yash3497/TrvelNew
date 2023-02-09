import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/humburger_flow/trip_library_screen.dart';
import 'package:travel_app/widget/custom_button.dart';

class SaveTripStep1 extends StatefulWidget {
  SaveTripStep1({super.key});

  @override
  State<SaveTripStep1> createState() => _SaveTripStep1State();
}

class _SaveTripStep1State extends State<SaveTripStep1> {
  final List dayWiseList = [
    'Day 1',
    'Day 2',
    // 'Day 3',
    // 'Day 4',
    'Bonus Tourist Spot'
  ];

  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('Aspired_trips');

  Future<void> getData() async {
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
  getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Trek to Sinhagad, Maharashtra Trip',
            style: TextStyle(fontSize: 18, color: black)),
        Text('Your travel sightseeing'),
        addVerticalSpace(15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height(context) * 0.75,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dayWiseList.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          // InkWell(
                          //   onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             TripLibraryDetailsScreen()));
                         //   },
                        //    child:
                            Row(
                              children: [
                                SizedBox(
                                    height: height(context) * 0.12,
                                    width: width(context) * 0.24,
                                    child: Image.network(
                                      allData[0]['shportImage'][i],
                                      fit: BoxFit.fill,
                                    )),
                                addHorizontalySpace(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          dayWiseList[i],
                                          style: bodyText18w600(color: black),
                                        ),
                                        addHorizontalySpace(8),
                                        if (i == 4)
                                          InkWell(
                                            onTap: () {
                                              showDialogBox(context);
                                            },
                                            child: Icon(
                                              Icons.help,
                                              color: black.withOpacity(0.5),
                                            ),
                                          )
                                      ],
                                    ),
                                    addVerticalSpace(6),
                                    SizedBox(
                                      width: width(context) * 0.5,
                                      child: Text(
                                        allData[0]['Days'][i],
                                        style: bodyText14normal(color: black),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                       //   ),
                          // addVerticalSpace(15),
                          const Divider(
                            height: 30,
                            thickness: 1,
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        )
      ],
    );
  }

  showDialogBox(BuildContext context) {
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
                      height: height * 0.22,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Dummy Dialog',
                            style: bodyText16w600(color: black),
                          ),
                          Text(
                            'Your request has been sent. Alexander will be your trip friend, after she accepts your request ',
                            textAlign: TextAlign.center,
                            style: bodyText13normal(color: black),
                          ),
                          // addVerticalSpace(height * 0.07),
                          SizedBox(
                            width: width * 0.4,
                            child: CustomButton(
                                name: 'Okay',
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          )
                        ],
                      ));
                },
              ),
            ));
  }
}
