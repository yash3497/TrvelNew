import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/model/save_trip_model.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/widget/custom_button.dart';

class CheckListAndBudgetScreen extends StatelessWidget {
  CheckListAndBudgetScreen({super.key});
  final items = ['1', '2', '3', '4', '6', '7', '8', '9', '10'];
  String? selectedValue = '1';

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
              InkWell(
                  onTap: () {
                    saveItemforTravel(context);
                  },
                  child: Icon(Icons.edit)),
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
                          height: height(context) * 0.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Camera',
                                style: bodyText14w600(color: black),
                              ),
                              Text(
                                'Medicine',
                                style: bodyText14w600(color: black),
                              ),
                              Text(
                                'Shopping',
                                style: bodyText14w600(color: black),
                              ),
                              Text(
                                'Drinks',
                                style: bodyText14w600(color: black),
                              ),
                              Text(
                                '',
                                style: bodyText14w600(color: black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height(context) * 0.19,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(children: [
                                Text('Take on rent'),
                                Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: primary,
                                ),
                              ]),
                              Row(children: [
                                Text('Carry while travel'),
                                Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: primary,
                                ),
                              ]),
                              Row(
                                children: [
                                  Text('Buy while travel '),
                                  Icon(
                                    Icons.arrow_drop_down_outlined,
                                    color: primary,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Buy while travel '),
                                  Icon(
                                    Icons.arrow_drop_down_outlined,
                                    color: primary,
                                  ),
                                ],
                              ),
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
                                '0',
                                style: bodyText14w600(color: black),
                              ),
                              Text(
                                '5,000',
                                style: bodyText14w600(color: black),
                              ),
                              Text(
                                '3,300',
                                style: bodyText14w600(color: black),
                              ),
                              Text(
                                '9,300',
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
                  Text(
                    'What to bring for the trip',
                    style: bodyText16w600(color: black),
                  ),
                  addVerticalSpace(height(context) * 0.02),
                  Container(
                      decoration:
                          myFillBoxDecoration(0, black.withOpacity(0.1), 15),
                      width: width(context) * 0.9,
                      height: height(context) * 0.15,
                      child: TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                            hintStyle: bodyText13normal(color: black),
                            hintText:
                                'Mention what’s incorrect with any reference if any For suggestion on multiple sections, please enter after each suggestion '),
                      )),
                  addVerticalSpace(height(context) * 0.02),
                  Text(
                    'Save items that you wish to have for trip',
                    style: bodyText16w600(color: black),
                  ),
                  addVerticalSpace(15),
                  SizedBox(
                    height: height(context) * 0.3,
                    child: ListView.builder(
                        itemCount: saveWishList.length,
                        itemBuilder: (ctx, i) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        saveWishList[i].userName,
                                        style: bodyText13normal(
                                            color: black.withOpacity(0.4)),
                                      ),
                                      Text(
                                        saveWishList[i].item,
                                        style: bodyText14w600(color: black),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: myOutlineBoxDecoration(
                                            1, primary, 10),
                                        height: height(context) * 0.04,
                                        width: width(context) * 0.4,
                                        // color: const Color(0xffF0F0F0),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 2, right: 8),
                                          child: Center(
                                            child: DropdownButton<String>(
                                              value: saveWishList[i]
                                                  .selectedValaue,
                                              isExpanded: true,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  saveWishList[i]
                                                          .selectedValaue =
                                                      newValue!;
                                                });
                                              },
                                              items: saveWishList[i]
                                                  .dropDown
                                                  .map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child: Text(
                                                              value,
                                                              style:
                                                                  bodytext12Bold(
                                                                      color:
                                                                          black),
                                                            ),
                                                          ))
                                                  .toList(),

                                              // add extra sugar..
                                              icon: const Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Icon(
                                                  Icons.arrow_drop_down,
                                                ),
                                              ),
                                              iconSize: 25,
                                              iconEnabledColor: primary,
                                              iconDisabledColor:
                                                  black.withOpacity(0.7),
                                              underline: const SizedBox(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  addHorizontalySpace(20),
                                  Row(
                                    children: [
                                      Text(
                                        '1,000',
                                        style: bodyText14w600(color: black),
                                      ),
                                      Icon(Icons.delete)
                                    ],
                                  )
                                ],
                              ),
                              addVerticalSpace(10),
                            ],
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: height(context) * 0.04,
                          width: width(context) * 0.4,
                          decoration: myFillBoxDecoration(0, primary, 10),
                          child: Center(
                            child: Text(
                              'Save',
                              style: bodyText14w600(color: black),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: height(context) * 0.04,
                          width: width(context) * 0.4,
                          decoration: myOutlineBoxDecoration(1, primary, 10),
                          child: Center(
                            child: Text(
                              'Add items',
                              style: bodyText14w600(color: black),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ));
        });
      },
    );
  }
}
