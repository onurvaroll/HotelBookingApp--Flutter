import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HotelModel extends GetxController {
  final String id;
  final String hotelName;
  final String location;
  final double perHour;
  final double starRating;
  final String coverPhoto;
  final List<String> detailsPhotos;

  HotelModel({
    required this.id,
    required this.hotelName,
    required this.location,
    required this.perHour,
    required this.starRating,
    required this.coverPhoto,
    required this.detailsPhotos});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hotelName': hotelName,
      'location': location,
      'perHour': perHour,
      'starRating': starRating,
      'coverPhoto': coverPhoto,
      'detailsPhotos': detailsPhotos,
    };
  }

  factory HotelModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return HotelModel(
      id: doc.id,
      hotelName: data['hotelName'] ?? '',
      location: data['location'] ?? '',
      perHour: data['perHour']?.toDouble() ?? 0.0,
      starRating: data['starRating']?.toDouble() ?? 0.0,
      coverPhoto: data['coverPhoto'] ?? '',
      detailsPhotos: List<String>.from(data['detailsPhotos'] ?? []),
    );
  }

  factory HotelModel.fromMap(Map<String, dynamic> data) {
    return HotelModel(
      id: data['id'],
      hotelName: data['hotelName'],
      location: data['location'],
      perHour: data['perHour'],
      starRating: data['starRating'],
      coverPhoto: data['coverPhoto'],
      detailsPhotos: List<String>.from(data['detailsPhotos']),
    );
  }

  factory HotelModel.todocument(DocumentSnapshot? doc) {
    if (doc == null || doc.data() == null) {
      return HotelModel(
          id: '',
          hotelName: '',
          location: '',
          perHour:0.0,
          starRating: 0.0,
          coverPhoto: '',
          detailsPhotos: []
      );
    }

    var docData = doc.data() as Map<String, dynamic>;
    return HotelModel(
        id: doc.id,
        hotelName: docData['hotelName']??"",
        location: docData['location']??"",
        perHour: docData['perHour']??0.0,
        starRating: docData['starRating']??0.0,
        coverPhoto: docData['coverPhoto']??"",
        detailsPhotos: docData['detailsPhotos']);
  }

}
