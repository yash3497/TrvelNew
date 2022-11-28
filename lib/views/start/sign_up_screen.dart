import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/start/sign_in_screen.dart';
import 'package:travel_app/widget/custom_button.dart';
import 'package:travel_app/widget/my_bottom_navbar.dart';

import '../../widget/custom_textfield.dart';
import '../home/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: primary,
                        ))
                  ],
                ),
              ),
              addVerticalSpace(height(context) * 0.01),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign up',
                      style: bodyText22w700(color: black),
                    ),
                    Text(
                      'To kick - start your next trip',
                      style: bodyText16normal(color: black),
                    ),
                    addVerticalSpace(height(context) * 0.09),
                    CustomTextFieldWidget(
                      labelText: 'Full Name',
                    ),
                    addVerticalSpace(15),
                    CustomTextFieldWidget(
                      labelText: 'Email Address',
                      icon: Icon(
                        Icons.help,
                        color: primary,
                      ),
                    ),
                    addVerticalSpace(15),
                    CustomTextFieldWidget(
                      labelText: 'DOB',
                    ),
                    addVerticalSpace(15),
                    CustomTextFieldWidget(
                      labelText: 'Mobile Number',
                    ),
                    addVerticalSpace(15),
                    CustomTextFieldWidget(
                      labelText: 'Password',
                      icon: Icon(
                        Icons.remove_red_eye_rounded,
                        color: primary,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: width(context) * 0.2, top: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => SignInScreen()));
                        },
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Already a member?',
                              style: bodyText14normal(
                                  color: black.withOpacity(0.5))),
                          TextSpan(
                              text: ' Sign in',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  color: primary))
                        ])),
                      ),
                    ),
                    addVerticalSpace(20),
                    addVerticalSpace(height(context) * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: height(context) * 0.06,
                          width: width(context) * 0.15,
                          decoration: myOutlineBoxDecoration(1, primary, 15),
                          child: Center(
                            child: Icon(
                              Icons.refresh_sharp,
                              color: primary,
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(
                            width: width(context) * 0.7,
                            child: CustomButton(
                                name: 'Sign up',
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              MyBottomBar())));
                                })),
                      ],
                    ),
                    addVerticalSpace(height(context) * 0.05),
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: InkWell(
                        onTap: () {},
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text:
                                  'By Proceeding further you agree to Travel New’s.\n',
                              style: bodyText14normal(color: black)),
                          TextSpan(
                              text: 'Terms of Services and Privacy Policy',
                              style:
                                  bodyText14w600(spacing: 1.4, color: black)),
                          TextSpan(
                              text:
                                  ' To sign up, you need to be at least 18. You can hide your DOB.',
                              style:
                                  bodyText14normal(spacing: 1.4, color: black)),
                        ])),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
