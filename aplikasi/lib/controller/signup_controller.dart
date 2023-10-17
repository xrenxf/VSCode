import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aplikasi/model/custom_webservices.dart';
import 'package:http/http.dart' as http;
import 'package:aplikasi/login/login_page.dart';

class SignUpController extends GetxController {
  var isProficPicPathSet = false.obs;
  var profilePicPath = "".obs;

  var profileImageBase64;

  String userName = "";
  String userEmail = "";
  String userPass = "";

  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isProficPicPathSet.value = true;

    final bytes = File(profilePicPath.value).readAsBytesSync();
    profileImageBase64 = base64.encode(bytes);
  }

  void signUpUser(String name, String email, String pass,
      String rePass) {
    if (isProficPicPathSet.value == false) {
      Get.snackbar(
        "Sign Up Failed",
        "Please Capture/Select Profile Picture",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    } else if (pass != rePass) {
      Get.snackbar(
        "Sign Up Failed",
        "Password does not match",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    } else if (!isEmailValid(email)) {
      Get.snackbar(
        "Sign Up Failed",
        "Email Id is not valid",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    } else {
      userName = name;
      userEmail = email;
      userPass = pass;

      sendUserDataToServer();
    }
  }

  bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  Future<void> sendUserDataToServer() async {
    Map<String, dynamic> dataBody = {
      CustomWebServices.PROFILE_IMAGE: profileImageBase64,
      CustomWebServices.USER_NAME: userName,
      CustomWebServices.USER_EMAIL: userEmail,
      CustomWebServices.USER_PASS: userPass,
    };

    var dataToSend = json.encode(dataBody);

    var response = await http.post(Uri.parse(CustomWebServices.signup_api_url),
        body: dataToSend);

    // print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);

      if (responseData['r_msg'] == "success") {
        Get.to(LoginPage());
      } else if (responseData['r_msg'] == "failed") {
        Get.snackbar(
          "Sign Up Failed",
          "Server Problem Occured",
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2,
        );
      } else if (responseData['r_msg'] == "mobile number already exist") {
        Get.snackbar(
          "Sign Up Failed",
          "You have alreday registered",
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2,
        );
      }
    }
  }
}