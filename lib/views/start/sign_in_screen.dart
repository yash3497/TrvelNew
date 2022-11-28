import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/home/home_screen.dart';
import 'package:travel_app/views/start/forgot_password.dart';
import 'package:travel_app/views/start/sign_up_screen.dart';
import 'package:travel_app/views/start/signup_with_social_media_screen.dart';
import 'package:travel_app/widget/my_bottom_navbar.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_textfield.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
              addVerticalSpace(height(context) * 0.12),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back, Alexandra',
                      style: bodyText22w700(color: black),
                    ),
                    Text(
                      'Sign In',
                      style: bodyText16normal(color: black),
                    ),
                    addVerticalSpace(height(context) * 0.08),
                    CustomTextFieldWidget(
                      labelText: 'Email Address',
                    ),
                    addVerticalSpace(20),
                    CustomTextFieldWidget(
                      labelText: 'Password',
                      icon: Icon(
                        Icons.remove_red_eye_rounded,
                        color: primary,
                      ),
                    ),
                    addVerticalSpace(20),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => ForgotPassword())));
                        },
                        child: Text(
                          'Forgot password?',
                          style:
                              bodyText14normal(color: black.withOpacity(0.5)),
                        )),
                    addVerticalSpace(6),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => SignUpScreen())));
                        },
                        child: Text(
                          'Sign up with new email id?',
                          style:
                              bodyText14normal(color: black.withOpacity(0.5)),
                        )),
                    addVerticalSpace(height(context) * 0.07),
                    CustomButton(
                      name: 'Sign in',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => MyBottomBar())));
                      },
                    ),
                    addVerticalSpace(height(context) * 0.08),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: InkWell(
                        onTap: () {},
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text:
                                  'By Proceeding further you agree to Travel New’s.\n',
                              style: bodyText14normal(color: black)),
                          TextSpan(
                              text:
                                  '          Terms of Services and Privacy Policy',
                              style:
                                  bodyText14w600(spacing: 1.4, color: black)),
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
