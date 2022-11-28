import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../../widget/custom_button.dart';

class YourStayScreen extends StatefulWidget {
  const YourStayScreen({super.key});

  @override
  State<YourStayScreen> createState() => _YourStayScreenState();
}

class _YourStayScreenState extends State<YourStayScreen> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isOpen == false)
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Booking id: 540986',
                  style: bodyText16w600(color: black),
                ),
                addVerticalSpace(15),
                Container(
                  margin: EdgeInsets.all(10),
                  width: width(context) * 0.93,
                  child: Text(
                    'Your travel advisors will send a response after the hotel booking process from them is completed Details of your stay at the hotel will be appearing here just before your trip starts.',
                    textAlign: TextAlign.center,
                    style: bodyText14normal(
                        spacing: 1.4, color: black.withOpacity(0.5)),
                  ),
                ),
                addVerticalSpace(30),
                Center(
                  child: SizedBox(
                      width: width(context) * 0.5,
                      height: 40,
                      child: CustomButton(
                          name: 'Send a reminder',
                          onPressed: () {
                            isOpen = true;
                            setState(() {});
                          })),
                ),
              ],
            ),
          if (isOpen)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your stay',
                    style: bodyText18w600(color: black),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        'Booking id: 540986',
                        style: bodyText14w600(color: primary),
                      )
                    ],
                  ),
                  Text(
                    'Sai International',
                    style: bodyText16w600(color: black),
                  ),
                  Text(
                    'Sai Temple Rd, Nr Corporation Bank, Udupi - 111000',
                    style: bodyText13normal(color: black.withOpacity(0.5)),
                  ),
                  addVerticalSpace(20),
                  Text(
                    'Free morning breakfast, Swimming Pool, Doctor on calls and Free Wifi',
                    style: bodyText13normal(color: black.withOpacity(0.5)),
                  ),
                  addVerticalSpace(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hotel',
                            style:
                                bodyText14normal(color: black.withOpacity(0.4)),
                          ),
                          addVerticalSpace(5),
                          Text(
                            '3 Star',
                            style: bodyText16w600(color: black),
                          ),
                          addVerticalSpace(15),
                          Text(
                            'Check in date',
                            style:
                                bodyText14normal(color: black.withOpacity(0.4)),
                          ),
                          addVerticalSpace(5),
                          Text(
                            'Sept 22, 2022',
                            style: bodyText16w600(color: black),
                          ),
                          addVerticalSpace(15),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Travelers',
                            style:
                                bodyText14normal(color: black.withOpacity(0.4)),
                          ),
                          addVerticalSpace(5),
                          Text(
                            '6 Adults 2 Childrens ',
                            style: bodyText16w600(color: black),
                          ),
                          addVerticalSpace(15),
                          Text(
                            'Duration',
                            style:
                                bodyText14normal(color: black.withOpacity(0.4)),
                          ),
                          addVerticalSpace(5),
                          Text(
                            '4 Days & 3 Nights',
                            style: bodyText16w600(color: black),
                          ),
                          addVerticalSpace(15),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    'This is not your e-invoice. Ask your travel advisor for detail',
                    style: bodyText13normal(color: black.withOpacity(0.5)),
                  ),
                  addVerticalSpace(height(context) * 0.25),
                  CustomButton(
                      name: 'Show uploaded Government id', onPressed: () {})
                ],
              ),
            )
        ],
      ),
    );
  }
}
