import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/start/sign_in_screen.dart';
import 'package:travel_app/widget/my_bottom_navbar.dart';

class SignupWithSocialMediaScreen extends StatelessWidget {
  const SignupWithSocialMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(height(context) * 0.04),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => MyBottomBar())));
                  },
                  child: Text(
                    'I’ll do it later',
                    style: bodyText14normal(color: black),
                  )),
            ),
            addVerticalSpace(height(context) * 0.06),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/loc.png'),
                  Row(
                    children: [
                      Text(
                        'Sign up / Sign in',
                        style: bodyText22w700(color: black),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.help,
                            color: black.withOpacity(0.5),
                          ))
                    ],
                  ),
                  Text(
                    'To kick - start your next trip',
                    style: bodyText16normal(color: black),
                  ),
                ],
              ),
            ),
            addVerticalSpace(height(context) * 0.06),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: width(context) * 0.92,
                decoration: myOutlineBoxDecoration(1.3, primary, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/google2.png'),
                    addHorizontalySpace(15),
                    Text(
                      'Continue with Google',
                      style: bodyText16w600(color: black),
                    )
                  ],
                ),
              ),
            ),
            addVerticalSpace(15),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: width(context) * 0.92,
                decoration: myOutlineBoxDecoration(1.3, primary, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/fb2.png'),
                    addHorizontalySpace(15),
                    Text(
                      'Continue with Facebook',
                      style: bodyText16w600(color: black),
                    )
                  ],
                ),
              ),
            ),
            addVerticalSpace(15),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: width(context) * 0.92,
                decoration: myOutlineBoxDecoration(1.3, primary, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/apple.png'),
                    addHorizontalySpace(15),
                    Text(
                      'Continue with Apple',
                      style: bodyText16w600(color: black),
                    )
                  ],
                ),
              ),
            ),
            addVerticalSpace(15),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => SignInScreen())));
              },
              child: Container(
                height: 50,
                width: width(context) * 0.92,
                decoration: myOutlineBoxDecoration(1.3, primary, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Vector.png'),
                    addHorizontalySpace(15),
                    Text(
                      'Continue with Mail',
                      style: bodyText16w600(color: black),
                    )
                  ],
                ),
              ),
            ),
            addVerticalSpace(10),
            Center(
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Why Login?',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: primary,
                        decoration: TextDecoration.underline),
                  )),
            ),
            addVerticalSpace(30),
            SizedBox(
              // width: width(context) * 0.9,
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                            'By Proceeding further you agree to Travel New’s ',
                        style: bodyText14normal(spacing: 1.4, color: black)),
                    TextSpan(
                      text: 'Terms of Services and Privacy Policy. ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                          color: black,
                          decoration: TextDecoration.underline),
                    ),
                    TextSpan(
                        text:
                            'To sign up, you need to be at least 18. You can hide your DOB',
                        style: bodyText14normal(spacing: 1.4, color: black))
                  ])),
            )
          ],
        ),
      )),
    );
  }
}
