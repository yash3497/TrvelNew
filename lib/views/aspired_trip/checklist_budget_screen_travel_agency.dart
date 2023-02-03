import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/model/save_trip_model.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/widget/custom_button.dart';

import '../../widget/custom_textfield.dart';

class CheckListAndBudgetScreen extends StatefulWidget {
  CheckListAndBudgetScreen({super.key, required this.MP});
  final Map<String,dynamic> MP;
  @override
  State<CheckListAndBudgetScreen> createState() => _CheckListAndBudgetScreenState();
}

class _CheckListAndBudgetScreenState extends State<CheckListAndBudgetScreen> {
  final items = [];
  String _string = 'Take on rent';
  String? selectedValue = '1';

  final TextEditingController iteamcontroller = TextEditingController();
  final TextEditingController amountcontroller = TextEditingController();

  updateitemacarry() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("upcomingtrip")
          .doc(widget.MP['postId'])
          .update({
        "iteamName": FieldValue.arrayUnion([iteamcontroller.text]),
        "ItemType": FieldValue.arrayUnion([_string]),
        "ruppes": FieldValue.arrayUnion([amountcontroller.text])

      });
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(
                'Checklist/Budget',
                style: bodyText18w600(color: black),
              ),
              Spacer(),

              addHorizontalySpace(6),
              InkWell(
                  onTap: () {
                    saveItemforTravel(context);
                  },
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  )),
            ],
          ),
          addVerticalSpace(20),
          Text('Save items that you wish to have for the trip'),
          addVerticalSpace(15),
          SizedBox(
            height: height(context) * 0.23,
            width: width(context) * 0.95,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: height(context) * 0.19,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Camera',
                                style: bodyText14w600(color: black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height(context) * 0.19,
                          child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    Row(children: [
                                      Text('Take on rent'),
                                      Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: primary,
                                      ),
                                    ]),

                                    Text(
                                      'Total',
                                      style: bodyText14w600(color: black),
                                    )
                                  ],
                                ),
                        ),
                        SizedBox(
                          height: height(context) * 0.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1,000',
                                style: bodyText14w600(color: black),
                              ),

                              Text(
                                '1,000',
                                style: bodyText14w600(color: black),
                              ),
                            ],
                          ),
                        ),
                      ])
                ]),
              ),
            ),
          ),
          addVerticalSpace(height(context) * 0.06),
          Center(
            child: SizedBox(
              height: 40,
              width: width(context) * 0.4,
              child: CustomButton(name: 'Save', onPressed: () {}),
            ),
          )
        ]),
      ),
    );
  }

  Future<void> saveItemforTravel(BuildContext context) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
              padding: EdgeInsets.all(12),
              height: height(context) * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: black,
                          ))
                    ],
                  ),
                  CustomTextFieldWidget(
                    //itemList: tripLocation,
                      controller: iteamcontroller,
                    labelText: 'Enter your item',
                  ),
                  addVerticalSpace(20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border(
                        top: BorderSide(
                          color: Colors.black
,                        ),
                          bottom: BorderSide(
                              color: Colors.black
                          ),
                          right: BorderSide(
                              color: Colors.black
                          ),
                          left: BorderSide(
                              color: Colors.black
                          )
                      )
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(left: 20),
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(10),
                        value: _string,
                        isExpanded: true,
                        onChanged: (newValue) {
                          setState(() {
                            _string = newValue!;
                          });
                        },
                        items: ['Take on rent','Carry while travel','Buy while travel']
                            .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: bodytext12Bold(color: black),
                              ),
                            ))
                            .toList(),

                        // add extra sugar..
                        icon: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Icon(
                            Icons.arrow_drop_down,
                          ),
                        ),
                        iconSize: 25,
                        iconEnabledColor: primary,
                        iconDisabledColor: black.withOpacity(0.7),
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                  addVerticalSpace(20),
                  CustomTextFieldWidget(
                    //itemList: tripLocation,
                     controller: amountcontroller,
                    labelText: 'Enter your amount',
                  ),
                  addVerticalSpace(30),
                  CustomButton(name: 'Save', onPressed: (){
                    Navigator.pop(context);
                    updateitemacarry();
                  })
                ],
              ));
        });
      },
    );
    }
}
