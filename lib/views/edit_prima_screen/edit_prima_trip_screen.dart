import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/edit_prima_screen/prima_trip_1to4_screen.dart';
import 'package:travel_app/widget/custom_button.dart';
import 'package:travel_app/widget/custom_dropdown_button.dart';
import 'package:travel_app/widget/custom_textfield.dart';

class EditPrimaTripScreen extends StatefulWidget {
  const EditPrimaTripScreen({super.key});

  @override
  State<EditPrimaTripScreen> createState() => _EditPrimaTripScreenState();
}

class _EditPrimaTripScreenState extends State<EditPrimaTripScreen> {
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height(context) * 0.35,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/editprima2.png'))),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: white,
                            )),
                        Text(
                          'Edit Prima Trip',
                          style: bodyText20w700(color: white),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: white,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About trip',
                    style: bodyText16w600(color: black),
                  ),
                  addVerticalSpace(15),
                  CustomTextFieldWidget(labelText: 'Edit Trip name'),
                  addVerticalSpace(15),
                  SizedBox(
                    // height: height(context) * 0.05,
                    width: width(context) * 0.95,
                    child: Theme(
                      data: ThemeData(
                        colorScheme: Theme.of(context).colorScheme.copyWith(
                              primary: primary,
                            ),
                      ),
                      child: TextField(
                        maxLines: 4,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'What you’ll do in Trip',
                          // labelStyle: bodyText14w600(color: primarhy),

                          focusColor: primary,

                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black26, width: 1.0),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primary, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  addVerticalSpace(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                              height: 40,
                              width: width(context) * 0.52,
                              child: CustomTextFieldWidget(
                                controller: startDate,
                                labelText: 'Start Date',
                                onClick: () async {
                                  var pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101));
                                  if (pickedDate != null) {
                                    print(pickedDate);
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);

                                    setState(() {
                                      startDate.text = formattedDate;
                                    });
                                  } else {
                                    print("Date is not selected");
                                  }
                                },
                                icon: const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.black,
                                ),
                              )),
                          addVerticalSpace(15),
                          SizedBox(
                              width: width(context) * 0.52,
                              height: 40,
                              child: CustomTextFieldWidget(
                                controller: endDate,
                                labelText: 'End Date',
                                onClick: () async {
                                  var pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101));
                                  if (pickedDate != null) {
                                    print(pickedDate);
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);

                                    setState(() {
                                      endDate.text = formattedDate;
                                    });
                                  } else {
                                    print("Date is not selected");
                                  }
                                },
                                icon: const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.black,
                                ),
                              )),
                        ],
                      ),
                      Container(
                        height: height(context) * 0.12,
                        width: width(context) * 0.36,
                        decoration: myOutlineBoxDecoration(2, primary, 10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '7',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: black),
                              ),
                              Text(
                                'Days',
                                style: TextStyle(fontSize: 22, color: black),
                              )
                            ]),
                      )
                    ],
                  ),
                  addVerticalSpace(15),
                  CustomTextFieldWidget(labelText: 'Places Visiting'),
                  addVerticalSpace(15),
                  Text(
                    'Suggestions',
                    style: bodyText14w600(color: black.withOpacity(0.4)),
                  ),
                  addVerticalSpace(10),
                  SizedBox(
                    height: height(context) * 0.16,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, i) {
                          return Container(
                            margin: EdgeInsets.only(right: 8),
                            height: height(context) * 0.15,
                            width: width(context) * 0.3,
                            decoration: myFillBoxDecoration(
                                0, black.withOpacity(0.1), 15),
                          );
                        }),
                  ),
                  addVerticalSpace(15),
                  Text(
                    'Not found the tourist spot, you can select either the nearest spot or add tourist spot here',
                    style: bodyText12Small(spacing: 1.4, color: black),
                  ),
                  addVerticalSpace(20),
                  SizedBox(
                    width: width(context) * 0.55,
                    child: CustomDropDownButton(
                      itemList: ['By road', 'Flight', 'Train'],
                      lableText: '  Mode of  Travel  ',
                    ),
                  ),
                  addVerticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width(context) * 0.42,
                        child: CustomDropDownButton(
                            itemList: ['Public', 'Private'],
                            lableText: '  Who can see your trip  '),
                      ),
                      SizedBox(
                        width: width(context) * 0.42,
                        child: CustomDropDownButton(
                            itemList: ['All Members', 'Only Friends'],
                            lableText: '  Members Type invited  '),
                      )
                    ],
                  ),
                  addVerticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width(context) * 0.4,
                        child: CustomDropDownButton(itemList: const [
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
                          '6',
                          '7',
                          '8',
                          '9',
                          '10'
                        ], lableText: '  Max Members for Trip  '),
                      ),
                      SizedBox(
                        width: width(context) * 0.44,
                        child: CustomDropDownButton(
                            itemList: ['For him/her self'],
                            lableText: '  How spends distributed?  '),
                      )
                    ],
                  ),
                  addVerticalSpace(15),
                  Text(
                    'For convience of all travellers, we have placed a limit to activities and edits on prima trips',
                    style: bodyText12Small(spacing: 1.4, color: black),
                  ),
                  addVerticalSpace(height(context) * 0.1),
                  Center(
                    child: SizedBox(
                      width: width(context) * 0.5,
                      child: CustomButton(
                          name: 'Save trip',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => PrimaTrip1To4Screens()));
                          }),
                    ),
                  ),
                  addVerticalSpace(20)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
