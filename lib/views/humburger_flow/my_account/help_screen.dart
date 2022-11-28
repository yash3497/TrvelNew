import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/aspired_trip/feedback_page.dart';

import '../../../widget/custom_appbar.dart';

class HelpScreen extends StatelessWidget {
  HelpScreen({super.key});

  final List faqsList = [
    'About Prima Profile',
    'TravelNew Trips',
    'Events and Festivals',
    'Aspired Trips',
    'Prima Trips',
    'B2B Profile',
    'Notifications',
    'Trip Interest',
    'Co-traveler',
    'Trips friends',
    'Travel information',
    'Tourist spot information',
    'Tripometer',
    'About TravelNew',
    'Paid services',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(title: 'Help')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 12),
              child: Text(
                'FAQ’s',
                style: bodyText20w700(color: black),
              ),
            ),
            SizedBox(
              height: height(context) * 1.1,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: faqsList.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        ExpansionTile(
                          title: Text(
                            faqsList[i],
                            style: TextStyle(fontSize: 18, color: black),
                          ),
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                  'I am alexander lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum '),
                            )
                          ],
                        ),
                        const Divider(
                          height: 0,
                          thickness: 1,
                        )
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, right: 12.0, bottom: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => FeedBackPage()));
                },
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Didn’t find answer?',
                        style: bodyText14normal(color: black)),
                    TextSpan(
                        text: ' Share feedback',
                        style: bodyText14normal(color: primary))
                  ])),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
