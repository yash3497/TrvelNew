import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/aspired_trip/explore_trip_suggestion.dart';
import 'package:travel_app/widget/custom_button.dart';

class ExploreTripDestination extends StatelessWidget {
  const ExploreTripDestination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Explore Trip destination',
                  style: bodyText18w600(color: black),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => ExploreTripSuggestionScreen()));
                  },
                  child: Container(
                    height: height(context) * 0.035,
                    width: width(context) * 0.25,
                    decoration: myFillBoxDecoration(0, primary, 6),
                    child: Center(
                      child: Text(
                        'Suggest Edit',
                        style: bodytext12Bold(color: black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            addVerticalSpace(25),
            Text(
              'Understand Bhadrachalam',
              style: bodyText16w600(color: black),
            ),
            addVerticalSpace(4),
            Text(
              'Bhadrachalam is a key town of Pilgrimage importance with a probable history dating back to the events that took place in the Ramayana. It is also known as the Ayodhya of South India.',
              style: bodyText13normal(spacing: 1.5, color: black),
            ),
            addVerticalSpace(15),
            Text(
              'Local Language',
              style: bodyText16w600(color: black),
            ),
            addVerticalSpace(15),
            Text(
              'How to go to Hotel',
              style: bodyText14normal(color: black.withOpacity(0.5)),
            ),
            addVerticalSpace(4),
            Text(
              'Hōṭal ki elā veḷḷāli',
              style: bodyText16w600(color: black),
            ),
            addVerticalSpace(15),
            Text(
              'I need help, please call the police',
              style: bodyText14normal(color: black.withOpacity(0.5)),
            ),
            addVerticalSpace(4),
            Text(
              'Nāku sahāyaṁ kāvāli, dayacēsi pōlīsulaku kāl cēyaṇḍi',
              style: bodyText16w600(color: black),
            ),
            addVerticalSpace(15),
            Text(
              'How far is Hotel',
              style: bodyText14normal(color: black.withOpacity(0.5)),
            ),
            addVerticalSpace(4),
            Text(
              'Hōṭal enta dūraṁ',
              style: bodyText16w600(color: black),
            ),
            addVerticalSpace(15),
            Text(
              'Rickshaw take me to the temple',
              style: bodyText14normal(color: black.withOpacity(0.5)),
            ),
            addVerticalSpace(4),
            Text(
              'Rikṣā nannu mandirāniki tīsukeḷlaṇḍi',
              style: bodyText16w600(color: black),
            ),
            addVerticalSpace(18),
            Container(
              height: height(context) * 0.25,
              width: width(context) * 0.95,
              decoration: myFillBoxDecoration(0, black.withOpacity(0.1), 15),
              child: Center(
                  child: Text(
                'Advertisement',
                style: bodyText16w600(color: black),
              )),
            ),
            addVerticalSpace(20),
            Text(
              'Experience at Bhadrachalam',
              style: bodyText16w600(color: black),
            ),
            Text(
              'The town and the temple is situated on the left bank of the Godavari river, the place is considered to be sacred with a very rich and unique historical background. The holy Godavari river narrows down and passes through a stretch of hills (Paapikondalu) that offers picturesque view a paradise for nature lover',
              style: bodyText14normal(color: black, spacing: 1.5),
            ),
            addVerticalSpace(25),
            Text(
              'Food & Drinks at Bhadrachalam',
              style: bodyText16w600(color: black),
            ),
            Text(
              'A typical South-Indian cuisine here that includes Sambhar, Vada, Idli, Dosa with a variety of Chutneys. Briyani are also special here',
              style: bodyText14normal(color: black, spacing: 1.5),
            )
          ],
        ),
      ),
    );
  }
}
