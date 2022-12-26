import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/humburger_flow/my_account/B2B_registration.dart';
import 'package:travel_app/views/humburger_flow/my_account/account_settings.dart';
import 'package:travel_app/views/humburger_flow/my_account/help_screen.dart';
import 'package:travel_app/views/humburger_flow/my_account/my_trip_friends.dart';
import 'package:travel_app/views/humburger_flow/my_account/privacy_policy_screen.dart';
import 'package:travel_app/views/humburger_flow/my_account/travel_safe.dart';
import 'package:travel_app/views/humburger_flow/my_account/trip_intrest_screen.dart';
import 'package:travel_app/views/humburger_flow/prima_profile/personal_info_screen.dart';
import 'package:travel_app/views/humburger_flow/prima_profile/prima_profile_screen.dart';
import 'package:travel_app/views/prima/go_prima_screen.dart';
import 'package:travel_app/views/start/forgot_password.dart';
import 'package:travel_app/views/start/sign_up_screen.dart';
import 'package:travel_app/views/start/signup_with_social_media_screen.dart';
import 'package:travel_app/widget/custom_textfield.dart';

import '../../../widget/custom_button.dart';

class MyAccountScreen extends StatefulWidget {
  MyAccountScreen({super.key});
  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  String url = "";
  String userName = "";
  String place = "";
  // new function
  void getDetails() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      url = profile.data()?['profileImg'];
      userName =profile.data()?['fullName'];
      place = profile.data()?['locality'];
      setState(() {});
    }
  }

  final List listTileList = [
    {
      'title': 'Personal Information',
      'subTitle': 'Contact, Account information'
    },
    {'title': 'Trip Interest', 'subTitle': 'Tourist spots, Experiences'},
    {'title': 'Prima Plan', 'subTitle': 'Subscription, Status'},
    {'title': 'Account Setting', 'subTitle': 'Privacy, Update information'},
    {'title': 'Help', 'subTitle': 'FAOs, Support'},
    {'title': 'Travel Safety', 'subTitle': 'Information you need to be safe'},
  ];
  @override
  void initState() {
    getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: black,
              )),
          title: Text(
            'My Account',
            style: TextStyle(color: black),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => PrimaProfileScreen()));
              },
              child: SizedBox(
                  width: width(context) * 0.1,
                  child: Image.asset('assets/images/kingicon.png')),
            ),
            SizedBox(
                width: width(context) * 0.14,
                child: Image.asset('assets/images/editicon.png')),
          ],
        ),
        body: SingleChildScrollView(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            addVerticalSpace(15),
            Row(
              children: [
                addHorizontalySpace(10),
                Container(
                  child: CircleAvatar(
                    // child: Container( decoration: url == ""
                    //     ?  BoxDecoration(
                    //     borderRadius: BorderRadius.circular(3),
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: AssetImage('assets/images/prima3.png')))
                    //     : BoxDecoration(
                    //   borderRadius: BorderRadius.circular(3),
                    //     image: DecorationImage(
                    //         fit: BoxFit.fill, image: NetworkImage(url))),),
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(url),
                  ),
                ),
                addHorizontalySpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(height(context) * 0.0),
                    Row(
                      children: [
                        Text(
                          "$userName",
                          style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold ),
                          //style: bodyText20w700(color: black),
                        ),
                      ],
                    ),
                    addVerticalSpace(4),
                    Container(
                      height: 23,
                      width: width(context) * 0.35,
                      decoration: shadowDecoration(4, 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.star_rate_rounded,
                              color: primary,
                              size: 20,
                            ),
                            Text(
                              'Verified Member',
                              style: bodytext12Bold(color: black),
                            )
                          ]),
                    ),
                    addVerticalSpace(6),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 20,
                        ),
                        Text('$place'),
                        addHorizontalySpace(15),
                        const Icon(
                          Icons.people,
                          size: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => MyTripFriendsScreen(
                                      title: 'My Trip Friends',
                                    )));
                          },
                          child: Text(
                            ' 32 Trip Friends',
                            style: bodyText14w600(color: primary),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            SizedBox(
                height: height(context) * 0.55,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listTileList.length,
                    itemBuilder: (ctx, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                listTileList[i]['title'],
                                style: bodyText18w600(color: black),
                              ),
                              subtitle: Text(
                                listTileList[i]['subTitle'],
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: () async {
                                if (i == 0) {
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) =>
                                              PersonalInformationScreen()));
                                } else if (i == 1) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) =>
                                              YourTripInterest()));
                                } else if (i == 2) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) =>
                                              GoPrimaSubscriptionScreen()));
                                } else if (i == 3) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) =>
                                              AccountSettingsScreen()));
                                } else if (i == 4) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => HelpScreen()));
                                } else if (i == 5) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => TravelSafeScree()));
                                }
                              },
                            ),
                            const Divider(
                              height: 1,
                              thickness: 1,
                            )
                          ],
                        ),
                      );
                    })),
            addVerticalSpace(10),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: InkWell(
                onTap: () {
                  // Navigator.push(context,MaterialPageRoute(builder: (ctx)=>));
                  showBusinessSignup(context);
                },
                child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Are you a Business?',
                          style: bodyText14normal(color: black)),
                      TextSpan(
                          text: ' Get started here!',
                          style: TextStyle(fontSize: 14, color: primary))
                    ])),
              ),
            ),
            addVerticalSpace(height(context) * 0.06),
            InkWell(
              onTap: () async {
                if( FirebaseAuth.instance.currentUser != null)
                { final SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
                sharedPreferences.remove('email');
                await FirebaseAuth.instance.signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => SignupWithSocialMediaScreen())));}
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout_outlined),
                  addHorizontalySpace(10),
                  Text(
                    'Log out',
                    style: bodyText20w700(color: black),
                  ),
                ],
              ),
            ),
            addVerticalSpace(height(context) * 0.06),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => PrivacyPolicyScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('About us ',
                      style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          color: black,
                          fontWeight: FontWeight.w600)),
                  Container(
                    height: 20,
                    width: 2,
                    color: primary,
                  ),
                  addHorizontalySpace(5),
                  Text('Terms of Services',
                      style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          color: black,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            addVerticalSpace(15)
          ]),
        ));
  }

  showBusinessSignup(BuildContext context) {
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
                  height: height * 0.38,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Sign in / Sign up',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Do Business with exciting \nTravelers',
                        style: bodyText16w600(color: black),
                      ),
                      addVerticalSpace(8),
                      CustomTextFieldWidget(labelText: 'Email Address'),
                      CustomTextFieldWidget(
                        labelText: 'Password',
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: primary,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => ForgotPassword()));
                        },
                        child: Text(
                          'Forgot password?',
                          style: bodyText12Small(
                              color: black.withOpacity(0.5)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => SignUpScreen()));
                        },
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Not our business member?',
                                  style: bodyText12Small(
                                      color: black.withOpacity(0.5))),
                              TextSpan(
                                  text: ' Create Account',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: primary,
                                      decoration: TextDecoration.underline))
                            ])),
                      ),
                      addVerticalSpace(height * 0.02),
                      CustomButton(
                          name: 'Sign in',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) =>
                                        B2BRegistrationScreen()));
                          }),
                    ],
                  ));
            },
          ),
        ));
  }
}
