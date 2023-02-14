import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/widget/custom_button.dart';
import 'package:travel_app/widget/custom_textfield.dart';
import 'dart:io';

class AddTouristPointScreen extends StatefulWidget {
  const AddTouristPointScreen({super.key});

  @override
  State<AddTouristPointScreen> createState() => _AddTouristPointScreenState();
}

class _AddTouristPointScreenState extends State<AddTouristPointScreen> {
  String _image = "";
  void pickUploadImage() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
        imageQuality: 75);
    Reference ref = FirebaseStorage.instance.ref().child('profileImg');

    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      print(value);
      setState(() {
        _image = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
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
          'Add Tourist Spot',
          style: bodyText20w700(color: black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Tourist Spot',
              style: bodyText16w600(color: black),
            ),
            addVerticalSpace(15),
            CustomTextFieldWidget(labelText: 'Tourist Spot Name'),
            addVerticalSpace(15),
            Container(
                decoration:
                    myOutlineBoxDecoration(2, black.withOpacity(0.1), 15),
                width: width(context) * 0.94,
                // height: height(context) * 0.08,
                child: TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintStyle: bodyText13normal(color: black),
                        hintText: 'Address / Location'))),
            addVerticalSpace(15),
            Container(
                decoration:
                    myOutlineBoxDecoration(2, black.withOpacity(0.1), 15),
                width: width(context) * 0.94,
                // height: height(context) * 0.08,
                child: TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintStyle: bodyText13normal(color: black),
                        hintText: 'Describe the Tourist spot and experience'))),
            addVerticalSpace(15),
            Container(
              height: height(context) * 0.05,
              width: width(context) * 0.55,
              decoration: myFillBoxDecoration(0, black.withOpacity(0.05), 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.image,
                    color: black.withOpacity(0.2),
                  ),
                  InkWell(
                    onTap: (){
                      pickUploadImage();
                    },
                      child: Text('Upload an Image')),
                ],
              ),
            ),
            addVerticalSpace(height(context) * 0.1),
            Center(
              child: SizedBox(
                width: width(context) * 0.55,
                child: CustomButton(name: 'Add', onPressed: () {}),
              ),
            )
          ],
        ),
      ),
    );
  }
}
