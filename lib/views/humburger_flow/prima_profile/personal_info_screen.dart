import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/model/save_trip_model.dart';
import 'package:travel_app/widget/custom_button.dart';
import 'package:travel_app/widget/custom_textfield.dart';

import '../../../utils/constant.dart';
import '../../../widget/custom_dropdown_button.dart';
import '../my_account/my_account.dart';
import 'create_prima_profile.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController annivarsaryDate = TextEditingController();
  final TextEditingController firstName = new TextEditingController();
  final TextEditingController lastName = new TextEditingController();
  final TextEditingController profession = new TextEditingController();
  final TextEditingController mobNum = new TextEditingController();
  final TextEditingController emergencyNum = new TextEditingController();
  final TextEditingController emailId = new TextEditingController();
  detailUser() async {
    final _fireStore = FirebaseFirestore.instance;
    await _fireStore.collection("myAccount").doc().set({
      'firstName': firstName.text,
      'LastName': lastName.text,
      'anniversary': annivarsaryDate.text,
      'profession': profession.text,
      'dob': dateOfBirth.text,
      'emailId': emailId.text,
      'emergencyNum': emergencyNum.text,
      'mobNum': mobNum.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height(context) * 1.28,
          child: Stack(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    height: height(context) * 0.42,
                    width: width(context) * 1,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/prima3.png'))),
                    child: SafeArea(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Text(
                              'Edit Personal info',
                              style: bodyText20w700(color: white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 12.0, top: 10),
                            child: ImageIcon(
                                color: white,
                                const AssetImage(
                                  'assets/images/editicon.png',
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: height(context) * 0.38,
                    child: Container(
                        height: height(context),
                        padding: EdgeInsets.all(10),
                        width: width(context) * 1,
                        decoration: shadowDecoration(20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addVerticalSpace(8),
                            const Text(
                              'General details',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            addVerticalSpace(13),
                            Row(
                              children: [
                                SizedBox(
                                  width: width(context) * 0.45,
                                  child: CustomTextFieldWidget(
                                    labelText: 'First Name',
                                    controller: firstName,
                                  ),
                                ),
                                addHorizontalySpace(10),
                                SizedBox(
                                    width: width(context) * 0.45,
                                    child: CustomTextFieldWidget(
                                      labelText: 'Last Name',
                                      controller: lastName,
                                    ))
                              ],
                            ),
                            addVerticalSpace(15),
                            Row(
                              children: [
                                SizedBox(
                                    width: width(context) * 0.45,
                                    child: CustomTextFieldWidget(
                                      controller: dateOfBirth,
                                      labelText: 'Date Of Birth',
                                      icon: Icon(
                                        Icons.calendar_month_outlined,
                                        color: primary,
                                      ),
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
                                            dateOfBirth.text = formattedDate;
                                          });
                                        } else {
                                          print("Date is not selected");
                                        }
                                      },
                                    )),
                                addHorizontalySpace(10),
                                SizedBox(
                                    width: width(context) * 0.45,
                                    child: CustomTextFieldWidget(
                                      controller: annivarsaryDate,
                                      labelText: 'Anniversary dates',
                                      icon: Icon(
                                        Icons.calendar_month_outlined,
                                        color: primary,
                                      ),
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
                                            annivarsaryDate.text =
                                                formattedDate;
                                          });
                                        } else {
                                          print("Date is not selected");
                                        }
                                      },
                                    )),
                              ],
                            ),
                            addVerticalSpace(15),
                            SizedBox(
                              child: CustomTextFieldWidget(
                                labelText: 'Profession',
                                controller: profession,
                              ),
                            ),
                            addVerticalSpace(22),
                            Row(
                              children: [
                                SizedBox(
                                  height: 37,
                                  width: width(context) * 0.45,
                                  child: CustomDropDownButton(
                                    itemList: const [
                                      'Single',
                                      'Married',
                                      'Commited',
                                    ],
                                    lableText: 'Marital Status',
                                  ),
                                ),
                                addHorizontalySpace(10),
                                SizedBox(
                                  height: 37,
                                  width: width(context) * 0.45,
                                  child: CustomDropDownButton(
                                    itemList: const [
                                      'Male',
                                      'Female',
                                      'Other',
                                    ],
                                    lableText: 'Gender',
                                  ),
                                ),
                              ],
                            ),
                            addVerticalSpace(10),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  'Why is this required?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: primary,
                                      decoration: TextDecoration.underline),
                                )),
                            Divider(
                              height: 30,
                              color: black.withOpacity(0.05),
                              thickness: 5,
                            ),
                            addVerticalSpace(7),
                            const Text(
                              'Contact details',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            addVerticalSpace(10),
                            SizedBox(
                              // height: 37,
                              child: CustomTextFieldWidget(
                                labelText: 'Email Id',
                                controller: emailId,
                              ),
                            ),
                            addVerticalSpace(15),
                            Row(
                              children: [
                                SizedBox(
                                    width: width(context) * 0.45,
                                    child: CustomTextFieldWidget(
                                      labelText: 'Mobile number',
                                      controller: mobNum,
                                    )),
                                addHorizontalySpace(10),
                                SizedBox(
                                  // height: 37,
                                  width: width(context) * 0.45,
                                  child: CustomTextFieldWidget(
                                    labelText: 'Emergency number',
                                    controller: emergencyNum,
                                  ),
                                )
                              ],
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Why is this required?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: primary,
                                      decoration: TextDecoration.underline),
                                )),
                            Divider(
                              thickness: 5,
                              color: black.withOpacity(0.05),
                            ),
                            addVerticalSpace(7),
                            const Text(
                              'Government IDs',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            addVerticalSpace(5),
                            InkWell(
                              onTap: () {
                                selectUploadDocument(context);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 8, left: 8),
                                height: 40,
                                width: width(context) * 0.9,
                                decoration: shadowDecoration(10, 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '+ Upload your ID',
                                      style: bodyText16w600(
                                          color: black.withOpacity(0.5)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 5,
                              color: black.withOpacity(0.05),
                            ),
                            addHorizontalySpace(20),
                            CustomButton(
                                name: 'Save',
                                onPressed: () {
                                  detailUser();
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (ctx) => MyAccountScreen()));
                                }),
                            addHorizontalySpace(20),
                          ],
                        )))
              ]),
        ),
      ),
    );
  }

  Future<void> selectUploadDocument(BuildContext context) {
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
              height: height(context) * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upload your Documents',
                        style: bodyText18w600(color: black),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close))
                    ],
                  ),
                  Text(
                    'Document type',
                    style: bodyText14w600(color: black),
                  ),
                  SizedBox(
                      height: height(context) * 0.06,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: selectDocumentList.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (ctx, i) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 30,
                                    child: Checkbox(
                                      activeColor: primary,
                                      checkColor: black,
                                      value: selectDocumentList[i].isSelected,
                                      onChanged: (value) {
                                        setState(() {
                                          for (var element
                                              in selectDocumentList) {
                                            element.isSelected = false;
                                          }
                                          selectDocumentList[i].isSelected =
                                              value!;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(selectDocumentList[i].name)
                                ],
                              ),
                            );
                          })),
                  InkWell(
                    onTap: () {
                      //feature to be added to upload pdf
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 8, left: 0),
                      height: 30,
                      width: width(context) * 0.95,
                      decoration: shadowDecoration(6, 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '+ Upload ',
                            style:
                                bodyText14w600(color: black.withOpacity(0.5)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  addVerticalSpace(15),
                  Text(
                    'The document you upload here is not visible to anyone and it is saved on your device. It is available offline. It helps you with quick check-ins and meeting new trip friends.​ It also shows others you are really you making you a verified traveler.',
                    textAlign: TextAlign.center,
                    style: bodyText12Small(color: black),
                  ),
                  addVerticalSpace(20),
                  Center(
                    child: SizedBox(
                      width: width(context) * 0.4,
                      child: CustomButton(
                          name: 'Submit',
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                  )
                ],
              ));
        });
      },
    );
  }
}
