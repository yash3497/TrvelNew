import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/utils/constant.dart';

import '../../model/save_trip_model.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_button.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(
            title: 'Feedback',
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your suggestions are important to us. This will help us improving our services',
              style: bodyText16w600(color: black),
              textAlign: TextAlign.center,
            ),
            addVerticalSpace(25),
            Text(
              'Your Feedback on',
              style: bodyText18w600(color: black),
            ),
            addVerticalSpace(10),
            SizedBox(
              height: height(context) * 0.25,
              child: GridView.builder(
                  itemCount: feedBackCheckboxList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3.5, crossAxisCount: 3),
                  itemBuilder: (ctx, i) {
                    return Row(
                      children: [
                        SizedBox(
                          width: 25,
                          child: Checkbox(
                            activeColor: primary,
                            checkColor: black,
                            value: feedBackCheckboxList[i].isSelected,
                            onChanged: (value) {
                              setState(() {
                                for (var element in feedBackCheckboxList) {
                                  element.isSelected = false;
                                }
                                feedBackCheckboxList[i].isSelected = value!;
                              });
                            },
                          ),
                        ),
                        Text(
                          feedBackCheckboxList[i].name,
                          style: bodyText12Small(color: black),
                        )
                      ],
                    );
                  }),
            ),
            addVerticalSpace(15),
            Container(
              decoration: myFillBoxDecoration(0, black.withOpacity(0.1), 15),
              width: width(context) * 0.9,
              height: height(context) * 0.15,
              child: TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      hintStyle: bodyText13normal(color: black),
                      hintText:
                          'Mention your suggestions/feedback(1000 characters) For feedback on multiple sections, please enter after each feedback.')),
            ),
            addVerticalSpace(15),
            Container(
                decoration: myFillBoxDecoration(0, black.withOpacity(0.1), 15),
                width: width(context) * 0.9,
                child: TextField(
                    maxLines: 2,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintStyle: bodyText13normal(color: black),
                        hintText:
                            'Upload Screen shot or any reference image'))),
            addVerticalSpace(15),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "For suggestions on multiple sections, please mention them in separate paragraphs.",
                style: bodyText12Small(color: black),
              ),
            ),
            addVerticalSpace(10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Be sure you know exactly what you are reporting. TravelNew follows zero tolerance policy for fake feedback",
                style: bodyText12Small(color: black),
              ),
            ),
            addVerticalSpace(30),
            Center(
              child: SizedBox(
                width: width(context) * 0.5,
                child: CustomButton(
                    name: 'Send Feedback',
                    onPressed: () {
                      feedBackOverlay(context);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  feedBackOverlay(BuildContext context) {
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
                            'We won’t be able to respond to your suggestions personally, but we assure you that your input reaches the appropriate team for editing the existing information in our platform.',
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
