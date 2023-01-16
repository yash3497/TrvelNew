import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/aspired_trip/travel_agency_details.dart';
import 'package:travel_app/views/humburger_flow/upcoming_trips.dart';
import 'package:travel_app/widget/custom_appbar.dart';
import 'package:travel_app/widget/custom_button.dart';
import 'package:travel_app/widget/custom_dropdown_button.dart';

import '../../model/save_trip_model.dart';

class SaveTripAndGetQuote extends StatefulWidget {
  const SaveTripAndGetQuote({required this.message1, required this.message2});

  final String message1;
  final String message2;
  @override
  State<SaveTripAndGetQuote> createState() => _SaveTripAndGetQuoteState();
}

class _SaveTripAndGetQuoteState extends State<SaveTripAndGetQuote> {
  TextEditingController dateinput = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(
            title: 'Save trip and get free quote \n      for Udupi, Karnataka',
          )),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: height(context) * 0.9,
        width: width(context) * 0.95,
        decoration: shadowDecoration(10, 7),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Booking id: 540986',
                      style: bodyText16w600(color: black),
                    ),
                    Text(
                      'Your contact detail',
                      style: bodyText14w600(color: primary),
                    )
                  ],
                )
              ],
            ),
            addVerticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width(context) * 0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Departure City',
                                style: bodyText14normal(
                                    color: Color.fromRGBO(185, 185, 185, 1)),
                              ),
                              Text(
                                'Mumbai',
                                style: bodyText14w600(color: black),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Trip Destination',
                                style: bodyText14normal(
                                    color: Color.fromRGBO(185, 185, 185, 1)),
                              ),
                              Text(
                                'Karnataka',
                                style: bodyText14w600(color: black),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    addVerticalSpace(10),
                    SizedBox(
                      width: width(context) * 0.65,
                      height: 40,
                      child: TextField(
                        controller: dateinput,
                        onTap: () async {
                          var pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));
                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            log(formattedDate);

                            setState(() {
                              dateinput.text = formattedDate;
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.calendar_today_rounded,
                            color: primary,
                          ),
                          labelText: 'Departure date',
                          labelStyle: bodyText14w600(color: primary),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primary,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primary,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: isChecked,
                            activeColor: primary,
                            checkColor: black,
                            onChanged: (value) {
                              isChecked = !isChecked;
                              setState(() {});
                            }),
                        Text(
                          'I’m Flexible with date',
                          style: bodyText13normal(color: black),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  height: height(context) * 0.11,
                  width: width(context) * 0.2,
                  decoration: myOutlineBoxDecoration(2, primary, 10),
                  child: Column(
                    children: [
                      Text(
                        '7',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Days',
                        style: bodyText14w600(color: black),
                      )
                    ],
                  ),
                )
              ],
            ),
            addVerticalSpace(25),
            Text(
              'Trip type',
              style: bodyText16w600(color: black),
            ),
            TripTypeWidget(),
            addVerticalSpace(20),
            Text(
              'Travellers',
              style: bodyText16w600(color: black),
            ),
            addVerticalSpace(15),
            TravellersAdultAndChildenSelectWidget(),
            addVerticalSpace(25),
            Text(
              'Preferred Hotel type',
              style: bodyText16w600(color: black),
            ),
            Text(
              'Conditions to Hotel type available in the trip city',
              style: bodyText12Small(color: black),
            ),
            PreferredHotelTypeWidget(),
            addVerticalSpace(25),
            Text(
              'Includes',
              style: bodyText16w600(color: black),
            ),
            addVerticalSpace(10),
            SizedBox(
              height: height(context) * 0.135,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: includesList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (ctx, i) {
                    return InkWell(
                      onTap: () {
                        includesList[i].isSelected =
                            !includesList[i].isSelected;
                        setState(() {});
                      },
                      child: Container(
                        height: height(context) * 0.05,
                        width: width(context) * 0.4,
                        decoration: includesList[i].isSelected
                            ? myOutlineBoxDecoration(1, primary, 10)
                            : myFillBoxDecoration(
                                0, black.withOpacity(0.1), 10),
                        child: Center(
                          child: Text(includesList[i].name),
                        ),
                      ),
                    );
                  }),
            ),
            Text(
              widget.message1,
              style: bodyText12Small(spacing: 1.3, color: black),
            ),
            addVerticalSpace(10),
            Text(
              widget.message2,
              style: bodyText12Small(spacing: 1.3, color: black),
            ),
            addVerticalSpace(30),
            Center(
              child: SizedBox(
                  width: width(context) * 0.35,
                  child: CustomButton(
                      name: 'Submit',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpcomingTripsScreen()));
                      })),
            ),
            addVerticalSpace(20)
          ]),
        ),
      ),
    );
  }
}

class TripTypeWidget extends StatefulWidget {
  const TripTypeWidget({super.key});

  @override
  State<TripTypeWidget> createState() => _TripTypeWidgetState();
}

class _TripTypeWidgetState extends State<TripTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height(context) * 0.05,
        width: width(context) * 0.95,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: checkListItems.length,
            itemBuilder: (ctx, index) {
              return Row(
                children: [
                  Checkbox(
                    activeColor: primary,
                    checkColor: black,
                    value: checkListItems[index]["value"],
                    onChanged: (value) {
                      setState(() {
                        for (var element in checkListItems) {
                          element["value"] = false;
                        }
                        checkListItems[index]["value"] = value;
                      });
                    },
                  ),
                  Text(checkListItems[index]['title'])
                ],
              );
            }));
    ;
  }
}

class TravellersAdultAndChildenSelectWidget extends StatefulWidget {
  const TravellersAdultAndChildenSelectWidget({super.key});

  @override
  State<TravellersAdultAndChildenSelectWidget> createState() =>
      _TravellersAdultAndChildenSelectWidgetState();
}

class _TravellersAdultAndChildenSelectWidgetState
    extends State<TravellersAdultAndChildenSelectWidget> {
  final items = ['1', '2', '3', '4', '6', '7', '8', '9', '10'];
  final items2 = ['1', '2', '3', '4', '6', '7', '8', '9', '10'];
  String? selectedValue = '1';
  String? selectedValue2 = '1';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: width(context) * 0.4,
          child: CustomDropDownButton(
            itemList: items,
            lableText: '  Adults  ',
          ),
        ),
        SizedBox(
          width: width(context) * 0.4,
          child: CustomDropDownButton(
            itemList: items2,
            lableText: '  Children  ',
          ),
        ),
      ],
    );
  }
}

class PreferredHotelTypeWidget extends StatefulWidget {
  const PreferredHotelTypeWidget({super.key});

  @override
  State<PreferredHotelTypeWidget> createState() =>
      _PreferredHotelTypeWidgetState();
}

class _PreferredHotelTypeWidgetState extends State<PreferredHotelTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height(context) * 0.05,
        width: width(context) * 0.95,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: checkListItems2.length,
            itemBuilder: (ctx, index) {
              return Row(
                children: [
                  Checkbox(
                    activeColor: primary,
                    checkColor: black,
                    value: checkListItems2[index]["value"],
                    onChanged: (value) {
                      setState(() {
                        for (var element in checkListItems2) {
                          element["value"] = false;
                        }
                        checkListItems2[index]["value"] = value;
                      });
                    },
                  ),
                  Text(checkListItems2[index]['title'])
                ],
              );
            }));
  }
}
