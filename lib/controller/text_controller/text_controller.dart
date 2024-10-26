import 'package:flutter/material.dart';

class TextControllers {
  static final TextControllers _instance = TextControllers._internal();

  factory TextControllers() => _instance;

  TextControllers._internal();

  //create new user
  TextEditingController newMailController = TextEditingController();
  TextEditingController newNameController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  //sign in user
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //forgot password
  TextEditingController fPasswordController = TextEditingController();
  TextEditingController refPasswordController = TextEditingController();

  //edit profile
  TextEditingController editFullName = TextEditingController();
  TextEditingController editName = TextEditingController();
  TextEditingController editBirthDay = TextEditingController();
  TextEditingController editMail = TextEditingController();
  TextEditingController editPhone = TextEditingController();
  TextEditingController editGender = TextEditingController();

  //reservation Info
  TextEditingController reservedName = TextEditingController();
  TextEditingController reservedMail = TextEditingController();
  TextEditingController reservedPhone = TextEditingController();


  //search hotel
  TextEditingController searchHotel = TextEditingController();
}
