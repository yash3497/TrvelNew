import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/humburger_flow/my_account/notification_screen.dart';
import 'package:travel_app/views/humburger_flow/my_account/privacy_policy_screen.dart';
import 'package:travel_app/views/humburger_flow/my_account/save_card_screen.dart';
import 'package:travel_app/widget/custom_textfield.dart';

import '../../../widget/custom_appbar.dart';
import '../../../widget/custom_button.dart';

enum selectCity { one, two }

class AccountSettingsScreen extends StatefulWidget {
  AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  final List privacyList = [
    'Who can see your age?',
    'Who can see your marital Status?',
    'Who can see your trip friend list?',
    'Who can see your travel photos',
    'Who can see your prima profile?',
    'Who can see your other interest?',
    'Who can see your Profile?',
  ];

  List accountChagesList = [
    {'title': 'Home location', 'subTitle': 'Mumbai, Maharashtra'},
    {'title': 'Password', 'subTitle': 'Update'},
    {
      'title': 'Notifications',
      'subTitle': 'Messages, Trip mate requests and more'
    },
    {'title': 'Payment preference', 'subTitle': 'Saved card, UPI'},
  ];
  final List<String> settingList = ['Everyone', 'Only me', 'My friends'];
  var subTitle = 'Everyone';
  selectCity value = selectCity.two;

  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(title: 'Account Setting')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(5),
              Text(
                'Privacy, Update information ',
                style: bodyText20w700(color: black),
              ),
              addVerticalSpace(15),
              const Divider(
                thickness: 1,
              ),
              SizedBox(
                height: height(context) * 0.55,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: privacyList.length,
                    itemBuilder: (ctx, i) {
                      return Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              privacyList[i],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            subtitle: SizedBox(
                              height: 30,
                              child: DropdownButton<String>(
                                value: subTitle,
                                isExpanded: true,
                                onChanged: (newValue) {
                                  setState(() {
                                    subTitle = newValue!;
                                  });
                                },
                                items: settingList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: bodyText16normal(
                                                    color:
                                                        black.withOpacity(0.4)),
                                              ),
                                            ))
                                    .toList(),

                                // add extra sugar..
                                icon: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                ),
                                iconSize: 0,
                                iconEnabledColor: white,
                                iconDisabledColor: white,
                                underline: const SizedBox(),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 0,
                            thickness: 1,
                          )
                        ],
                      );
                    }),
              ),
              addVerticalSpace(20),
              Text(
                'Account Changes',
                style: bodyText20w700(color: black),
              ),
              addVerticalSpace(30),
              const Divider(
                height: 0,
                thickness: 1,
              ),
              SizedBox(
                height: height(context) * 0.38,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: accountChagesList.length,
                    itemBuilder: (ctx, i) {
                      return Column(children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            accountChagesList[i]['title'],
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          subtitle: Text(
                            accountChagesList[i]['subTitle'],
                            style:
                                bodyText16normal(color: black.withOpacity(0.4)),
                          ),
                          onTap: () {
                            if (i == 0) {
                              manageDestinationDialog(context);
                            }
                            if (i == 1) {
                              changePasswordDialog(context);
                            }
                            if (i == 3) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => SaveCardScreen()));
                            }
                            if (i == 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => NotificationScreen()));
                            }
                          },
                        ),
                        const Divider(
                          thickness: 1,
                          height: 0,
                        )
                      ]);
                    }),
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => PrivacyPolicyScreen()));
                    },
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          color: primary),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  changePasswordDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
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
                      height: height * 0.38,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            'Change Password',
                            style: bodyText16w600(color: black),
                          ),
                          addVerticalSpace(30),
                          CustomTextFieldWidget(
                              labelText: '  Enter old password  '),
                          addVerticalSpace(20),
                          CustomTextFieldWidget(
                              labelText: '  Enter new password  '),
                          addVerticalSpace(20),
                          CustomTextFieldWidget(
                              labelText: '  Confirm new password  '),
                          addVerticalSpace(30),
                          SizedBox(
                            width: width * 0.4,
                            child: CustomButton(
                                name: 'Save',
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

  Future<dynamic> manageDestinationDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              contentPadding: const EdgeInsets.all(6),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Builder(
                builder: (context) {
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;

                  return StatefulBuilder(builder: (context, setState) {
                    return Container(
                        height: height * 0.35,
                        width: width * 0.95,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.55,
                                  child: Text(
                                    'Manage home destination to start the trip',
                                    style: bodyText16w600(color: black),
                                  ),
                                ),
                                Icon(Icons.edit),
                                Icon(Icons.add),
                              ],
                            ),
                            addVerticalSpace(25),
                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 30,
                                  child: Radio(
                                      activeColor: primary,
                                      value: selectCity.one,
                                      groupValue: value,
                                      onChanged: (val) {
                                        value = val!;
                                        setState(() {});
                                      }),
                                ),
                                addHorizontalySpace(10),
                                Container(
                                  height: 35,
                                  width: width * 0.44,
                                  decoration:
                                      myOutlineBoxDecoration(2, primary, 7),
                                  child: const Center(child: Text('Mumbai')),
                                ),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.delete))
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 30,
                                  child: Radio(
                                      activeColor: primary,
                                      value: selectCity.two,
                                      groupValue: value,
                                      onChanged: (val) {
                                        value = val!;
                                        setState(() {});
                                      }),
                                ),
                                addHorizontalySpace(10),
                                Container(
                                  height: 35,
                                  width: width * 0.44,
                                  decoration:
                                      myOutlineBoxDecoration(2, primary, 7),
                                  child: const Center(child: Text('Pune')),
                                ),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.delete))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Select one to make your default city',
                                style: bodyText12Small(color: black),
                              ),
                            ),
                            addVerticalSpace(36),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 35,
                                    width: 100,
                                    decoration:
                                        myOutlineBoxDecoration(1, primary, 10),
                                    child: Center(
                                      child: Text(
                                        'Cancel',
                                        style: bodyText14w600(color: black),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 35,
                                    width: 100,
                                    decoration:
                                        myFillBoxDecoration(0, primary, 10),
                                    child: Center(
                                      child: Text(
                                        'Update',
                                        style: bodyText14w600(color: black),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ));
                  });
                },
              ),
            ));
  }
}
