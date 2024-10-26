import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class UserModel {

  final String? id;
  final String? fullName;
  final String? name;
  final String? email;
  final String? birthDay;
  final String? phoneNumber;
  final String? gender;
  final String? photoUrl;

  UserModel({required this.fullName,
    required this.name,
    required this.email,
    required this.birthDay,
    required this.phoneNumber,
    required this.gender,
    required this.photoUrl,
    required this.id
  });

  factory UserModel.tofirebase(User? user) {
    return UserModel(
      id: user?.uid,
      fullName: user?.displayName,
      name: '',
      email: user?.email,
      phoneNumber: user?.phoneNumber,
      birthDay: '',
      gender: '',
      photoUrl: user?.photoURL,

    );
  }

  factory UserModel.todocument(DocumentSnapshot? doc) {
    if (doc == null || doc.data() == null) {
      return UserModel(
          id: '',
          fullName: '',
          name: '',
          email: '',
          phoneNumber: '',
          birthDay: '',
          gender: '',
          photoUrl: ''
      );
    }

    var docData = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      fullName: docData['fullName'] ?? '',
      name: docData['name'] ?? '',
      email: docData['email'] ?? '',
      phoneNumber: docData['phoneNumber'] ?? '',
      birthDay: docData['birthDay'] ?? '',
      gender: docData['gender'] ?? '',
      photoUrl: docData['photoUrl'] ?? '',
    );
  }
}
