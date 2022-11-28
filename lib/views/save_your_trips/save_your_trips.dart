import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/views/humburger_flow/upcoming_trips.dart';
import 'package:travel_app/views/publish%20your%20trip/step1.dart';
import 'package:travel_app/views/publish%20your%20trip/step2.dart';
import 'package:travel_app/views/save_your_trips/save_trip_step_1.dart';
import 'package:travel_app/views/save_your_trips/save_trip_step_2.dart';
import 'package:travel_app/views/save_your_trips/save_trip_step_3.dart';
import 'package:travel_app/widget/custom_appbar.dart';
import 'package:travel_app/widget/custom_button.dart';
import 'package:travel_app/widget/custom_dropdown_button.dart';
import 'package:travel_app/widget/custom_textfield.dart';

import '../../model/prima_profile_model.dart';

class SaveYourTripsScreen extends StatefulWidget {
  const SaveYourTripsScreen({Key? key}) : super(key: key);

  @override
  _SaveYourTripsScreenState createState() => _SaveYourTripsScreenState();
}

class _SaveYourTripsScreenState extends State<SaveYourTripsScreen> {
  // we have initialized active step to 0 so that
  // our stepper widget will start from first step
  int _activeCurrentStep = 0;

  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();

  List<Step> stepList() => [
        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 0,
            label: const Text('Sightseeing'),
            title: const SizedBox(),
            content: SaveTripStep1()),
        Step(
            state: StepState.complete,
            isActive: _activeCurrentStep >= 1,
            label: const Text('Mode of Travel'),
            title: const SizedBox(),
            content: SaveTripStep2()),
        Step(
            state: StepState.complete,
            isActive: _activeCurrentStep >= 2,
            label: const Text('Travel detail'),
            title: const SizedBox(),
            content: SaveTripStep3())
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(title: 'Save Your Trip')),
      body: Theme(
        data: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: primary,
              ),
        ),
        child: Stepper(
          elevation: 0,
          margin: EdgeInsets.zero,

          controlsBuilder: (BuildContext context, ControlsDetails,
              {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
            return Column(
              children: [
                addVerticalSpace(40),
                _activeCurrentStep == 2
                    ? SizedBox(
                        width: width(context) * 0.55,
                        child: CustomButton(
                            name: 'Submit',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpcomingTripsScreen()));
                            }),
                      )
                    : SizedBox(
                        width: width(context) * 0.55,
                        child: CustomButton(
                            name: 'Continue',
                            onPressed: () {
                              if (_activeCurrentStep <
                                  (stepList().length - 1)) {
                                setState(() {
                                  _activeCurrentStep += 1;
                                });
                              }
                            }),
                      ),
              ],
            );
          },
          type: StepperType.horizontal,
          currentStep: _activeCurrentStep,
          steps: stepList(),

          onStepContinue: () {
            if (_activeCurrentStep < (stepList().length - 1)) {
              setState(() {
                _activeCurrentStep += 1;
              });
            }
          },

          onStepCancel: () {
            if (_activeCurrentStep == 0) {
              return;
            }

            setState(() {
              _activeCurrentStep -= 1;
            });
          },

          // onStepTap allows to directly click on the particular step we want
          onStepTapped: (int index) {
            setState(() {
              _activeCurrentStep = index;
            });
          },
        ),
      ),
    );
  }
}
