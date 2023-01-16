import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/widget/custom_dropdown_button.dart';

import '../../model/prima_profile_model.dart';
import 'add_tourist_spots.dart';

class Step2 extends StatelessWidget {
  const Step2({super.key});

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
                maxLines: 3,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    hintStyle: bodyText13normal(color: black),
                    hintText: 'What you’ll do in Trip'))),
        addVerticalSpace(25),
        Text(
          'Suggestions',
          style: bodyText16w600(color: black),
        ),
        addVerticalSpace(10),
        SizedBox(
          height: height(context) * 0.14,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: suggestionList.length,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height(context) * 0.11,
                        width: width(context) * 0.23,
                        child: Image.asset(
                          suggestionList[i]['img'],
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(suggestionList[i]['name']),
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
