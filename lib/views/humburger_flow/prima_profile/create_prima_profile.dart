import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:travel_app/views/humburger_flow/my_account/trip_intrest_screen.dart';
import 'package:travel_app/views/humburger_flow/prima_profile/prima_my_account_screen.dart';
import 'package:travel_app/views/humburger_flow/prima_profile/prima_profile_screen.dart';
import 'package:travel_app/widget/custom_appbar.dart';
import 'package:travel_app/widget/custom_button.dart';
import 'package:travel_app/widget/custom_dropdown_button.dart';
import 'package:travel_app/widget/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../utils/constant.dart';

class CreatePrimaProfile extends StatefulWidget {
  const CreatePrimaProfile({super.key});

  @override
  State<CreatePrimaProfile> createState() => _CreatePrimaProfileState();
}

class _CreatePrimaProfileState extends State<CreatePrimaProfile> {
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController annivarsaryDate = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController emailId = TextEditingController();
  final TextEditingController mobilenumber = TextEditingController();
  final TextEditingController emergencynumber = TextEditingController();
  final TextEditingController userInterestController = TextEditingController();
  final TextEditingController destination = TextEditingController();

  int _currentStep = 0;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference primaAccount =
      FirebaseFirestore.instance.collection('primaAccounts');
  File? _image;
  final user = FirebaseAuth.instance.currentUser;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        final snackbar = SnackBar(content: Text("No Image Selected"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
        return;
      }
      final imagepath = File(image.path);
      setState(() {
        _image = imagepath;
      });
    } catch (e) {
      final snackbar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  String? url;
  Future uploadImage(File _image) async {
    String imgid = DateTime.now().microsecondsSinceEpoch.toString();
    Reference ref =
        FirebaseStorage.instance.ref().child('images').child('users$imgid');
    await ref.putFile(_image);
    url = await ref.getDownloadURL();
    print(url);
  }

  File? pdfFile;
  String? _filename;
  Future pickIdProof() async {
    try {
      final Id = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
      if (Id == null) {
        return;
      }
      final filepath = Id.files.single.path;
      final filename = Id.files.single.name;
      setState(() {
        pdfFile = File(filepath!);
        _filename = filename;
        print(filename);
      });
    } catch (e) {
      final snackbar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  String? IdUrl;
  Future uploadId(File pdfFile) async {
    String imgid = DateTime.now().microsecondsSinceEpoch.toString();
    Reference ref =
        FirebaseStorage.instance.ref().child('pdfs').child('users$imgid');
    await ref.putFile(pdfFile);
    IdUrl = await ref.getDownloadURL();
    print(url);
  }

  Future<void> addPrimaAccountDetails() {
    // Call the user's CollectionReference to add a new user
    return primaAccount
        .add({
          "General Details": {
            "imageUrl": url,
            "firstname": firstnameController.text.toString(),
            "lastname": lastnameController.text.toString(),
            "DOB": dateOfBirth.text.toString(),
            "Annivarsary": annivarsaryDate.text.toString(),
            'profession': professionController.text.toString(),
          }, // John Doe
          "governmentId": IdUrl, // 42
          "Contact Details": {
            "emailId": emailId.text.toString(),
            "mobileNumber": mobilenumber.text.toString(),
            "emergencyNumber": emergencynumber.text.toString(),
          },
          "userInterest": userInterestController.text.toString(),
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(title: 'Create Prima Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StepperWidget(),
              const Text(
                'General details',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              addVerticalSpace(4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: SizedBox(
                        height: height(context) * 0.15,
                        width: width(context) * 0.3,
                        child: _image != null
                            ? Image.file(
                                _image!,
                                width: width(context) * 0.3,
                                height: height(context) * 0.15,
                                fit: BoxFit.fill,
                              )
                            : Image.asset(
                                'assets/images/prima3.png',
                                fit: BoxFit.fill,
                              )),
                  ),
                  InkWell(
                    onTap: () {
                      pickImage().whenComplete(() {
                        uploadImage(_image!);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 13, left: 5),
                      height: 25,
                      width: width(context) * 0.43,
                      decoration:
                          myFillBoxDecoration(0, black.withOpacity(0.1), 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            Icons.edit_note_outlined,
                            size: 22,
                          ),
                          Text('Add Profile Picture')
                        ],
                      ),
                    ),
                  )
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  SizedBox(
                      height: 37,
                      width: width(context) * 0.45,
                      child: CustomTextFieldWidget(
                        labelText: 'First Name',
                        controller: firstnameController,
                      )),
                  addHorizontalySpace(10),
                  SizedBox(
                      height: 37,
                      width: width(context) * 0.45,
                      child: CustomTextFieldWidget(
                        labelText: 'Last Name',
                        controller: lastnameController,
                      ))
                ],
              ),
              addVerticalSpace(12),
              Row(
                children: [
                  SizedBox(
                      height: 37,
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
                                DateFormat('yyyy-MM-dd').format(pickedDate);

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
                      height: 37,
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
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            setState(() {
                              annivarsaryDate.text = formattedDate;
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      )),
                ],
              ),
              addVerticalSpace(10),
              SizedBox(
                  height: 37,
                  child: CustomTextFieldWidget(labelText: 'Profession')),
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
              SizedBox(
                height: 30,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Why is this required?',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: primary,
                          decoration: TextDecoration.underline),
                    )),
              ),
              const Divider(
                // height: ,
                thickness: 1,
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
                height: 37,
                child: CustomTextFieldWidget(labelText: 'Email Id'),
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  SizedBox(
                      height: 37,
                      width: width(context) * 0.45,
                      child: CustomTextFieldWidget(labelText: 'Mobile number')),
                  addHorizontalySpace(10),
                  SizedBox(
                      height: 37,
                      width: width(context) * 0.45,
                      child:
                          CustomTextFieldWidget(labelText: 'Emergency number'))
                ],
              ),
              SizedBox(
                height: 30,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Why is this required?',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: primary,
                          decoration: TextDecoration.underline),
                    )),
              ),
              const Divider(
                thickness: 1,
              ),
              addVerticalSpace(7),
              // ignore: prefer_const_constructors
              Text(
                'Government IDs',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              InkWell(
                onTap: () {
                  pickIdProof().whenComplete(() {
                    uploadId(pdfFile!);
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 8, left: 2),
                  height: 40,
                  width: pdfFile != null
                      ? width(context) * 0.9
                      : width(context) * 0.55,
                  decoration:
                      myFillBoxDecoration(0, black.withOpacity(0.1), 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      pdfFile != null
                          ? Text.rich(TextSpan(children: [
                              WidgetSpan(child: Icon(Icons.picture_as_pdf)),
                              TextSpan(text: _filename)
                            ]))
                          : Text(
                              'Address Proof',
                              style: bodyText16w600(color: black),
                            ),
                      addHorizontalySpace(12),
                      const Icon(
                        Icons.edit_note_outlined,
                        size: 22,
                      ),
                      addHorizontalySpace(10),
                      const Icon(
                        Icons.remove_red_eye_outlined,
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              addVerticalSpace(7),
              const Text(
                'About me',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              addVerticalSpace(10),
              Container(
                decoration: myFillBoxDecoration(0, black.withOpacity(0.1), 15),
                width: width(context) * 0.94,
                // height: height(context) * 0.15,
                child: TextField(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => PrimaMyAccount()));
                    },
                    maxLines: 3,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintStyle:
                            bodyText16normal(color: black.withOpacity(0.5)),
                        hintText:
                            'Whats amazing about me? \nWhy I’m on travel new?')),
              ),
              addVerticalSpace(15),
              const Text(
                'Other interest',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              addVerticalSpace(10),
              Container(
                decoration: myFillBoxDecoration(0, black.withOpacity(0.1), 15),
                width: width(context) * 0.94,
                // height: height(context) * 0.15,
                child: TextField(
                    controller: userInterestController,
                    onTap: () {},
                    maxLines: 3,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintStyle:
                            bodyText16normal(color: black.withOpacity(0.5)),
                        hintText:
                            'Example: Loves to cook, workout, books etc')),
              ),
              addVerticalSpace(10),
              const Divider(
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'What excites you?',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => YourTripInterest()));
                      },
                      icon: Icon(Icons.edit_note))
                ],
              ),
              WhatExcitesYouWidget(),
              const Divider(
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tripometer',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.help))
                ],
              ),
              TripometerWidget(),
              InkWell(
                  onTap: () {},
                  child: Text(
                    'Why is this required',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: primary,
                        decoration: TextDecoration.underline),
                  )),
              const Divider(
                thickness: 1,
              ),
              UploadTravelsPhotos(),
              addVerticalSpace(20),
              CustomButton(
                  name: 'Create my profile',
                  onPressed: () {
                    addPrimaAccountDetails().whenComplete(() => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => PrimaProfileScreen())));
                  }),
              addVerticalSpace(15)
            ],
          ),
        ),
      ),
    );
  }
}

class TripometerWidget extends StatefulWidget {
  const TripometerWidget({super.key});

  @override
  State<TripometerWidget> createState() => _TripometerWidgetState();
}

class _TripometerWidgetState extends State<TripometerWidget> {
  final List tripoMeterList = [
    {'name': 'Adventure', 'value': 30.0},
    {'name': 'City', 'value': 60.0},
    {'name': 'Nature', 'value': 80.0},
    {'name': 'Adventure', 'value': 30.0},
    {'name': 'City', 'value': 60.0},
    {'name': 'Nature', 'value': 80.0},
  ];
  double _value = 50;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              height: height(context) * 0.28,
              width: width(context) * 0.95,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tripoMeterList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, i) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Column(
                        children: [
                          RotatedBox(
                            quarterTurns: 3,
                            child: Slider(
                              value: tripoMeterList[i]['value'],
                              onChanged: (value) {
                                tripoMeterList[i]['value'] = value;
                                setState(() {});
                              },
                              max: 100,
                              min: 0,
                              activeColor: primary,
                            ),
                          ),
                          Text(
                            tripoMeterList[i]['name'],
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: black),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ],
    );
  }
}

class UploadTravelsPhotos extends StatefulWidget {
  const UploadTravelsPhotos({super.key});

  @override
  State<UploadTravelsPhotos> createState() => _UploadTravelsPhotosState();
}

class _UploadTravelsPhotosState extends State<UploadTravelsPhotos> {
  File? _image1;
  File? _image2;
  File? _image3;
  File? _image4;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    final imagepath = File(image.path);
    setState(() {
      _image1 = imagepath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addVerticalSpace(7),
        Text(
          'Upload Travel Photos',
          style: bodyText20w700(color: black),
        ),
        Text(
          'Show your travel pics to your trip friends on TravelNew',
          style: bodyText12Small(color: black),
        ),
        addVerticalSpace(15),
        Center(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(4, (i) {
              return InkWell(
                onTap: () {
                  pickImage();
                },
                child: _image1 != null
                    ? Image.file(
                        _image1!,
                        height: height(context) * 0.15,
                        width: width(context) * 0.35,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: height(context) * 0.15,
                        width: width(context) * 0.35,
                        decoration: myOutlineBoxDecoration(
                            1, black.withOpacity(0.3), 10),
                        child: Center(
                            child: Icon(
                          Icons.add,
                          color: black.withOpacity(0.3),
                        )),
                      ),
              );
            }),
          ),
        ),
        addVerticalSpace(15),
        Container(
            decoration: myOutlineBoxDecoration(1, black.withOpacity(0.4), 9),
            width: width(context) * 0.94,
            // height: height(context) * 0.08,
            child: TextField(
                maxLines: 2,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    hintStyle: bodyText13normal(color: black),
                    hintText: 'Mention destination of above travel photos'))),
      ],
    );
  }
}

class WhatExcitesYouWidget extends StatelessWidget {
  WhatExcitesYouWidget({super.key});

  final List whatExcitesYou = [
    {'title': 'Adventure', 'subTitle': 'Camping Waterfalls Hills and Trek'},
    {'title': 'Nature', 'subTitle': 'Hill area Safari Wildlife Sa'},
    {'title': 'City', 'subTitle': 'Shopping Nightlife Water sports'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height(context) * 0.15,
        child: ListView.builder(
            itemCount: whatExcitesYou.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 10),
                    height: height(context) * 0.14,
                    width: width(context) * 0.32,
                    decoration:
                        myFillBoxDecoration(0, black.withOpacity(0.1), 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          whatExcitesYou[i]['title'],
                          style: bodyText16w600(color: black),
                        ),
                        SizedBox(
                            width: width(context) * 0.3,
                            child: Text(
                              whatExcitesYou[i]['subTitle'],
                            ))
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _activeCurrentStep = 0;

  List<Step> steps = [
    Step(
      state: StepState.complete,
      title: const Text(''),
      content: const Text(''),
      label: Text(
        'Account',
        style: bodytext12Bold(color: black),
      ),
      isActive: true,
    ),
    Step(
      state: StepState.editing,
      title: const Text(''),
      content: const Text(''),
      label: Text(
        'Travel Photos',
        style: bodytext12Bold(color: black),
      ),
      isActive: true,
    ),
    Step(
      state: StepState.editing,
      title: const Text(''),
      content: const Text(''),
      label: Text(
        'About',
        style: bodytext12Bold(color: black),
      ),
      isActive: true,
    ),
    Step(
      state: StepState.editing,
      title: const Text(''),
      content: const Text(''),
      label: Text(
        'Tripometer',
        style: bodytext12Bold(color: black),
      ),
      isActive: true,
    ),
  ];
  List<Step> stepList() => [
        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 0,
            label: const Text('Account'),
            title: const SizedBox(),
            content: SizedBox()),
        Step(
            state: StepState.complete,
            isActive: _activeCurrentStep >= 1,
            label: const Text('Travel Photos'),
            title: const SizedBox(),
            content: SizedBox()),
        Step(
            state: StepState.complete,
            isActive: _activeCurrentStep >= 2,
            label: const Text('About'),
            title: const SizedBox(),
            content: SizedBox()),
        Step(
            state: StepState.complete,
            isActive: _activeCurrentStep >= 3,
            label: const Text('Tripometer'),
            title: const SizedBox(),
            content: SizedBox())
      ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * 0.13,
      child: Theme(
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
            return SizedBox();
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
