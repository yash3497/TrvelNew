import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/widget/custom_appbar.dart';
import 'package:travel_app/widget/custom_button.dart';
import 'package:travel_app/widget/custom_textfield.dart';

import '../../../utils/constant.dart';

class TravelPhotosScreen extends StatelessWidget {
  TravelPhotosScreen({super.key});

  final List travelPhoto = [
    'assets/images/Rectangle 111.png',
    'assets/images/Rectangle 111 (1).png',
    'assets/images/Rectangle 111 (2).png',
    'assets/images/Rectangle 111 (3).png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(title: 'Alexander’s Travel photos')),
      body: Stack(
        children: [
          SizedBox(
              height: height(context),
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (ctx, i) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(10),
                          height: height(context) * 0.24,
                          width: width(context) * 0.95,
                          decoration: myFillBoxDecoration(
                              0, black.withOpacity(0.08), 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Trip to destination',
                                    style: bodyText16w600(color: black),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  EditTravelPhotos()));
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                'August 01, 2022',
                                style: bodyText12Small(color: black),
                              ),
                              addVerticalSpace(8),
                              SizedBox(
                                height: height(context) * 0.12,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: travelPhoto.length,
                                    itemBuilder: (ctx, i) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: height(context) * 0.11,
                                              width: width(context) * 0.23,
                                              child: Image.asset(
                                                travelPhoto[i],
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              SizedBox(
                                width: width(context) * 0.5,
                                child: Text(
                                    'Description of trip or photos Description of trip or photos'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  })),
          Positioned(
            left: 30,
            bottom: 30,
            child: SizedBox(
                width: width(context) * 0.8,
                child: CustomButton(
                    name: 'Add more photos',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => UploadTravelsPhotosScreen()));
                    })),
          ),
          addVerticalSpace(10)
        ],
      ),
    );
  }
}

class UploadTravelsPhotosScreen extends StatelessWidget {
  const UploadTravelsPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(title: 'Upload Travel Photos')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Show fellow travelers your travel photos',
                style: bodyText20w700(color: black),
              ),
              addVerticalSpace(15),
              CustomTextFieldWidget(labelText: 'Trip Destination'),
              addVerticalSpace(10),
              CustomTextFieldWidget(labelText: 'Date of visit'),
              addVerticalSpace(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height(context) * 0.15,
                    width: width(context) * 0.32,
                    decoration:
                        myOutlineBoxDecoration(1, black.withOpacity(0.4), 15),
                    child: Center(
                      child: Icon(
                        Icons.image,
                        color: black.withOpacity(0.2),
                      ),
                    ),
                  ),
                  addHorizontalySpace(10),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 35,
                            width: width(context) * 0.4,
                            child: CustomButton(
                                name: 'Upload Photo', onPressed: () {})),
                        Text('Upload upto 10 Photos')
                      ],
                    ),
                  )
                ],
              ),
              addVerticalSpace(20),
              Container(
                  decoration:
                      myOutlineBoxDecoration(1, black.withOpacity(0.3), 15),
                  width: width(context) * 0.94,
                  // height: height(context) * 0.15,
                  child: TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintStyle: bodyText13normal(color: black),
                        hintText: 'Describe your trip and experience  '),
                  )),
              addVerticalSpace(10),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text:
                        'TravelNew follows zero tolerance policy for fake travel photos. Know ',
                    style: bodytext12Bold(color: black)),
                TextSpan(
                    text: 'Privacy Policy',
                    style: bodytext12Bold(color: primary))
              ])),
              addVerticalSpace(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 35,
                    width: width(context) * 0.42,
                    child: CustomButton(
                        name: 'Submit',
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  addHorizontalySpace(20),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: width(context) * 0.42,
                      decoration: shadowDecoration(10, 4),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: bodyText16w600(color: black),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EditTravelPhotos extends StatelessWidget {
  const EditTravelPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(title: 'Edit travel Photos')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                'Show fellow travelers your travel photos',
                style: bodyText20w700(color: black),
              ),
              addVerticalSpace(25),
              CustomTextFieldWidget(labelText: 'Trip Destination'),
              addVerticalSpace(10),
              CustomTextFieldWidget(labelText: 'Date of visit'),
              addVerticalSpace(20),
              Row(
                children: [
                  Spacer(),
                  Container(
                    height: 30,
                    width: width(context) * 0.3,
                    decoration: myFillBoxDecoration(0, primary, 5),
                    child: Center(
                      child: Text('Delete all'),
                    ),
                  )
                ],
              ),
              addVerticalSpace(15),
              SizedBox(
                height: height(context) * 0.28,
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            crossAxisCount: 3),
                    itemCount: 6,
                    itemBuilder: (ctx, i) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: width(context) * 0.3,
                              height: height(context) * 0.15,
                              child: Image.asset(
                                'assets/images/temple.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                              right: 4,
                              top: 4,
                              child: Container(
                                height: 25,
                                width: width(context) * 0.07,
                                decoration: myFillBoxDecoration(0, white, 3),
                                child: Center(
                                  child: Icon(
                                    Icons.delete_outline,
                                    color: primary,
                                  ),
                                ),
                              ))
                        ],
                      );
                    }),
              ),
              addVerticalSpace(20),
              Row(
                children: [
                  const Text(
                    'Upload upto 10 Photos',
                  ),
                  Spacer(),
                  Container(
                    height: 30,
                    width: width(context) * 0.3,
                    decoration: myFillBoxDecoration(0, primary, 5),
                    child: Center(
                      child: Text('Add photos'),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(20),
              Container(
                  decoration:
                      myOutlineBoxDecoration(1, black.withOpacity(0.3), 15),
                  width: width(context) * 0.94,
                  // height: height(context) * 0.15,
                  child: TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintStyle: bodyText13normal(color: black),
                        hintText: 'Describe your trip and experience  '),
                  )),
              addVerticalSpace(10),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text:
                        'TravelNew follows zero tolerance policy for fake travel photos. Know ',
                    style: bodytext12Bold(color: black)),
                TextSpan(
                    text: 'Privacy Policy',
                    style: bodytext12Bold(color: primary))
              ])),
              addVerticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 35,
                    width: width(context) * 0.42,
                    child: CustomButton(
                        name: 'Submit',
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  addHorizontalySpace(20),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: width(context) * 0.42,
                      decoration: shadowDecoration(10, 4),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: bodyText16w600(color: black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(15)
            ],
          ),
        ),
      ),
    );
  }
}
