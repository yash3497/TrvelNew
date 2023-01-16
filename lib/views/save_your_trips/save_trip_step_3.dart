import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/widget/custom_dropdown_button.dart';
import 'package:travel_app/widget/custom_textfield.dart';

import '../../model/save_trip_model.dart';
import '../../utils/constant.dart';

enum includes { one, two, three, four }

class SaveTripStep3 extends StatefulWidget {
  const SaveTripStep3({super.key});

  @override
  State<SaveTripStep3> createState() => _SaveTripStep3State();
}

class _SaveTripStep3State extends State<SaveTripStep3> {
  includes _value = includes.one;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Travel Details', style: TextStyle(fontSize: 20, color: black)),
        addVerticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width(context) * 0.4,
              child: Text(
                'Sinhagad, Maharashtra Trip',
                style: bodyText16w600(color: black),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Booking id: 540986',
                  style: bodyText16w600(color: black),
                ),
                InkWell(
                    onTap: () {},
                    child: Text(
                      'Your contact detail',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: primary,
                          decoration: TextDecoration.underline),
                    )),
              ],
            )
          ],
        ),
        addVerticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: width(context) * 0.6,
                    child: CustomTextFieldWidget(labelText: 'Departure date')),
                addVerticalSpace(5),
                SizedBox(
                    width: width(context) * 0.6,
                    child: const Text(
                        'You’ve preferred our travel partner suggesting a date'))
              ],
            ),
            Container(
              height: height(context) * 0.1,
              width: width(context) * 0.2,
              decoration: myOutlineBoxDecoration(1, primary, 10),
              child: Column(
                children: [
                  Text(
                    '7',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Days',
                    style: bodyText16normal(color: black),
                  )
                ],
              ),
            )
          ],
        ),
        addVerticalSpace(20),
        Text(
          'Travellers',
          style: bodyText16w600(color: black),
        ),
        addVerticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width(context) * 0.42,
              child: CustomDropDownButton(
                itemList: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
                lableText: '  Adults  ',
              ),
            ),
            SizedBox(
              width: width(context) * 0.42,
              child: CustomDropDownButton(
                itemList: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
                lableText: '  Children  ',
              ),
            )
          ],
        ),
        addVerticalSpace(20),
        Text(
          'Preferred Hotel type',
          style: bodyText16w600(color: black),
        ),
        SizedBox(
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
                })),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'Conditions to Hotel type available in the trip city',
            style: bodyText12Small(color: black),
          ),
        ),
        addVerticalSpace(20),
        Text(
          'Includes',
          style: bodyText16w600(color: black),
        ),
        SizedBox(
          height: 30,
          child: RadioListTile(
              contentPadding: EdgeInsets.zero,
              activeColor: primary,
              title: Text('Pickup and drop'),
              value: includes.one,
              groupValue: _value,
              onChanged: (val) {
                setState(() {
                  _value = val!;
                });
              }),
        ),
        SizedBox(
          height: 30,
          child: RadioListTile(
              contentPadding: EdgeInsets.zero,
              activeColor: primary,
              title: Text('Sightseeing transport'),
              value: includes.two,
              groupValue: _value,
              onChanged: (val) {
                setState(() {
                  _value = val!;
                });
              }),
        ),
        SizedBox(
          height: 30,
          child: RadioListTile(
              contentPadding: EdgeInsets.zero,
              activeColor: primary,
              title: Text('Travel guide'),
              value: includes.three,
              groupValue: _value,
              onChanged: (val) {
                setState(() {
                  _value = val!;
                });
              }),
        ),
        SizedBox(
          height: 30,
          child: RadioListTile(
              contentPadding: EdgeInsets.zero,
              activeColor: primary,
              title: Text('Infant assistance'),
              value: includes.four,
              groupValue: _value,
              onChanged: (val) {
                setState(() {
                  _value = val!;
                });
              }),
        ),
        addVerticalSpace(height(context) * 0.06),
        Text(
          'All travelers are requested to adhere health protocols as prescribed by the state and various authorities ',
          style: bodyText11Small(color: black),
        )
      ],
    );
  }
}
