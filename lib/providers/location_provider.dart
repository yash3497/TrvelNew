import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LocationProvider with ChangeNotifier {
  String currentAddress = 'My Address';
  var locality ;
  var country ;
  var postalCode ;
  Position? currentPosition;

  double? lat ;
  double? long;

  // fetching current position
  fetchCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    await Geolocator.getCurrentPosition().then((value) async {
      try {
        List<Placemark> placeMarks =
        await placemarkFromCoordinates(value.latitude, value.longitude);
        lat = value.latitude;
        long = value.longitude;

        Placemark place = placeMarks[0];

        currentPosition = value;
        currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
        locality = place.locality!;
        postalCode = place.postalCode!;
        country = place.country!;
        //log(currentAddress);
        // log(value.latitude.toString());
        // log(value.longitude.toString());
        notifyListeners();
        return currentAddress;
      } catch (e) {
        log(e.toString());
      }
    });

    notifyListeners();
  }

  // fetching latitude and longitude
  List<Location> newLatLongList = [];

  Future<List<Location>> getLatLong(BuildContext context, String address) async {
    await locationFromAddress(address).then((value) async {
      newLatLongList.clear();
      for (var data in value) {
        newLatLongList.add(data);
        log(newLatLongList.toString());
        lat = newLatLongList.first.latitude;
        long = newLatLongList.first.longitude;
        getAddressFromLatLng(
            newLatLongList.first.latitude, newLatLongList.first.longitude)
            .then((value) {
          currentAddress = value!;
        });
      }
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
      Navigator.pop(context);
    });

    notifyListeners();
    return newLatLongList;
  }

  // fetching address from latitude and longitude
  static const String _mapApiKey = "AIzaSyBtvEIVojiFHFC62dxHdpaCL5r5VFotq9s";

  Future<String?> getAddressFromLatLng(double lat, double lng) async {
    String host = 'https://maps.google.com/maps/api/geocode/json';
    final url = '$host?key=$_mapApiKey&language=en&latlng=$lat,$lng';

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      String formattedAddress = data["results"][0]["formatted_address"];
      log("response ==== $formattedAddress");
      currentAddress = formattedAddress;
      return currentAddress;
    } else {
      return null;
    }
  }


  // fetch user all locations
  var userLocationsList;

  Future<void> fetchUserAllLocations() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid.substring(0, 20))
        .get()
        .then((value) {
      userLocationsList = value.data();
      log(userLocationsList.toString());
    });
    notifyListeners();
  }

  // delete user location
  Future<void> deleteLocations(List<dynamic> list) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid.substring(0, 20))
        .update({"address": list});
    notifyListeners();
  }
}
